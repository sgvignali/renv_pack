Build the Docker image and save the logs into `build.log`:

```zsh
docker build --no-cache --progress=plain -t pak_test . 2>&1 | tee build.log
```
