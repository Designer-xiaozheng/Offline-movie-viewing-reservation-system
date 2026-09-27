<template>
	<div>
		<el-form-item v-if="$check_register_field('add','student_number','/student/view')" label="学号" prop="student_number">
		<el-input id="student_number" v-model="form['student_number']" placeholder="请输入学号"></el-input>
		</el-form-item>
		<el-form-item v-if="$check_register_field('add','student_name','/student/view')" label="学生姓名" prop="student_name">
		<el-input id="student_name" v-model="form['student_name']" placeholder="请输入学生姓名"></el-input>
		</el-form-item>
		<el-form-item v-if="$check_register_field('add','class_name','/student/view')" label="班级名称" prop="class_name">
		<el-input id="class_name" v-model="form['class_name']" placeholder="请输入班级名称"></el-input>
		</el-form-item>

	</div>
</template>

<script>
	import mixin from "@/mixins/component.js";

	export default {
		mixins: [mixin],
		props:{

			form:{
				type: Object,
				default: function(){
					return {
						"student_number":'',
						"student_name":'',
						"class_name":'',
					}
				}
			},

		},
		data() {
			return {
				field: "student_id",
				url_add: "~/api/student/add?",
				url_set: "~/api/student/set?",
				url_upload: "~/api/student/upload?",

				rules: {
					"student_number": [ {required: true,message: '学号不能为空'}, ],
					"student_name": [ ],
					"class_name": [ ],
				}

			}
		},
		methods: {

		},
		created() {
		}
	}
</script>
