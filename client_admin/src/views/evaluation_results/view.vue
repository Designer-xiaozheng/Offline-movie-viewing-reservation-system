<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','course_number') || $check_field('add','course_number') || $check_field('set','course_number')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="课程编号" prop="course_number">
					<el-input id="course_number" v-model="form['course_number']" placeholder="请输入课程编号"
							  v-if="user_group === '管理员' || (form['evaluation_results_id'] && $check_field('set','course_number')) || (!form['evaluation_results_id'] && $check_field('add','course_number'))" :disabled="disabledObj['course_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_number')">{{form['course_number']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','course_name') || $check_field('add','course_name') || $check_field('set','course_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="课程名称" prop="course_name">
					<el-input id="course_name" v-model="form['course_name']" placeholder="请输入课程名称"
							  v-if="user_group === '管理员' || (form['evaluation_results_id'] && $check_field('set','course_name')) || (!form['evaluation_results_id'] && $check_field('add','course_name'))" :disabled="disabledObj['course_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_name')">{{form['course_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','teacher') || $check_field('add','teacher') || $check_field('set','teacher')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="任课老师" prop="teacher">
						<el-select v-if="user_group === '管理员' || (form['evaluation_results_id'] && $check_field('set','teacher')) || (!form['evaluation_results_id'] && $check_field('add','teacher'))" id="teacher" v-model="form['teacher']" :disabled="disabledObj['teacher_isDisabled']">
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
			<el-col v-if="user_group === '管理员' || $check_field('get','evaluation_name') || $check_field('add','evaluation_name') || $check_field('set','evaluation_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="测评名称" prop="evaluation_name">
					<el-input id="evaluation_name" v-model="form['evaluation_name']" placeholder="请输入测评名称"
							  v-if="user_group === '管理员' || (form['evaluation_results_id'] && $check_field('set','evaluation_name')) || (!form['evaluation_results_id'] && $check_field('add','evaluation_name'))" :disabled="disabledObj['evaluation_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','evaluation_name')">{{form['evaluation_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','class_name') || $check_field('add','class_name') || $check_field('set','class_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="班级名称" prop="class_name">
					<el-input id="class_name" v-model="form['class_name']" placeholder="请输入班级名称"
							  v-if="user_group === '管理员' || (form['evaluation_results_id'] && $check_field('set','class_name')) || (!form['evaluation_results_id'] && $check_field('add','class_name'))" :disabled="disabledObj['class_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','class_name')">{{form['class_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','content_of_courses') || $check_field('add','content_of_courses') || $check_field('set','content_of_courses')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="教学内容" prop="content_of_courses">
					<el-input id="content_of_courses" v-model="form['content_of_courses']" placeholder="请输入教学内容"
							  v-if="user_group === '管理员' || (form['evaluation_results_id'] && $check_field('set','content_of_courses')) || (!form['evaluation_results_id'] && $check_field('add','content_of_courses'))" :disabled="disabledObj['content_of_courses_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','content_of_courses')">{{form['content_of_courses']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','teaching_level_') || $check_field('add','teaching_level_') || $check_field('set','teaching_level_')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="教学水平" prop="teaching_level_">
					<el-input id="teaching_level_" v-model="form['teaching_level_']" placeholder="请输入教学水平"
							  v-if="user_group === '管理员' || (form['evaluation_results_id'] && $check_field('set','teaching_level_')) || (!form['evaluation_results_id'] && $check_field('add','teaching_level_'))" :disabled="disabledObj['teaching_level__isDisabled']"></el-input>
					<div v-else-if="$check_field('get','teaching_level_')">{{form['teaching_level_']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','teaching_method') || $check_field('add','teaching_method') || $check_field('set','teaching_method')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="教学方法" prop="teaching_method">
					<el-input id="teaching_method" v-model="form['teaching_method']" placeholder="请输入教学方法"
							  v-if="user_group === '管理员' || (form['evaluation_results_id'] && $check_field('set','teaching_method')) || (!form['evaluation_results_id'] && $check_field('add','teaching_method'))" :disabled="disabledObj['teaching_method_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','teaching_method')">{{form['teaching_method']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','teaching_effectiveness') || $check_field('add','teaching_effectiveness') || $check_field('set','teaching_effectiveness')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="教学效果" prop="teaching_effectiveness">
					<el-input id="teaching_effectiveness" v-model="form['teaching_effectiveness']" placeholder="请输入教学效果"
							  v-if="user_group === '管理员' || (form['evaluation_results_id'] && $check_field('set','teaching_effectiveness')) || (!form['evaluation_results_id'] && $check_field('add','teaching_effectiveness'))" :disabled="disabledObj['teaching_effectiveness_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','teaching_effectiveness')">{{form['teaching_effectiveness']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','grade') || $check_field('add','grade') || $check_field('set','grade')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="等级" prop="grade">
					<el-select id="grade" v-model="form['grade']"
						v-if="user_group === '管理员' || (form['evaluation_results_id'] && $check_field('set','grade')) || (!form['evaluation_results_id'] && $check_field('add','grade'))">
						<el-option v-for="o in list_grade" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','grade')">{{form['grade']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','student_suggestions') || $check_field('add','student_suggestions') || $check_field('set','student_suggestions')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="学生建议" prop="student_suggestions">
					<el-input type="textarea" id="student_suggestions" v-model="form['student_suggestions']" placeholder="请输入学生建议"
						v-if="user_group === '管理员' || (form['evaluation_results_id'] && $check_field('set','student_suggestions')) || (!form['evaluation_results_id'] && $check_field('add','student_suggestions'))" :disabled="disabledObj['student_suggestions_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','student_suggestions')">{{form['student_suggestions']}}</div>
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
				field: "evaluation_results_id",
				url_add: "~/api/evaluation_results/add?",
				url_set: "~/api/evaluation_results/set?",
				url_get_obj: "~/api/evaluation_results/get_obj?",
				url_upload: "~/api/evaluation_results/upload?",

				query: {
					"evaluation_results_id": 0,
				},

				form: {
					"course_number":'', // 课程编号
					"course_name":'', // 课程名称
					"teacher": 0, // 任课老师
					"evaluation_name":'', // 测评名称
					"class_name":'', // 班级名称
					"content_of_courses":'', // 教学内容
					"teaching_level_":'', // 教学水平
					"teaching_method":'', // 教学方法
					"teaching_effectiveness":'', // 教学效果
					"grade":'', // 等级
					"student_suggestions":'', // 学生建议
					"evaluation_results_id": 0, // ID

				},
				disabledObj:{
					"course_number_isDisabled": false,
					"course_name_isDisabled": false,
					"teacher_isDisabled": false,
					"evaluation_name_isDisabled": false,
					"class_name_isDisabled": false,
					"content_of_courses_isDisabled": false,
					"teaching_level__isDisabled": false,
					"teaching_method_isDisabled": false,
					"teaching_effectiveness_isDisabled": false,
					"grade_isDisabled": false,
					"student_suggestions_isDisabled": false,
				},
				// 用户列表
				list_user_teacher: [],
				//等级选项列表
				list_grade: ['优秀','良好','合格','不合格'],

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
				$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){

			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/evaluation_results/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/evaluation_results/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/evaluation_results/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/evaluation_results/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/evaluation_results/view','get');
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
