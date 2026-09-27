<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','course_number') || $check_field('add','course_number') || $check_field('set','course_number')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="课程编号" prop="course_number">
					<el-input id="course_number" v-model="form['course_number']" placeholder="请输入课程编号"
							  v-if="user_group === '管理员' || (form['evaluation_information_id'] && $check_field('set','course_number')) || (!form['evaluation_information_id'] && $check_field('add','course_number'))" :disabled="disabledObj['course_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_number')">{{form['course_number']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','course_name') || $check_field('add','course_name') || $check_field('set','course_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="课程名称" prop="course_name">
					<el-input id="course_name" v-model="form['course_name']" placeholder="请输入课程名称"
							  v-if="user_group === '管理员' || (form['evaluation_information_id'] && $check_field('set','course_name')) || (!form['evaluation_information_id'] && $check_field('add','course_name'))" :disabled="disabledObj['course_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_name')">{{form['course_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','teacher') || $check_field('add','teacher') || $check_field('set','teacher')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="任课老师" prop="teacher">
						<el-select v-if="user_group === '管理员' || (form['evaluation_information_id'] && $check_field('set','teacher')) || (!form['evaluation_information_id'] && $check_field('add','teacher'))" id="teacher" v-model="form['teacher']" :disabled="disabledObj['teacher_isDisabled']">
							<el-option v-for="o in list_user_teacher" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','teacher')" id="teacher" v-model="form['teacher']" :disabled="true">
							<el-option v-for="o in list_user_teacher" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','class_name') || $check_field('add','class_name') || $check_field('set','class_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="班级名称" prop="class_name">
					<el-input id="class_name" v-model="form['class_name']" placeholder="请输入班级名称"
							  v-if="user_group === '管理员' || (form['evaluation_information_id'] && $check_field('set','class_name')) || (!form['evaluation_information_id'] && $check_field('add','class_name'))" :disabled="disabledObj['class_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','class_name')">{{form['class_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','evaluation_name') || $check_field('add','evaluation_name') || $check_field('set','evaluation_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="测评名称" prop="evaluation_name">
					<el-input id="evaluation_name" v-model="form['evaluation_name']" placeholder="请输入测评名称"
							  v-if="user_group === '管理员' || (form['evaluation_information_id'] && $check_field('set','evaluation_name')) || (!form['evaluation_information_id'] && $check_field('add','evaluation_name'))" :disabled="disabledObj['evaluation_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','evaluation_name')">{{form['evaluation_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','evaluation_start_time') || $check_field('add','evaluation_start_time') || $check_field('set','evaluation_start_time')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="测评开始时间" prop="evaluation_start_time">
					<el-date-picker :disabled="disabledObj['evaluation_start_time_isDisabled']" v-if="user_group === '管理员' || (form['evaluation_information_id'] && $check_field('set','evaluation_start_time')) || (!form['evaluation_information_id'] && $check_field('add','evaluation_start_time'))" id="evaluation_start_time"
						v-model="form['evaluation_start_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','evaluation_start_time')">{{form['evaluation_start_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','evaluation_end_time') || $check_field('add','evaluation_end_time') || $check_field('set','evaluation_end_time')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="测评结束时间" prop="evaluation_end_time">
					<el-date-picker :disabled="disabledObj['evaluation_end_time_isDisabled']" v-if="user_group === '管理员' || (form['evaluation_information_id'] && $check_field('set','evaluation_end_time')) || (!form['evaluation_information_id'] && $check_field('add','evaluation_end_time'))" id="evaluation_end_time"
						v-model="form['evaluation_end_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','evaluation_end_time')">{{form['evaluation_end_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "evaluation_information_id",
				url_add: "~/api/evaluation_information/add?",
				url_set: "~/api/evaluation_information/set?",
				url_get_obj: "~/api/evaluation_information/get_obj?",
				url_upload: "~/api/evaluation_information/upload?",

				query: {
					"evaluation_information_id": 0,
				},

				form: {
					"course_number":'', // 课程编号
					"course_name":'', // 课程名称
					"teacher": 0, // 任课老师
					"class_name":'', // 班级名称
					"evaluation_name":'', // 测评名称
					"evaluation_start_time":'', // 测评开始时间
					"evaluation_end_time":'', // 测评结束时间
					"evaluation_information_id": 0, // ID

				},
				disabledObj:{
					"course_number_isDisabled": false,
					"course_name_isDisabled": false,
					"teacher_isDisabled": false,
					"class_name_isDisabled": false,
					"evaluation_name_isDisabled": false,
					"evaluation_start_time_isDisabled": false,
					"evaluation_end_time_isDisabled": false,
				},
				// 用户列表
				list_user_teacher: [],

			}
		},
		methods: {
			/**
			 * 获取教师用户列表
			 */
			async get_list_user_teacher() {
                // if(this.user_group !== "管理员" && this.form["teacher"] === 0) {
                //     this.form["teacher"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=教师");
                if(json.result && json.result.list){
                    this.list_user_teacher = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
			get_user_teacher(id){
				var obj = this.list_user_teacher.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},

			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
				// 获取缓存数据附加
				form = $.db.get("form");
				$.push(this.form ,form);
				/**
				* 请求列表前
				* @param {Object} param
				*/
				var user_group = this.user.user_group;
				if (user_group !== "管理员") {
					switch (user_group) {
						case "任课老师":
							if(param["teacher"] > 0){
								param["teacher"] = this.user.user_id;
							}
							break;
					}
				}
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							if(dbKey === "charging_standard"){
								this.form['charging_rules'] = form[dbKey];
								this.disabledObj['charging_rules_isDisabled'] = true;
							};
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
				this.form["evaluation_start_time"] = this.$toTime(parseInt(this.form["evaluation_start_time"]),"yyyy-MM-dd hh:mm:ss")
				this.form["evaluation_end_time"] = this.$toTime(parseInt(this.form["evaluation_end_time"]),"yyyy-MM-dd hh:mm:ss")
				$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){
				if(parseInt(this.form["evaluation_start_time"]) > 9999){
					this.form["evaluation_start_time"] = this.$toTime(parseInt(this.form["evaluation_start_time"]),"yyyy-MM-dd hh:mm:ss")
				}
				if(parseInt(this.form["evaluation_end_time"]) > 9999){
					this.form["evaluation_end_time"] = this.$toTime(parseInt(this.form["evaluation_end_time"]),"yyyy-MM-dd hh:mm:ss")
				}

			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/evaluation_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/evaluation_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/evaluation_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/evaluation_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/evaluation_information/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
			this.get_list_user_teacher();
		}
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
</style>
