# ansible-playbook

## Usage

```
$ cd path/to/playbooks
$ docker run --rm -it           \
  -v "$HOME/.aws:/root/.aws:ro" \
  -v "$HOME/.ssh:/root/.ssh:ro" \
  -v "$PWD:/w:ro" -w /w         \
  hiro/ansible-playbook [--ssh-add[=identity-file]] [options] playbook.yml [playbook2 ...]
```

## Build

```
$ docker build . -t hiro/ansible-playbook
```
