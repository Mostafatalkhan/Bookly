abstract class Failure {
  final String errormsg;

  Failure(this.errormsg);
}

class serverFailure extends Failure {
  serverFailure(super.errormsg);
}
