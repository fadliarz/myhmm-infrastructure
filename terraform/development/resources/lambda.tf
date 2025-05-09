resource "aws_lambda_function" "course-lambda" {
  function_name = var.course_lambda_name
  role          = aws_iam_role.course-lambda-iam-role.arn
  handler       = var.course_lambda_courseEventHandler_name
  runtime       = "nodejs20.x"
  filename      = "./store/empty-lambda.zip"

  timeout = 30

  environment {
    variables = {
      LESSON_TABLE   = var.dynamodb_lesson_table_name
      CLASS_TABLE    = var.dynamodb_class_table_name
      CATEGORY_TABLE = var.dynamodb_category_table_name
    }
  }
}


resource "aws_lambda_event_source_mapping" "course-lambda-event-source-mapping" {
  function_name    = aws_lambda_function.course-lambda.function_name
  event_source_arn = aws_sqs_queue.course-queue.arn
  batch_size       = 1
}


/**


 */


resource "aws_lambda_function" "lesson-lambda" {
  function_name = var.lesson_lambda_name
  role          = aws_iam_role.lesson-lambda-iam-role.arn
  handler       = var.lesson_lambda_lessonEventHandler_name
  runtime       = "nodejs20.x"
  filename      = "./store/empty-lambda.zip"

  timeout = 30

  environment {
    variables = {
      VIDEO_TABLE      = var.dynamodb_video_table_name
      ATTACHMENT_TABLE = var.dynamodb_attachment_table_name
      COURSE_TABLE     = var.dynamodb_course_table_name
    }
  }
}


resource "aws_lambda_event_source_mapping" "lesson-lambda-event-source-mapping" {
  function_name    = aws_lambda_function.lesson-lambda.function_name
  event_source_arn = aws_sqs_queue.lesson-queue.arn
  batch_size       = 1
}


/**


 */


resource "aws_lambda_function" "class-lambda" {
  function_name = var.class_lambda_name
  role          = aws_iam_role.class-lambda-iam-role.arn
  handler       = var.class_lambda_classEventHandler_name
  runtime       = "nodejs20.x"
  filename      = "./store/empty-lambda.zip"

  timeout = 30

  environment {
    variables = {
      CLASS_ASSIGNMENT_TABLE = var.dynamodb_class_assignment_table_name
      ENROLLMENT_TABLE       = var.dynamodb_enrollment_table_name
      ENROLLMENT_TABLE_GSI   = var.dynamodb_enrollment_table_gsi_name
      INSTRUCTOR_TABLE       = var.dynamodb_instructor_table_name
      INSTRUCTOR_TABLE_GSI   = var.dynamodb_instructor_table_gsi_name
      COURSE_TABLE           = var.dynamodb_course_table_name
      USER_TABLE             = var.dynamodb_user_table_name
      USER_ASSIGNMENT_TABLE  = var.dynamodb_user_assignment_table_name
    }
  }
}


resource "aws_lambda_event_source_mapping" "class-lambda-event-source-mapping" {
  function_name    = aws_lambda_function.class-lambda.function_name
  event_source_arn = aws_sqs_queue.class-queue.arn
  batch_size       = 1
}


/**


 */


resource "aws_lambda_function" "category-lambda" {
  function_name = var.category_lambda_name
  role          = aws_iam_role.category-lambda-iam-role.arn
  handler       = var.category_lambda_categoryEventHandler_name
  runtime       = "nodejs20.x"
  filename      = "./store/empty-lambda.zip"

  timeout = 30

  environment {
    variables = {
      CATEGORY_TABLE = var.dynamodb_category_table_name
      COURSE_TABLE   = var.dynamodb_course_table_name
    }
  }
}


resource "aws_lambda_event_source_mapping" "category-lambda-event-source-mapping" {
  function_name    = aws_lambda_function.category-lambda.function_name
  event_source_arn = aws_sqs_queue.category-queue.arn
  batch_size       = 1
}


/**


 */


resource "aws_lambda_function" "enrollment-and-class-assignment-lambda" {
  function_name = var.enrollment_and_class_assignment_lambda_name
  role          = aws_iam_role.enrollment-and-class-assignment-lambda-iam-role.arn
  handler       = var.enrollment_and_class_assignment_lambda_enrollmentAndClassAssignmentEventHandler_name
  runtime       = "nodejs20.x"
  filename      = "./store/empty-lambda.zip"

  timeout = 30

  environment {
    variables = {
      USER_ASSIGNMENT_TABLE  = var.dynamodb_user_assignment_table_name
      CLASS_ASSIGNMENT_TABLE = var.dynamodb_class_assignment_table_name
      ENROLLMENT_TABLE       = var.dynamodb_enrollment_table_name
    }
  }
}


resource "aws_lambda_event_source_mapping" "enrollment-and-class-assignment-lambda-event-source-mapping" {
  function_name    = aws_lambda_function.enrollment-and-class-assignment-lambda.function_name
  event_source_arn = aws_sqs_queue.enrollment-and-class-assignment-queue.arn
  batch_size       = 1
}


/**


 */


resource "aws_lambda_function" "tag-lambda" {
  function_name = var.tag_lambda_name
  role          = aws_iam_role.tag-lambda-iam-role.arn
  handler       = var.tag_lambda_tagEventHandler_name
  runtime       = "nodejs20.x"
  filename      = "./store/empty-lambda.zip"

  timeout = 30

  environment {
    variables = {
      TAG_TABLE         = var.dynamodb_tag_table_name
      SCHOLARSHIP_TABLE = var.dynamodb_scholarship_table_name
    }
  }
}


resource "aws_lambda_event_source_mapping" "tag-lambda-event-source-mapping" {
  function_name    = aws_lambda_function.tag-lambda.function_name
  event_source_arn = aws_sqs_queue.tag-queue.arn
  batch_size       = 1
}


/**


 */


variable "enrollment_lambda_enrollmentEventHandler_name" {
  type    = string
  default = "handleEnrollmentEvent.handleEnrollmentEvent"
}


variable "course_lambda_name" {
  type    = string
  default = "COURSE_LAMBDA"
}


variable "course_lambda_courseEventHandler_name" {
  type    = string
  default = "handleCourseEvent.handleCourseEvent"
}


variable "lesson_lambda_name" {
  type    = string
  default = "LESSON_LAMBDA"
}


variable "lesson_lambda_lessonEventHandler_name" {
  type    = string
  default = "handleLessonEvent.handleLessonEvent"
}


variable "class_lambda_name" {
  type    = string
  default = "CLASS_LAMBDA"
}


variable "class_lambda_classEventHandler_name" {
  type    = string
  default = "handleClassEvent.handleClassEvent"
}


variable "category_lambda_name" {
  type    = string
  default = "CATEGORY_LAMBDA"
}


variable "category_lambda_categoryEventHandler_name" {
  type    = string
  default = "handleCategoryEvent.handleCategoryEvent"
}


variable "enrollment_and_class_assignment_lambda_name" {
  type    = string
  default = "ENROLLMENT_AND_CLASS_ASSIGNMENT_LAMBDA"
}


variable "enrollment_and_class_assignment_lambda_enrollmentAndClassAssignmentEventHandler_name" {
  type    = string
  default = "handleEnrollmentAndClassAssignmentEvent.handleEnrollmentAndClassAssignmentEvent"
}


variable "tag_lambda_name" {
  type    = string
  default = "TAG_LAMBDA"
}


variable "tag_lambda_tagEventHandler_name" {
  type    = string
  default = "handleTagEvent.handleTagEvent"
}

