class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.702+18b3c78a9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.702+18b3c78a9.tar.xz"
      sha256 "f851dac9bca925e2934f8f85ff5f17b1913a26eaa6d1bee49993176bcf0393f9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.702+18b3c78a9.tar.xz"
      sha256 "610205c6ab2e85e3285bbf2df31a746c321a5def66cd6427543be46e250775e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.702+18b3c78a9.tar.xz"
      sha256 "69127cb671eeda533d88ac0e531ecbd6956b1c13dcc41822dfcc7b13b60f4e50"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.702+18b3c78a9.tar.xz"
      sha256 "45102dfb5ad9b65bb2dadf8b05f289f687c568450fad2fe22fc9be456f8f11a9"
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
