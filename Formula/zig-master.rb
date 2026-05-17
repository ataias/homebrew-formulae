class ZigMaster < Formula
  desc "Zig programming language (master/nightly build)"
  homepage "https://ziglang.org/"
  version "0.17.0-dev.305+bdfbf432d"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-macos-0.17.0-dev.305+bdfbf432d.tar.xz"
      sha256 "842313e4e47f72b601994dcb9114bd88d7be2ad8ecfd37a2d7d882a51045d2cc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-macos-0.17.0-dev.305+bdfbf432d.tar.xz"
      sha256 "02700900d2d48f8dee65f00553e4142109e5d8caae47531d68bedb1e4d60cc78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-aarch64-linux-0.17.0-dev.305+bdfbf432d.tar.xz"
      sha256 "2adf4da7ea5f690e155191ca4bceeee6dd7f1dccc9554f03d9bcc05f562d7975"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zig-master-latest/zig-x86_64-linux-0.17.0-dev.305+bdfbf432d.tar.xz"
      sha256 "df39f7482ea8a60d19d973a7b42167c74457fca844cace4953dedb73af7c033a"
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
