# Homelab
## The story
After working with Kubernetes for a year, I think it's time to build a cluster at home. There are so many GitHub repositories or youtube tutorials out there that I could use and instantly start. But doing it myself from scratch is more valuable for me. So I created this repo.
## Prerequisites
- cmake
## Deploy
### Master node
```bash
make run-master
```
After the master node started, you will see a `kube_config` file in the root, copy this file to `<home_path>/.kube/config` on your computer for managing the cluster later.
### Worker node
Before start your worker node, first create the `.env` file at the root directory with the following format
```bash
# The master node IP is the IP of the machine that you run master node on it
K3S_URL=https://<your_master_node_ip>:6443
# The token value could be found at /var/lib/rancher/k3s/server/token
K3S_TOKEN="<your_token_value>"
```
Then run your worker node
```bash
make run-worker
```
## License
This repository was published under MIT license. Take a look at `LICENSE` file for more detail.
