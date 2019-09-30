# Yandex Cloud Terraform Example

## Documentation
  - [https://cloud.yandex.com/docs/solutions/infrastructure-management/terraform-quickstart](https://cloud.yandex.com/docs/solutions/infrastructure-management/terraform-quickstart) English language
  - [https://cloud.yandex.ru/docs/solutions/infrastructure-management/terraform-quickstart](https://cloud.yandex.ru/docs/solutions/infrastructure-management/terraform-quickstart) Russian language

## Generate token
  - [https://cloud.yandex.com/docs/iam/concepts/authorization/oauth-token](https://cloud.yandex.com/docs/iam/concepts/authorization/oauth-token) English language

  - [https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token](https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token) Russian language

## Create secrets.tfvars file
```ini
token = "SECRET_TOKEN"
```

## Apply changes
```bash
terraform init
terraform plan
terraform apply -var-file=secrets.tfvars -auto-approve
```

## Variables explanation and some details

First you need to get your folder id. Go to folders list: [https://console.cloud.yandex.com/cloud](https://console.cloud.yandex.com/cloud) and copy id from the right column.

Next you need to get a secret token. Follow the link [https://cloud.yandex.com/docs/iam/concepts/authorization/oauth-token](https://cloud.yandex.com/docs/iam/concepts/authorization/oauth-token) and get new OAuth token. Create ``secrets.tfvars`` file and specify the token.

Now you need to get a subnet id. Ask your administrator for the id or get it yourself with Yandex Cloud CLI.
  - [https://cloud.yandex.com/docs/cli/quickstart](https://cloud.yandex.com/docs/cli/quickstart) English language
  - [https://cloud.yandex.ru/docs/cli/quickstart](https://cloud.yandex.ru/docs/cli/quickstart) Russian language

Configure CLI profile:
```bash
yc init
```

Follow the link in the CLI to get the OAuth token and next specify the folder id. You can also specify the default zone (``ru-central1-a`` for Vladimir region, ``ru-central1-b`` for Ryazan region, and ``ru-central1-c`` for Moscow region). **Please make a note**: to create a virtual in a region you need a subnet in it.

Now you can list subnets in your folder:
```bash
yc vpc subnet list
```

Or, if you have access to several folders:
```bash
yc vpc subnet list --folder-id ${folder_id}
```

You can get a list of public images in CLI
```bash
yc compute image list --folder-id standard-images
```

Finally, specify number of vCPU, RAM and disk size.