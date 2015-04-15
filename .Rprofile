speed_of_light = 299792458
proton_mass = 1.67262178e-27
R = 8.3144621
moles = 6.02214129e23
ke = 8.9875517873681764e9

mu0 = 1.25663706e-6

kb = 1.38e-23

elementary_charge = 1.60217657e-19

riemann = function(f, start, end, n, draw=T,...) {
  if (draw) {
    plot(f, start, end, ...)
  }
  step = (end-start)/n
  area = 0
  for (i in seq(1, n)) {
    left = start+step*(i-1)
    right = left + step
    if (draw) {
      rect(left, 0, right, f(left), col=rainbow(n)[i])
    }
    area = area + step * f(left)
  }
  if (draw) {
    plot(f, start, end, add=T, ...)
  }
  area
}


trapezoidal_rule = function(f, start, end, n) {
  dX = (end-start)/n
  sum = 0
  i = 0
  while (i < n) {
    coef = 2
    if (i == 0 || i == (n-1) ) {
       coef = 1
    }
    sum = sum + coef * f(start + dX * i)
    i = i + 1
  }
  return (sum * dX / 2)
}

simpsons_rule = function(f, start, end, n) {
  dX = (end-start)/n
  sum = 0
  i = 0
  while (i < n) {
    coef = 2
    if (i == 0 || i == (n-1) ) {
       coef = 1
    }
    else if (i %% 2 == 1) {
       coef = 4
    }
    sum = sum + coef * f(start + dX * i)
    i = i + 1
  }
  return (sum * dX / 3)
}

K = 8.99e9
