class ZlsMaster < Formula
  desc "Zig Language Server (master/nightly build)"
  homepage "https://github.com/zigtools/zls"
  version "0.17.0-dev.13+113f79a1"
  license "MIT"
  revision 2
  # zls_commit: 113f79a1d1
  # zig_version: 0.17.0-dev.224+c166c49b1

  depends_on "ataias/formulae/zig-master"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-macos.tar.xz"
      sha256 "923f5b8679a1ab8b1e0e46fbdcefa6baa1b465ef6c77bcc47ceaed9026071f42"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-macos.tar.xz"
      sha256 "0939bd99abf39bdea595b9f4dfc0fa8dc0f1c8da00aa0a247f1219a580abc500"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-aarch64-linux.tar.xz"
      sha256 "5051e3d7d332edfa41ac1b0d2a50399ee35adcbbe3ecb440b15a807c02cb8fca"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/zls-master-latest/zls-x86_64-linux.tar.xz"
      sha256 "90a498b2e878ff5fb2a5a3d7676206637961f684162b2304b67e87b2250296f1"
    end
  end

  conflicts_with "zls", because: "both install a `zls` binary"

  def install
    bin.install "zls"
  end

  test do
    system bin/"zls", "--version"
  end
end
