# Kind-K8s-Playground

This project has several key tasks. It begins with the starting up of a Kubernetes cluster using Kind, a script tailored for local deployment, and the deployment of a Node.js application. Additionally, it involves the creation of a Docker image for a basic "Hello World" Express application, ensuring the secure storage of the kubeconfig. Moreover, a kubectl Terraform provider script is crafted to facilitate the deployment of the application to the Kind cluster. And eventually as an added benefit, the project implements monitoring by employing the kube-prometheus stack through a Terraform Helm provider.

## Prerequisites

- [Docker](https://www.docker.com/get-started)
- [Kind (Kubernetes in Docker)](https://kind.sigs.k8s.io/docs/user/quick-start/)
- [GitHub Codespaces](https://github.com/features/codespaces)

## Setup Kind

1. Run the script to set up Kind:

    ```bash
    ./script.sh
    ```

2. Find your kubeconfig by navigating to the `.kube` directory:

    ```bash
    cd ~/.kube
    ```

3. Your kubeconfig file can be found at `~/.kube/config`.

## Build and Prepare Docker Image

Assuming you already have Docker installed:

1. Build the Docker image for your application and be ready to push it to Docker Hub:

    ```bash
    docker build -t kind-app .
    ```

## Setup Terraform

Run the script to set up Terraform:

```bash
./Scripts/terraform.sh
```

### Deploy express app
1. Change into the Terraform express app directory for the express app:

    ```bash
    cd terraform/app
    ```

2. Initialize Terraform:

    ```bash
    terraform init
    ```

3. Plan the Terraform infrastructure changes:

    ```bash
    terraform plan
    ```

4. Apply the Terraform changes with auto-approval:

    ```bash
    terraform apply -auto-approve
    ```

### Deploy Monitoring Tools (Prometheus, Grafana & Alert Manager)
1. Change into the Terraform directory for the express app (You would need to go back to the project root if you are in a different directory):

    ```bash
    cd terraform/monitoring
    ```

2. Initialize Terraform:

    ```bash
    terraform init
    ```

3. Plan the Terraform infrastructure changes:

    ```bash
    terraform plan
    ```

4. Apply the Terraform changes with auto-approval:

    ```bash
    terraform apply -auto-approve
    ```

## Verify Kubernetes Deployment

1. Check the status of Kubernetes pods:

    ```bash
    kubectl get pods
    ```

2. Forward ports to access the individual tools & your app:

    - Express App

        ```bash
        kubectl port-forward svc/app-service <YOUR_DESIRED_PORT>:5000
        ```
    - Alert Manager
        ```bash
        kubectl port-forward svc/kube-prometheus-stack-alertmanager <YOUR_DESIRED_PORT:9093
        ```

    - Grafana

        ```bash
        kubectl port-forward svc/kube-prometheus-stack-grafana  <YOUR_DESIRED_PORT>:80
        ```
    - Prometheus
        ```bash
        kubectl port-forward svc/kube-prometheus-stack-prometheus  <YOUR_DESIRED_PORT:9090
        ```

3. Open a web browser and navigate to the generated url to access each tool and the application.

## Screenshots

Relevant screenshots

### Result for Docker 
<img src="./assets/Docker-Result.png">

### Results for AlertManager
<img src="./assets/AlertManager-Result.png">

### Results for Prometheus
<img src="./assets/PrometheusResult.png">

### Results for Grafana
<img src="./assets/Grafana-result.png">
