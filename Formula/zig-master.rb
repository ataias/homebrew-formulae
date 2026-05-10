class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.269+ebff43698"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.269+ebff43698.tar.xz"
      sha256 "38500f76294b4ce1c5e91824e2a664d7d7a2e8b7d2c4be37cddf63c11742ceb3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.269+ebff43698.tar.xz"
      sha256 "81641a6ef015d8ffba99de25c81bac830f4c255e4527c8665b419556d6ecbc7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.269+ebff43698.tar.xz"
      sha256 "df0d3d1fba0b83d83669d6ebba56846ea5f62d893daa54b38d71151a71c3d1e1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.269+ebff43698.tar.xz"
      sha256 "10ae629bd93c2702af210baa8992dc9ef53ca444535cbec71fa4a9d657c709dc"
    end
  end

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install Dir["lib/*"]
  end

  test do
    system bin/"zig", "init"
    system bin/"zig", "build", "--summary", "all"
    system bin/"zig", "build", "run"
    system bin/"zig", "build", "test", "--summary", "all"
  end
end
