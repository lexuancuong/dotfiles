if ! is_installed npm; then
  curl -L https://www.npmjs.com/install.sh | sh
fi
print_package_version npm

npm install -g yarn
