if ! is_installed uv; then
  echo "📦  Installing uv..."
  brew install uv
fi

print_package_version uv
