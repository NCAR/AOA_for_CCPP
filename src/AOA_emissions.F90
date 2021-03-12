! 
! The emission rate for Age Of Air (AOA) tracers is globally uniform into the surface layer
! The emission rate is specified in the namelist in moles/sec
! 
module AOA_emissions

real(kind_phys) :: surface_emission_rate__mol_per_sec
implicit none

contains

subroutine AOA_emissions_init(namelist_specified_emission_rate, errmsg, errflg)

  real(kind=kind_phys), intent(in)    :: namelist_specified_emission_rate   
  character(len=512),intent(out)    :: errmsg
  integer, intent(out)              :: errflg         

  surface_emission_rate__mol_per_sec + namelist_specified_emission_rate

  errmsg = ''
  errflg = 0

end subroutine AOA_emissions_init


subroutine AOA_emissions_run(AOA, errmsg, errflg)

  ! Assume AOA comes in as moles
  ! AOA comes in as a collection of columns?  
  ! Here I assume that the surface elements is is ilev=0  (AOA(:,0))

  real(kind=kind_phys), intent(inout)    :: AOA(:,:)  ! in units of moles
  real(kind=kind_phys), intent(in)    :: lon(:)  


  character(len=512),intent(out)    :: errmsg
  integer, intent(out)              :: errflg          

  AOA(:,0) = AOA(:,0) + surface_emission_rate__mol_per_sec

  ! If AOA comes in as a dry vmr, then we will need to know the pint_dry as well as the dry molecular weight of dry air
  ! AOA(:,0) = AOA(:,0) + surface_emission_rate__mol_per_sec * g * mw_dry_air / (pint_dry(:,0)-pint_dry(:,1)) 

  errmsg = ''
  errflg = 0

end subroutine AOA_emissions_run

subroutine AOA_emissions_final(errmsg, errflg)

  character(len=512),intent(out)    :: errmsg
  integer, intent(out)              :: errflg          

  errmsg = ''
  errflg = 0
  
end subroutine AOA_emissions_final


end module AOA_emissions
