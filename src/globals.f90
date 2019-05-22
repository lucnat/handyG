
MODULE globals
  implicit none

  integer, parameter :: prec = selected_real_kind(15,32)  
  integer, parameter :: GPLInfinity = 30   ! the default outermost expansion order for MPLs
  real, parameter :: epsilon = 1e-15       ! used for the small imaginary part
  real, parameter :: zero = 1e-15          ! values smaller than this count as zero
  real, parameter :: pi = 3.14159265358979323846

  integer :: verb = 0

CONTAINS 

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

END MODULE globals