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


resource "aws_pipes_pipe" "lesson-pipe" {
  name     = var.lesson_pipe_name
  role_arn = aws_iam_role.lesson-pipe-iam-role.arn
  source   = aws_dynamodb_table.lesson-table.stream_arn
  target   = aws_sqs_queue.lesson-queue.arn
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


resource "aws_pipes_pipe" "class-pipe" {
  name     = var.class_pipe_name
  role_arn = aws_iam_role.class-pipe-iam-role.arn
  source   = aws_dynamodb_table.class-table.stream_arn
  target   = aws_sqs_queue.class-queue.arn
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


resource "aws_pipes_pipe" "category-pipe" {
  name     = var.category_pipe_name
  role_arn = aws_iam_role.category-pipe-iam-role.arn
  source   = aws_dynamodb_table.category-table.stream_arn
  target   = aws_sqs_queue.category-queue.arn
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
          dynamodb = {
            OldImage = {
              id = {
                S = ["CATEGORY"]
              }
            }
          }
        })
      }
    }
  }
}


/**

 */


resource "aws_pipes_pipe" "enrollment-and-class-assignment-pipe-for-enrollment-pipe" {
  name     = var.enrollment_and_class_assignment_pipe_for_enrollment_name
  role_arn = aws_iam_role.enrollment-and-class-assignment-pipe-iam-role.arn
  source   = aws_dynamodb_table.enrollment-table.stream_arn
  target   = aws_sqs_queue.enrollment-and-class-assignment-queue.arn
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
          eventName = ["INSERT", "REMOVE"]
        })
      }
    }
  }

  target_parameters {
    sqs_queue_parameters {
      #       message_group_id = "$!{dynamodb.NewImage.userId.S ?: dynamodb.OldImage.userId.S}"
      message_group_id = "TABLE"
    }
  }
}


resource "aws_pipes_pipe" "enrollment-and-class-assignment-pipe-for-class-assignment-pipe" {
  name     = var.enrollment_and_class_assignment_pipe_for_class_assignment_name
  role_arn = aws_iam_role.enrollment-and-class-assignment-pipe-iam-role.arn
  source   = aws_dynamodb_table.class-assignment-table.stream_arn
  target   = aws_sqs_queue.enrollment-and-class-assignment-queue.arn
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
          eventName = ["INSERT", "REMOVE"]
        })
      }
    }
  }

  target_parameters {
    sqs_queue_parameters {
      #       message_group_id = "$!{dynamodb.NewImage.userId.S ?: dynamodb.OldImage.userId.S}"
      message_group_id = "TABLE"
    }
  }
}


/**

 */


resource "aws_pipes_pipe" "tag-pipe" {
  name     = var.tag_pipe_name
  role_arn = aws_iam_role.tag-pipe-iam-role.arn
  source   = aws_dynamodb_table.tag-table.stream_arn
  target   = aws_sqs_queue.tag-queue.arn
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
          dynamodb = {
            OldImage = {
              id = {
                S = ["TAG"]
              }
            }
          }
        })
      }
    }
  }
}


resource "aws_pipes_pipe" "scholarship-pipe" {
  name     = var.scholarship_pipe_name
  role_arn = aws_iam_role.scholarship-pipe-iam-role.arn
  source   = aws_dynamodb_table.scholarship-table.stream_arn
  target   = aws_sqs_queue.scholarship-queue.arn
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
          eventName = ["INSERT", "REMOVE"]
        })
      }
    }
  }
}


resource "aws_pipes_pipe" "notification-pipe" {
  name     = var.notification_pipe_name
  role_arn = aws_iam_role.main-pipe-iam-role.arn
  source   = aws_dynamodb_table.notification-table.stream_arn
  target   = aws_sqs_queue.main-queue.arn
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
          eventName = ["INSERT"]
        })
      }
    }
  }
}


/**

 */


variable "course_pipe_name" {
  type    = string
  default = "COURSE_PIPE"
}

variable "lesson_pipe_name" {
  type    = string
  default = "LESSON_PIPE"
}

variable "class_pipe_name" {
  type    = string
  default = "CLASS_PIPE"
}

variable "category_pipe_name" {
  type    = string
  default = "CATEGORY_PIPE"
}

variable "enrollment_and_class_assignment_pipe_for_enrollment_name" {
  type    = string
  default = "ENROLLMENT_AND_CLASS_ASSIGNMENT_PIPE_FOR_ENROLLMENT"
}

variable "enrollment_and_class_assignment_pipe_for_class_assignment_name" {
  type    = string
  default = "ENROLLMENT_AND_CLASS_ASSIGNMENT_PIPE_FOR_CLASS_ASSIGNMENT"
}

variable "tag_pipe_name" {
  type    = string
  default = "TAG_PIPE"
}

variable "scholarship_pipe_name" {
  type    = string
  default = "SCHOLARSHIP_PIPE"
}

variable "notification_pipe_name" {
  type    = string
  default = "NOTIFICATION_PIPE"
}