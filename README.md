# scylla-simple-kubernetes
Run a standalone scylladb instance in a Kubernenetes cluster (non root version!)
Could be useful for testing (e.g. GitLab CI service).

## Usage
### Docker
```
# will build and push on registry (change it)
IMG="your-registry.com/docker-images/scylla" make push
```

### Kubernetes
```
# change the image registry in kubernetes/statefulSet.yaml
kubectl apply -f kubernetes
```
