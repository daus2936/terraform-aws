resource "aws_key_pair" "projectterra" {
    key_name = "projectterra"
    public_key = file(var.PUB_KEY_PATH)
}