<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','course_number') || $check_field('add','course_number') || $check_field('set','course_number')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="课程编号" prop="course_number">
					<el-input id="course_number" v-model="form['course_number']" placeholder="请输入课程编号"
							  v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','course_number')) || (!form['student_rating_id'] && $check_field('add','course_number'))" :disabled="disabledObj['course_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_number')">{{form['course_number']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','course_name') || $check_field('add','course_name') || $check_field('set','course_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="课程名称" prop="course_name">
					<el-input id="course_name" v-model="form['course_name']" placeholder="请输入课程名称"
							  v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','course_name')) || (!form['student_rating_id'] && $check_field('add','course_name'))" :disabled="disabledObj['course_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_name')">{{form['course_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','teacher') || $check_field('add','teacher') || $check_field('set','teacher')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="任课老师" prop="teacher">
						<el-select v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','teacher')) || (!form['student_rating_id'] && $check_field('add','teacher'))" id="teacher" v-model="form['teacher']" :disabled="disabledObj['teacher_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','class_name')) || (!form['student_rating_id'] && $check_field('add','class_name'))" :disabled="disabledObj['class_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','class_name')">{{form['class_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','evaluation_name') || $check_field('add','evaluation_name') || $check_field('set','evaluation_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="测评名称" prop="evaluation_name">
					<el-input id="evaluation_name" v-model="form['evaluation_name']" placeholder="请输入测评名称"
							  v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','evaluation_name')) || (!form['student_rating_id'] && $check_field('add','evaluation_name'))" :disabled="disabledObj['evaluation_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','evaluation_name')">{{form['evaluation_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','content_of_courses') || $check_field('add','content_of_courses') || $check_field('set','content_of_courses')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="教学内容" prop="content_of_courses">
					<el-input-number id="content_of_courses" v-model.number="form['content_of_courses']"
						v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','content_of_courses')) || (!form['student_rating_id'] && $check_field('add','content_of_courses'))"></el-input-number>
					<div v-else-if="$check_field('get','content_of_courses')">{{form['content_of_courses']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','teaching_level_') || $check_field('add','teaching_level_') || $check_field('set','teaching_level_')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="教学水平" prop="teaching_level_">
					<el-input-number id="teaching_level_" v-model.number="form['teaching_level_']"
						v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','teaching_level_')) || (!form['student_rating_id'] && $check_field('add','teaching_level_'))"></el-input-number>
					<div v-else-if="$check_field('get','teaching_level_')">{{form['teaching_level_']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','teaching_method') || $check_field('add','teaching_method') || $check_field('set','teaching_method')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="教学方法" prop="teaching_method">
					<el-input-number id="teaching_method" v-model.number="form['teaching_method']"
						v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','teaching_method')) || (!form['student_rating_id'] && $check_field('add','teaching_method'))"></el-input-number>
					<div v-else-if="$check_field('get','teaching_method')">{{form['teaching_method']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','teaching_effectiveness') || $check_field('add','teaching_effectiveness') || $check_field('set','teaching_effectiveness')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="教学效果" prop="teaching_effectiveness">
					<el-input-number id="teaching_effectiveness" v-model.number="form['teaching_effectiveness']"
						v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','teaching_effectiveness')) || (!form['student_rating_id'] && $check_field('add','teaching_effectiveness'))"></el-input-number>
					<div v-else-if="$check_field('get','teaching_effectiveness')">{{form['teaching_effectiveness']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','total_score') || $check_field('add','total_score') || $check_field('set','total_score')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="总分" prop="total_score">
					<el-input id="total_score" v-model="form['total_score']" placeholder="请输入总分"
							  v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','total_score')) || (!form['student_rating_id'] && $check_field('add','total_score'))"  @focus="set_total_score()" :disabled="disabledObj['total_score_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','total_score')">{{form['total_score']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','student_number') || $check_field('add','student_number') || $check_field('set','student_number')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="学号" prop="student_number">
						<div v-if="user_group !== '管理员'">
							{{ get_user_session_student_number(form['student_number']) }}
							<!--<el-input id="business_name" v-model="form['student_number']" placeholder="请输入学号"-->
							<!--v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','student_number')) || (!form['student_rating_id'] && $check_field('add','student_number'))" :disabled="disabledObj['student_number_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','student_number')">{{form['student_number']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','student_number')) || (!form['student_rating_id'] && $check_field('add','student_number'))" id="student_number" v-model="form['student_number']" :disabled="disabledObj['student_number_isDisabled']">
								<el-option v-for="o in list_user_student_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','student_number')" id="student_number" v-model="form['student_number']" :disabled="true">
								<el-option v-for="o in list_user_student_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="student_number" v-model="form['student_number']" :disabled="disabledObj['student_number_isDisabled']">
							<el-option v-for="o in list_user_student_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','student_name') || $check_field('add','student_name') || $check_field('set','student_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="学生姓名" prop="student_name">
					<el-input id="student_name" v-model="form['student_name']" placeholder="请输入学生姓名"
							  v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','student_name')) || (!form['student_rating_id'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','student_name')">{{form['student_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','teaching_suggestions') || $check_field('add','teaching_suggestions') || $check_field('set','teaching_suggestions')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="教学建议" prop="teaching_suggestions">
					<el-input type="textarea" id="teaching_suggestions" v-model="form['teaching_suggestions']" placeholder="请输入教学建议"
						v-if="user_group === '管理员' || (form['student_rating_id'] && $check_field('set','teaching_suggestions')) || (!form['student_rating_id'] && $check_field('add','teaching_suggestions'))" :disabled="disabledObj['teaching_suggestions_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','teaching_suggestions')">{{form['teaching_suggestions']}}</div>
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
				field: "student_rating_id",
				url_add: "~/api/student_rating/add?",
				url_set: "~/api/student_rating/set?",
				url_get_obj: "~/api/student_rating/get_obj?",
				url_upload: "~/api/student_rating/upload?",

				query: {
					"student_rating_id": 0,
				},

				form: {
					"course_number":'', // 课程编号
					"course_name":'', // 课程名称
					"teacher": 0, // 任课老师
					"class_name":'', // 班级名称
					"evaluation_name":'', // 测评名称
					"content_of_courses":0, // 教学内容
					"teaching_level_":0, // 教学水平
					"teaching_method":0, // 教学方法
					"teaching_effectiveness":0, // 教学效果
					"total_score":'', // 总分
					"student_number": 0, // 学号
					"student_name":'', // 学生姓名
					"teaching_suggestions":'', // 教学建议
					"student_rating_id": 0, // ID

				},
				disabledObj:{
					"course_number_isDisabled": false,
					"course_name_isDisabled": false,
					"teacher_isDisabled": false,
					"class_name_isDisabled": false,
					"evaluation_name_isDisabled": false,
					"total_score_isDisabled": false,
					"student_number_isDisabled": false,
					"student_name_isDisabled": false,
					"teaching_suggestions_isDisabled": false,
				},
				// 用户列表
				list_user_teacher: [],
				// 用户列表
				list_user_student_number: [],
				// 用户组
				group_user_student_number: "",

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
			set_total_score(){
				this.form.total_score =this.form.content_of_courses + this.form.teaching_level_ + this.form.teaching_method + this.form.teaching_effectiveness
			},
			/**
			 * 获取学生用户列表
			 */
			async get_list_user_student_number() {
                // if(this.user_group !== "管理员" && this.form["student_number"] === 0) {
                //     this.form["student_number"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=学生");
                if(json.result && json.result.list){
                    this.list_user_student_number = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
			/**
			 * 获取学生用户组
			 */
			async get_group_user_student_number() {
				this.form["student_number"] = this.user.user_id;
				var json = await this.$get("~/api/user_group/get_obj?name=学生");
				if(json.result && json.result.obj){
					this.group_user_student_number = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_student_number(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_student_number.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
						for (let key in _this.form) {
							arrForm.push(key)
						}
						for (var i=0;i<arr.length;i++){
							for (var j=0;j<arrForm.length;j++){
								if (arr[i]===arrForm[j]){
									if (arr[i]!=="student_number") {
										_this.form[arrForm[j]] = res.result.obj[arr[i]]
										_this.disabledObj[arrForm[j] + '_isDisabled'] = true
										break;
									}else {
										_this.disabledObj[arrForm[j] + '_isDisabled'] = true
									}
								}
							}
						}
					}
				});
			},
			get_user_student_number(id){
				var obj = this.list_user_student_number.getObj({"user_id":id});
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
						case "学号":
							if(param["student_number"] > 0){
								param["student_number"] = this.user.user_id;
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
					bl = this.$check_action('/student_rating/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/student_rating/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/student_rating/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/student_rating/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/student_rating/view','get');
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
			this.get_list_user_student_number();
			this.get_group_user_student_number();
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
