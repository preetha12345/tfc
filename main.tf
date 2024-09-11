provider "aws" {
  region = var.aws_region
}

provider "random" {}

resource "random_pet" "table_name" {}

resource "aws_dynamodb_table" "tfc_example_table" {
  name = "${var.db_table_name}-${random_pet.table_name.id}"

  read_capacity  = var.db_read_capacity
  write_capacity = var.db_write_capacity
  hash_key       = "UUID"

  attribute {
    name = "UUID"
    type = "S"
  }
}
def versions = [
    "D:\\Apps\\Java\\jdk17.0",
    "D:\\Apps\\Java\\jdk-11.0.21",
    "D:\\Apps\\Java\\jdk17.0.0_401"
]

def regex = ~/jdk(?:-(\d+)(?:\.(\d+)(?:\.(\d+))?)?)?(?:_(u(\d+)))?/

versions.each { versionString ->
    def matcher = versionString =~ regex
    if (matcher) {
        matcher.each { match ->
            def major = match[1] ?: ''
            def minor = match[2] ?: ''
            def patch = match[3] ?: ''
            def build = match[4] ?: ''
            println "Version: ${major}.${minor}${minor ? '.' : ''}${patch}${build ? 'u' + build : ''}"
        }
    }
}
