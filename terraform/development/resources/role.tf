resource "aws_iam_role" "course-pipe-iam-role" {
  name = var.course_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "course-pipe-iam-policy" {
  name = var.course_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.course-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.course-queue.arn,
          aws_sqs_queue.course-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "course-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.course-pipe-iam-role.name
  policy_arn = aws_iam_policy.course-pipe-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "lesson-pipe-iam-role" {
  name = var.lesson_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "lesson-pipe-iam-policy" {
  name = var.lesson_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.lesson-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.lesson-queue.arn,
          aws_sqs_queue.lesson-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "lesson-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.lesson-pipe-iam-role.name
  policy_arn = aws_iam_policy.lesson-pipe-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "class-pipe-iam-role" {
  name = var.class_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "class-pipe-iam-policy" {
  name = var.class_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.class-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.class-queue.arn,
          aws_sqs_queue.class-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "class-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.class-pipe-iam-role.name
  policy_arn = aws_iam_policy.class-pipe-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "course-lambda-iam-role" {
  name = var.course_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "course-lambda-iam-policy" {
  name = var.course_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.course-queue.arn,
          aws_sqs_queue.course-dlq.arn
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.lesson-table.arn,
          aws_dynamodb_table.class-table.arn,
          aws_dynamodb_table.category-table.arn,
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "course-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.course-lambda-iam-role.name
  policy_arn = aws_iam_policy.course-lambda-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "lesson-lambda-iam-role" {
  name = var.lesson_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "lesson-lambda-iam-policy" {
  name = var.lesson_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.lesson-queue.arn,
          aws_sqs_queue.lesson-dlq.arn
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.video-table.arn,
          aws_dynamodb_table.attachment-table.arn,
          aws_dynamodb_table.course-table.arn
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "lesson-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.lesson-lambda-iam-role.name
  policy_arn = aws_iam_policy.lesson-lambda-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "class-lambda-iam-role" {
  name = var.class_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "class-lambda-iam-policy" {
  name = var.class_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.class-queue.arn,
          aws_sqs_queue.class-dlq.arn
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.class-assignment-table.arn,
          aws_dynamodb_table.enrollment-table.arn,
          aws_dynamodb_table.instructor-table.arn,
          "${aws_dynamodb_table.enrollment-table.arn}/index/*",
          "${aws_dynamodb_table.instructor-table.arn}/index/*",
          aws_dynamodb_table.course-table.arn,
          aws_dynamodb_table.user-table.arn,
          aws_dynamodb_table.user-assignment-table.arn,
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "class-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.class-lambda-iam-role.name
  policy_arn = aws_iam_policy.class-lambda-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "category-lambda-iam-role" {
  name = var.category_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "category-lambda-iam-policy" {
  name = var.category_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.category-queue.arn,
          aws_sqs_queue.category-dlq.arn
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.category-table.arn,
          aws_dynamodb_table.course-table.arn,
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "category-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.category-lambda-iam-role.name
  policy_arn = aws_iam_policy.category-lambda-iam-policy.arn
}


resource "aws_iam_role" "category-pipe-iam-role" {
  name = var.category_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "category-pipe-iam-policy" {
  name = var.category_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.category-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.category-queue.arn,
          aws_sqs_queue.category-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "category-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.category-pipe-iam-role.name
  policy_arn = aws_iam_policy.category-pipe-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "enrollment-and-class-assignment-lambda-iam-role" {
  name = var.enrollment_and_class_assignment_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "enrollment-and-class-assignment-lambda-iam-policy" {
  name = var.enrollment_and_class_assignment_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.enrollment-and-class-assignment-queue.arn,
          aws_sqs_queue.enrollment-and-class-assignment-dlq.arn,
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.user-assignment-table.arn,
          aws_dynamodb_table.class-assignment-table.arn,
          aws_dynamodb_table.enrollment-table.arn,
          aws_dynamodb_table.user-assignment-table.arn,
          "${aws_dynamodb_table.enrollment-table.arn}/index/*",
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "enrollment-and-class-assignment-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.enrollment-and-class-assignment-lambda-iam-role.name
  policy_arn = aws_iam_policy.enrollment-and-class-assignment-lambda-iam-policy.arn
}


resource "aws_iam_role" "enrollment-and-class-assignment-pipe-iam-role" {
  name = var.enrollment_and_class_assignment_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "enrollment-and-class-assignment-pipe-iam-policy" {
  name = var.enrollment_and_class_assignment_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.enrollment-table.stream_arn,
          aws_dynamodb_table.class-assignment-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.enrollment-and-class-assignment-queue.arn,
          aws_sqs_queue.enrollment-and-class-assignment-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "enrollment-and-class-assignment-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.enrollment-and-class-assignment-pipe-iam-role.name
  policy_arn = aws_iam_policy.enrollment-and-class-assignment-pipe-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "tag-lambda-iam-role" {
  name = var.tag_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "tag-lambda-iam-policy" {
  name = var.tag_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.tag-queue.arn,
          aws_sqs_queue.tag-dlq.arn
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.tag-table.arn,
          aws_dynamodb_table.scholarship-table.arn,
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "tag-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.tag-lambda-iam-role.name
  policy_arn = aws_iam_policy.tag-lambda-iam-policy.arn
}


resource "aws_iam_role" "tag-pipe-iam-role" {
  name = var.tag_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "tag-pipe-iam-policy" {
  name = var.tag_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.tag-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.tag-queue.arn,
          aws_sqs_queue.tag-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "tag-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.tag-pipe-iam-role.name
  policy_arn = aws_iam_policy.tag-pipe-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "scholarship-lambda-iam-role" {
  name = var.scholarship_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "scholarship-lambda-iam-policy" {
  name = var.scholarship_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.scholarship-queue.arn,
          aws_sqs_queue.scholarship-dlq.arn
        ]
      },
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:Get*",
          "dynamodb:Update*",
          "dynamodb:Delete*",
        ],
        "Resource" : [
          aws_dynamodb_table.tag-table.arn,
          aws_dynamodb_table.notification-table.arn,
          aws_dynamodb_table.user-table.arn,
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "scholarship-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.scholarship-lambda-iam-role.name
  policy_arn = aws_iam_policy.scholarship-lambda-iam-policy.arn
}


resource "aws_iam_role" "scholarship-pipe-iam-role" {
  name = var.scholarship_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "scholarship-pipe-iam-policy" {
  name = var.scholarship_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.scholarship-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.scholarship-queue.arn,
          aws_sqs_queue.scholarship-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "scholarship-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.scholarship-pipe-iam-role.name
  policy_arn = aws_iam_policy.scholarship-pipe-iam-policy.arn
}


/**


 */


resource "aws_iam_role" "main-lambda-iam-role" {
  name = var.main_lambda_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "main-lambda-iam-policy" {
  name = var.main_lambda_iam_policy_name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.main-queue.arn,
          aws_sqs_queue.main-dlq.arn
        ]
      },
      {
        "Sid" : "cloudwatchPermissions",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "main-lambda-iam-role-policy-attachment" {
  role       = aws_iam_role.main-lambda-iam-role.name
  policy_arn = aws_iam_policy.main-lambda-iam-policy.arn
}


resource "aws_iam_role" "main-pipe-iam-role" {
  name = var.main_pipe_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "PipesPermissions"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "main-pipe-iam-policy" {
  name = var.main_pipe_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "dynamodbPermissions",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ],
        "Resource" : [
          aws_dynamodb_table.notification-table.stream_arn
        ]
      },
      {
        "Sid" : "sqsPermissions",
        "Effect" : "Allow",
        "Action" : [
          "sqs:SendMessage"
        ],
        "Resource" : [
          aws_sqs_queue.main-queue.arn,
          aws_sqs_queue.main-dlq.arn
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "main-pipe-iam-role-policy-attachment" {
  role       = aws_iam_role.main-pipe-iam-role.name
  policy_arn = aws_iam_policy.main-pipe-iam-policy.arn
}


/**


 */


variable "course_pipe_iam_role_name" {
  type    = string
  default = "COURSE_PIPE_IAM_ROLE"
}


variable "course_pipe_iam_policy_name" {
  type    = string
  default = "COURSE_PIPE_IAM_POLICY"
}


variable "course_lambda_iam_role_name" {
  type    = string
  default = "COURSE_LAMBDA_IAM_ROLE"
}


variable "course_lambda_iam_policy_name" {
  type    = string
  default = "COURSE_LAMBDA_IAM_POLICY"
}


/**


 */


variable "lesson_pipe_iam_role_name" {
  type    = string
  default = "LESSON_PIPE_IAM_ROLE"
}


variable "lesson_pipe_iam_policy_name" {
  type    = string
  default = "LESSON_PIPE_IAM_POLICY"
}


variable "lesson_lambda_iam_role_name" {
  type    = string
  default = "LESSON_LAMBDA_IAM_ROLE"
}


variable "lesson_lambda_iam_policy_name" {
  type    = string
  default = "LESSON_LAMBDA_IAM_POLICY"
}


/**


 */


variable "class_pipe_iam_role_name" {
  type    = string
  default = "CLASS_PIPE_IAM_ROLE"
}


variable "class_pipe_iam_policy_name" {
  type    = string
  default = "CLASS_PIPE_IAM_POLICY"
}


variable "class_lambda_iam_role_name" {
  type    = string
  default = "CLASS_LAMBDA_IAM_ROLE"
}


variable "class_lambda_iam_policy_name" {
  type    = string
  default = "CLASS_LAMBDA_IAM_POLICY"
}


/**


 */


variable "category_pipe_iam_role_name" {
  type    = string
  default = "CATEGORY_PIPE_IAM_ROLE"
}


variable "category_pipe_iam_policy_name" {
  type    = string
  default = "CATEGORY_PIPE_IAM_POLICY"
}


variable "category_lambda_iam_role_name" {
  type    = string
  default = "CATEGORY_LAMBDA_IAM_ROLE"
}


variable "category_lambda_iam_policy_name" {
  type    = string
  default = "CATEGORY_LAMBDA_IAM_POLICY"
}


/**


 */


variable "enrollment_and_class_assignment_pipe_iam_role_name" {
  type    = string
  default = "ENROLLMENT_AND_CLASS_ASSIGNMENT_PIPE_IAM_ROLE"
}


variable "enrollment_and_class_assignment_pipe_iam_policy_name" {
  type    = string
  default = "ENROLLMENT_AND_CLASS_ASSIGNMENT_PIPE_IAM_POLICY"
}


variable "enrollment_and_class_assignment_lambda_iam_role_name" {
  type    = string
  default = "ENROLLMENT_AND_CLASS_ASSIGNMENT_LAMBDA_IAM_ROLE"
}


variable "enrollment_and_class_assignment_lambda_iam_policy_name" {
  type    = string
  default = "ENROLLMENT_AND_CLASS_ASSIGNMENT_LAMBDA_IAM_POLICY"
}


/**


 */


variable "tag_pipe_iam_role_name" {
  type    = string
  default = "TAG_PIPE_IAM_ROLE"
}


variable "tag_pipe_iam_policy_name" {
  type    = string
  default = "TAG_PIPE_IAM_POLICY"
}


variable "tag_lambda_iam_role_name" {
  type    = string
  default = "TAG_LAMBDA_IAM_ROLE"
}


variable "tag_lambda_iam_policy_name" {
  type    = string
  default = "TAG_LAMBDA_IAM_POLICY"
}


/**


 */


variable "scholarship_pipe_iam_role_name" {
  type    = string
  default = "SCHOLARSHIP_PIPE_IAM_ROLE"
}


variable "scholarship_pipe_iam_policy_name" {
  type    = string
  default = "SCHOLARSHIP_PIPE_IAM_POLICY"
}


variable "scholarship_lambda_iam_role_name" {
  type    = string
  default = "SCHOLARSHIP_LAMBDA_IAM_ROLE"
}


variable "scholarship_lambda_iam_policy_name" {
  type    = string
  default = "SCHOLARSHIP_LAMBDA_IAM_POLICY"
}


/**


 */


variable "main_pipe_iam_role_name" {
  type    = string
  default = "MAIN_PIPE_IAM_ROLE"
}


variable "main_pipe_iam_policy_name" {
  type    = string
  default = "MAIN_PIPE_IAM_POLICY"
}


variable "main_lambda_iam_role_name" {
  type    = string
  default = "MAIN_LAMBDA_IAM_ROLE"
}


variable "main_lambda_iam_policy_name" {
  type    = string
  default = "MAIN_LAMBDA_IAM_POLICY"
}