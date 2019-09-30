resource "yandex_compute_instance" "vm-01" {
  name = "t-vm-01"
  description = "Test VM"
  zone = "${var.zone}"
  platform_id = "standard-v2"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
# Windows:
# yc compute image list --folder-id standard-images | findstr centos-7
# Linux:
# yc compute image list --folder-id standard-images | grep centos-7
#      image_id = "fd8cn8os7a9dfgosb89r"    # CentOS 7
      image_id = "fd8veme9fg6pbg5ost48"    # Ubuntu 18.04 LTS
      size = "40"
    }
  }

  network_interface {
    subnet_id = "${var.subnet_id}"
#    nat       = true
  }

  metadata = { 
    user-data = "${file("cloud-config")}"
  }
}

output "lm_ip" {
  value = "${yandex_compute_instance.vm-01.network_interface.0.ip_address}"
}
output "external_ip" {
  value = "${yandex_compute_instance.vm-01.network_interface.0.nat_ip_address}"
}