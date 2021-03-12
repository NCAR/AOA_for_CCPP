! 
! The decay rate of Age Of Air (AOA) tracers is uniform
! Namelist-specified decay-rate is used every timestep
! This mimicks what a photodecomp routine would do
! 
module AOA_rate_constants

real(kind_phys) :: globally_uniform_decay_rate
implicit none

contains

subroutine rate_constants_init(decay_rate, errmsg, errflg)

  real(kind=kind_phys), intent(in)    :: decay_rate   ! This would be great if it came from the namelist
  character(len=512),intent(out)    :: errmsg
  integer, intent(out)              :: errflg         

  globally_uniform_decay_rate = decay_rate

  errmsg = ''
  errflg = 0

end subroutine rate_constants_init


subroutine rate_constants_run(reaction_rate_constant, errmsg, errflg)

  ! unspecified dimension is the number of boxes

  real(kind=kind_phys), intent(in)    :: lat(:)  
  real(kind=kind_phys), intent(in)    :: lon(:)  

  real(kind=kind_phys), intent(out)    :: reaction_rate_constant(:)  

  character(len=512),intent(out)    :: errmsg
  integer, intent(out)              :: errflg          

  reaction_rate_constant(:) = globally_uniform_decay_rate

  errmsg = ''
  errflg = 0

end subroutine rate_constants_run

subroutine rate_constants_finalize(errmsg, errflg)

  character(len=512),intent(out)    :: errmsg
  integer, intent(out)              :: errflg          

  errmsg = ''
  errflg = 0
  
end subroutine rate_constants_runfinalize


end module AOA_rate_constants
