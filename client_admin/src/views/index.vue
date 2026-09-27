<template>
	<div class="page_root" id="root_index">
		<div class="warp">
			<div class="container-fluid">
				<el-row>
					<el-col :span="4">
						<mm_label bg_color="bg_purple" icon="el-icon-user-solid" :url="url_user_count" unit="人"
								  title="用户数量"></mm_label>
					</el-col>
				</el-row>

				<el-row>
					<el-col v-if="user_group == '管理员' || $check_figure('/student_rating/table')" :span="8">
						<div class="card chart">
							<newLineChart v-if="line_obj_student_rating.values.length > 0" id="line_obj_student_rating" :vm="line_obj_student_rating" :title="'学生评分统计'">
							</newLineChart>
							<div v-if="!line_obj_student_rating.values.length">学生评分没有符合条件的数据</div>
						</div>
					</el-col>
					<el-col v-if="user_group == '管理员' || $check_figure('/evaluation_results/table')" :span="8">
						<div class="card chart">
							<pieChart v-if="list_evaluation_results.length" id="list_evaluation_results" :list="list_evaluation_results" :title="'测评结果统计'"></pieChart>
							<div v-if="!list_evaluation_results.length">测评结果没有符合条件的数据</div>
						</div>
					</el-col>
				</el-row>
			</div>
		</div>
	</div>
