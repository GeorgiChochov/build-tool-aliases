import mill._, scalalib._

object foo extends ScalaModule {
  def scalaVersion = "2.13.4"

  object test extends Tests {
    override def ivyDeps = Agg(ivy"org.scalatest::scalatest:3.2.3")
    def testFrameworks = Seq("org.scalatest.tools.Framework")
  }
}
