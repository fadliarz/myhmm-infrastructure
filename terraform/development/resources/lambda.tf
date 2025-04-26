resource "aws_lambda_function" "class-assignment-lambda" {
  function_name = var.class_assignment_lambda_name
  role          = aws_iam_role.class-assignment-lambda-iam-role.arn
  handler       = var.class_assignment_lambda_classAssignmentEventHandler_name
  runtime       = "nodejs20.x"
  filename      = "./store/empty-lambda.zip"

  timeout = 30

  environment {
    variables = {
      ENROLLMENT_TABLE      = var.dynamodb_enrollment_table_name
      USER_ASSIGNMENT_TABLE = var.dynamodb_user_assignment_table_name
    }
  }
}


resource "aws_lambda_event_source_mapping" "class-assignment-lambda-event-source-mapping" {
  function_name    = aws_lambda_function.class-assignment-lambda.function_name
  event_source_arn = aws_sqs_queue.class-assignment-queue.arn
  batch_size       = 1
}


/**


 */


resource "aws_lambda_function" "enrollment-lambda" {
  function_name = var.enrollment_lambda_name
  role          = aws_iam_role.enrollment-lambda-iam-role.arn
  handler       = var.enrollment_lambda_enrollmentEventHandler_name
  runtime       = "nodejs20.x"
  filename      = "./store/empty-lambda.zip"

  timeout = 30

  environment {
    variables = {
      USER_ASSIGNMENT_TABLE  = var.dynamodb_user_assignment_table_name
      CLASS_ASSIGNMENT_TABLE = var.dynamodb_class_assignment_table_name
    }
  }
}


resource "aws_lambda_event_source_mapping" "enrollment-lambda-event-source-mapping" {
  function_name    = aws_lambda_function.enrollment-lambda.function_name
  event_source_arn = aws_sqs_queue.enrollment-queue.arn
  batch_size       = 1
}


/**


 */


resource "aws_lambda_function" "course-lambda" {
  function_name = var.course_lambda_name
  role          = aws_iam_role.course-lambda-iam-role.arn
  handler       = var.course_lambda_courseEventHandler_name
  runtime       = "nodejs20.x"
  filename      = "./store/empty-lambda.zip"

  timeout = 30

  environment {
    variables = {
      LESSON_TABLE = var.dynamodb_lesson_table_name
      CLASS_TABLE  = var.dynamodb_class_table_name
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


variable "class_assignment_lambda_name" {
  type    = string
  default = "CLASS_ASSIGNMENT_LAMBDA"
}


variable "class_assignment_lambda_classAssignmentEventHandler_name" {
  type    = string
  default = "handleClassAssignmentEvent.handleClassAssignmentEvent"
}


variable "enrollment_lambda_name" {
  type    = string
  default = "ENROLLMENT_LAMBDA"
}


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

