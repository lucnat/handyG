
MODULE globals
  implicit none


  integer, parameter :: prec = selected_real_kind(15,32)  
  real, parameter :: zero = 1e-15          ! values smaller than this count as zero
  real, parameter :: pi = 3.14159265358979323846

  ! The following parameters control the accuracy of the evaluation
  integer, protected :: MPLInfinity = 30               ! the default outermost expansion order for MPLs, formerly GPLInfinity
  integer, protected :: PolylogInfinity = 1000         ! expansion order for Polylogs
  real(kind=prec), protected :: HoelderCircle = 1.1    ! when to apply Hoelder convolution?

  integer :: verb = 0

CONTAINS 
  
#ifdef DEBUG
  SUBROUTINE parse_cmd_args
    integer :: i
    character(len=32) :: arg
    i = 0
    do
      call get_command_argument(i, arg)
      if (len_trim(arg) == 0) exit

      ! parse verbosity
      if(trim(arg) == '-verb') then
        call get_command_argument(i+1,arg)
        read(arg,*) verb               ! str to int
      end if

      i = i+1
    end do
  END SUBROUTINE parse_cmd_args
#endif

  SUBROUTINE SET_OPTIONS(mplinf, liinf, hcircle)
    real(kind=prec), optional :: hcircle
    integer, optional :: mplinf, liinf
    if (present(mplinf)) MPLInfinity = mplinf
    if (present(liinf)) PolyLogInfinity = liinf
    if (present(hcircle)) HoelderCircle = hcircle
  END SUBROUTINE

END MODULE globals