</template>
<script>
	import mixin from "@/mixins/page.js";
	import pieChart from "@/components/charts/pie_chart";
	import barChart from "@/components/charts/bar_chart";
	import newBarChart from "@/components/charts/new_bar_chart";
	import lineChart from "@/components/charts/line_chart";
	import newLineChart from "@/components/charts/new_line_chart";
	import mm_label from "@/components/mm_label.vue";
	export default {
		mixins: [mixin],
		name: "Home",
		components: {
			pieChart,
			barChart,
			newBarChart,
			lineChart,
			newLineChart,
			mm_label
		},
		data() {
			return {
				isAdmin: false,
				recognitionType: "",
				activeName: "third",
				line_obj_student_rating:{
					names:[],
					xAxis: [],
					values:[]
				},
				list_evaluation_results: [],
				url_user_count: "~/api/user/count?",
			};
		},
		created() {
			this.getUserInfo();
			// 执行学生评分数据获取
			this.get_list_student_rating();
			// 执行测评结果数据获取
			this.get_list_evaluation_results();
			
			
		},
		mounted() {},
		methods: {
			async get_nickname(list,flag){
				if (flag) {
					for (let i=0;i<list.length;i++){
						await this.$get(
								"~/api/user/get_obj?user_id="+list[i],
								null,
								(json) => {
									if (json.result) {
										list[i] = json.result.obj.nickname;
									}
								});
					}
				}else {
					for (let i=0;i<list.length;i++){
						await this.$get(
								"~/api/user/get_obj?user_id="+list[i].name,
								null,
								(json) => {
									if (json.result) {
										list[i].name = json.result.obj.nickname;
									}
								});
					}
				}
			},
			// 获取学生评分统计折线图
			async get_list_student_rating() {
				let group_by_value = "course_number";
				let data = {};
				let flag = false;
				let user_group = this.$store.state.user.user_group;
				let user_id = this.$store.state.user.user_id;
				if (user_group!='管理员'){
					if (user_group=="教师"){
						data.teacher = user_id;
					}
					if (user_group=="学生"){
						data.student_number = user_id;
					}
				}
				await this.$get(
					"~/api/student_rating/get_list?groupby="+group_by_value,data,
					(json) => {
						if (json.result) {
							let list = json.result.list;
							let name_list = [];
							for (let i=0;i<list.length;i++){
								name_list.push(list[i].course_number);
							}
							this.line_obj_student_rating.names = name_list;
							this.get_list_student_rating_sub("course_number",flag);
						}
				});
			},
			async get_list_student_rating_sub(v1,names_flag) {
				let data = {};
				let flag = false;
				let user_group = this.$store.state.user.user_group;
				let user_id = this.$store.state.user.user_id;
				if (user_group!='管理员'){
					if (user_group=="教师"){
						data.teacher = user_id;
					}
					if (user_group=="学生"){
						data.student_number = user_id;
					}
				}
				await this.$get(
					"~/api/student_rating/get_list?groupby=evaluation_name",data,
					(json) => {
						if (json.result) {
							let list = json.result.list;
							let xAxis_list = [];
							for (let i=0;i<list.length;i++){
								xAxis_list.push(list[i].evaluation_name);
							}
							this.line_obj_student_rating.xAxis = xAxis_list;
							this.get_list_student_rating_sub_sub(v1,"evaluation_name",names_flag,flag);
						}
				});
			},
			async get_list_student_rating_sub_sub(v1,v2,names_flag,xAxis_flag) {
				let data_str = "{\""+v1+"\":\"\",\""+v2+"\":\"\"}";
				let data = JSON.parse(data_str);
				let user_group = this.$store.state.user.user_group;
				let user_id = this.$store.state.user.user_id;
				if (user_group!='管理员'){
					if (user_group=="教师"){
						data.teacher = user_id;
					}
					if (user_group=="学生"){
						data.student_number = user_id;
					}
				}
				for (let i=0;i<this.line_obj_student_rating.xAxis.length;i++){
					let list = []
					for (let j=0;j<this.line_obj_student_rating.names.length;j++){
						data[v2] = this.line_obj_student_rating.xAxis[i];
						data[v1] = this.line_obj_student_rating.names[j];
						await this.$get(
								"~/api/student_rating/sum?field=total_score",
								data,
								(json) => {
									if (json.result) {
										list[j] = json.result;
									}else {
										list[j] = 0;
									}
								});
					}
					this.line_obj_student_rating.values.push(list)
				}
				if (names_flag){
					this.get_nickname(this.line_obj_student_rating.names,true);
				}
				if (xAxis_flag){
					this.get_nickname(this.line_obj_student_rating.xAxis,true);
				}
			},
			// 获取测评结果统计图数据
			get_list_evaluation_results() {
				let data = {};
				let flag = false;
				let user_group = this.$store.state.user.user_group;
				let user_id = this.$store.state.user.user_id;
				if (user_group!='管理员'){
					if (user_group=="教师"){
						data.teacher = user_id;
					}
				}
				this.$get("~/api/evaluation_results/list_group?groupby=grade", data, (json) => {
					if (json.result) {
						var list = json.result.list;
						this.list_evaluation_results = list.map((o) => {
							return {
								name: o[1],
								value: o[0]
							};
						});
						if (flag){
							this.get_nickname(this.list_evaluation_results,false);
						}
					}
				});
			},
				getUserInfo(){
					let userGroup = window.localStorage.getItem('user_group');
						if(userGroup){
						let _userGroup =JSON.parse(userGroup);
						let _info = JSON.parse(_userGroup.value);
						this.isAdmin = _info["user_group"] == "管理员" ? true : false;
					}
			}

		},
		computed:{
			recognitionHeight(){
				if(this.recognitionType === "face"){
					return "1070px"
				}else{
					return "1180px"
				}
			},
			recognitionUrl(){
					if(this.recognitionType === "face"){
					return "https://www.sk-ai.com/Experience/face-compare"
				}else{
					return "https://www.sk-ai.com/Experience/recognition?type="
				}
			}
		}
	};
</script>

<style scoped="scoped">
	.chart {
		display: block;
		width: 100%;
		height: 400px;
		padding: 1rem;
		position: relative;
	}

	.el-col {
		padding: 0.5rem;
	}

	.card {
		overflow: hidden;
	}
	
	.iframe_box ,.iframe_box_change{
		width: 100%;
		height: 1180px;
		position: relative;
		margin-top: 25px;
	}
	.iframe_box_change{
		height: 580px;
		padding-top: 50px;
	}
.iframe_box	.iframe_box_content, .iframe_box_change .iframe_box_content{
	width: 100%;
	height: 100%;
}
.iframe_box_top{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100px;
	font-size: 25px;
	line-height: 100px;
	background: #fff;
	z-index: 99999999;
	padding-left: 50px;
}
</style>
