resource "aws_pipes_pipe" "class-assignment-pipe" {
  name     = var.class_assignment_pipe_name
  role_arn = aws_iam_role.class-assignment-pipe-iam-role.arn
  source   = aws_dynamodb_table.class-assignment-table.stream_arn
  target   = aws_sqs_queue.class-assignment-queue.arn
  source_parameters {
    dynamodb_stream_parameters {
      starting_position = "TRIM_HORIZON"
      batch_size        = 1
    }
  }
}


resource "aws_pipes_pipe" "enrollment-pipe" {
  name     = var.enrollment_pipe_name
  role_arn = aws_iam_role.enrollment-pipe-iam-role.arn
  source   = aws_dynamodb_table.enrollment-table.stream_arn
  target   = aws_sqs_queue.enrollment-queue.arn
  source_parameters {
    dynamodb_stream_parameters {
      starting_position = "TRIM_HORIZON"
      batch_size        = 1
    }
  }
}


resource "aws_pipes_pipe" "course-pipe" {
  name     = var.course_pipe_name
  role_arn = aws_iam_role.course-pipe-iam-role.arn
  source   = aws_dynamodb_table.course-table.stream_arn
  target   = aws_sqs_queue.course-queue.arn
  source_parameters {
    dynamodb_stream_parameters {
      starting_position                  = "TRIM_HORIZON"
      batch_size                         = 1
      maximum_record_age_in_seconds      = 86400
      maximum_batching_window_in_seconds = 5
    }

    filter_criteria {
      filter {
        pattern = jsonencode({
          eventName = ["REMOVE"]
        })
      }
    }
  }

}


variable "class_assignment_pipe_name" {
  type    = string
  default = "CLASS_ASSIGNMENT_PIPE"
}


variable "enrollment_pipe_name" {
  type    = string
  default = "ENROLLMENT_PIPE"
}

variable "course_pipe_name" {
  type    = string
  default = "COURSE_PIPE"
}