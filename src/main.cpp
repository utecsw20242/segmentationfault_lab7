#include <filesystem>
#include <iostream>
#include <stdexcept>
#include <string>
namespace fs = std::filesystem;

int main(int argc, char *argv[]) {
  if (argc < 3) {
    throw std::runtime_error("Not enough arguments");
  }
  std::string option = argv[1];
  std::string directory = argv[2];
  fs::path skeleton_path;

  if (option == "-crud") {
    skeleton_path = "skeletons/crud/";
  } else if (option == "-api") {
    skeleton_path = "skeletons/api/";
  } else {
    throw std::runtime_error("Option not recognized");
  }

  std::cout << "Generating " << (option == "-crud" ? "CRUD" : "API")
            << " using MVC structure" << "\n";
  fs::create_directory(directory);
  fs::copy(skeleton_path, directory, fs::copy_options::recursive);

  std::cout << "Files created in: " << directory << "\n";
  return 0;
}
