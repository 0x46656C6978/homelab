# Homelab
## The story
After working with Kubernetes for a year, I think it's time to build a cluster at home. There are so many GitHub repositories or youtube tutorials out there that I could use and instantly start. But doing it myself from scratch is more valuable for me. So I created this repo.
## Prerequisites
- cmake (aka make)
- kubectl
- helm3
- helmfile
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
### Kubernetes cluster
I don't have a static IP address at home, so the best choice until now is CloudFlare Tunnel - it's fast and free. In my experience with CloudFlare Tunnel, the speed is pretty quick if you want to publish a blog, or in my friend's use case, the media server can stream with a buffer time around seconds.

I'm using TrueCharts to deploy tunnel, so you can [follow these instructions](https://truecharts.org/charts/stable/cloudflared/installation_notes) to get your token. Then update it in `k8s/base/cloudflared/values.yaml`.

After finishing the configuration part, use these commands to deploy our cluster.
```bash
# Move to k8s/base directory
cd k8s/base
# Run deploy script
./deploy.sh
```
Currently, the script to deploy the k8s cluster still not convenient. I'm still working to make it more friendly and easy to use.
### TODOs
- [ ] Support PXE boot for OS install
- [ ] Ansible for server setup
- [ ] Add more default applications like Gitea, ArgoCD, Tekton,...
## License
This repository was published under MIT license. Take a look at `LICENSE` file for more detail.
