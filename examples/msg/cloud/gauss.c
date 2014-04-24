#include <math.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <time.h>
#include <limits.h>

#define MAX_WIDTH 240
#define TWO_PI 6.2831853071795864769252866
 
double normal(double mean, double stdev);
double randn (double mu, double sigma);
double gauss(const double variance);
double exponential(double mean);

/* Arguments: ./a.out mu sigma samples bins [min] [max] */
 
int
main (int argc, char *argv[])
{
  int samples, bins;
  double *range, mu = 0.0, std = 1.0, min, max, current_random_no;
  int i, j, *bin_count, count = 0, bin, max_bin_count = INT_MIN, flag = 0;
 
  if (argc < 5)
    {
      printf ("Usage: %s mu sigma samples bins [min] [max]\n", argv[0]);
      return 0;
    }
  
  srand (time (NULL));
 
  mu = atof (argv[1]);
  std = atof (argv[2]);
  samples = atoi (argv[3]);
  bins = atoi (argv[4]);

  /* Allocate memory */
  bin_count = calloc (sizeof (int), bins);
  range = malloc (sizeof (double) * (bins + 1));
 
  /* Automatically set a min and max range */
  min = -(abs (mu) + 5 * std);
  max = abs (mu) + 5 * std;
 
  /* If min and max is specified, use them */
  if (argc >= 6)
    {
      min = atof (argv[5]);
    }
  if (argc >= 7)
    {
      max = atof (argv[6]);
    }
 
  printf("mu = %f, std = %f, samples = %d, bins = %d, min = %f, max = %f\n", mu, std, samples, bins, min, max);
 
  /* Generate the bin ranges */
  range[0] = min;
  for (i = 1; i <= bins; i++)
    {
      range[i] = range[0] + (max - min) * (1.0 / bins) * i;
    }
 
  for (count = 0; count < samples; count++)
    {
      /* Generate random numbers from a distribution, Normal for this */
      current_random_no = randn (mu, std);
      //current_random_no = normal (mu, std);
      //current_random_no = exponential (mu);
	printf("%f ", current_random_no);
 
      /* Check which range the current sample falls */
      for (i = 0, bin = -1; i < bins; i++)
        {
          if ((current_random_no >= range[i])
              && (current_random_no < range[i + 1]))
            {
              bin = i;
              break;
            }
        }
      /* In case we have the number exactly equalto range[bins] */
      if (current_random_no == range[i])
        {
          bin = i - 1;
        }
      if ((bin <= bins) && (bin >= 0))
        {
          bin_count[bin]++;
        }
      /* Not all the random numbers were generated within the [min,max] range. */
      else
        {
          flag = 1;
        }
    }
	printf("\n");
 
  /* Find the max value of the bin counters. This is used to scale the histogram */
  for (i = 0; i < bins; i++)
    {
      if (bin_count[i] > max_bin_count)
        {
          max_bin_count = bin_count[i];
        }
    }
 
 
  /* Print histogram and ranges */
  printf ("[bin_low, bin_high), count\n");
  for (i = 0; i < bins; i++)
    {
      printf ("[%+7.1f,%+7.1f), %6d:", range[i], range[i + 1], bin_count[i]);
      for (j = 0;
           j < (bin_count[i] / (double) max_bin_count) * (MAX_WIDTH / std);
           j++)
        {
          printf ("*");
        }
      printf ("\n");
 
    }
 
  /* Not all random numbers were in the range of the histogram */
  if (flag == 1)
    {
      printf
        ("\nWARNING: Random numbers generated outside range (%f, %f). These will not be shown in the above histogram.\n",
         min, max);
    }
 
 
  free (bin_count);
  free (range);
 
  printf ("\n");
  return 0;
}

// mean = 1/lambda  
double exponential(double mean)
{
        //Generate a random number between 0 and 1.
        //REMEMBER: Always cast the oparands of a division to double, or truncation will be performed.
        double R;
        R = (double)rand()/((double)RAND_MAX+1);

        //Put it as a parameter to the inverse distribution function.
        return  -mean*log(R);
}

// normal distribution random number
double normal(double mean, double stdev)
{

        double R1;
        R1 = (double)rand()/((double)RAND_MAX+1);
        double R2;
        R2 = (double)rand()/((double)RAND_MAX+1);
        return mean + stdev*cos(2*3.14*R1)*sqrt(-log(R2));
}


// Gaussian random number
double randn (double mu, double sigma)
{
  double U1, U2, W, mult;
  static double X1, X2;
  static int call = 0;
 
  if (call == 1)
    {
      call = !call;
      return (mu + sigma * (double) X2);
    }
 
  do
    {
      U1 = -1 + ((double) rand () / RAND_MAX) * 2;
      U2 = -1 + ((double) rand () / RAND_MAX) * 2;
      W = pow (U1, 2) + pow (U2, 2);
    }
  while (W >= 1 || W == 0);
 
  mult = sqrt ((-2 * log (W)) / W);
  X1 = U1 * mult;
  X2 = U2 * mult;
 
  call = !call;
 
  return (mu + sigma * (double) X1);
}

//double generateGaussianNoise(const double &variance)
double gauss(const double variance)
{
	static bool hasSpare = false;
	static double rand1, rand2;
 
	if(hasSpare)
	{
		hasSpare = false;
		return sqrt(variance * rand1) * sin(rand2);
	}
 
	hasSpare = true;
 
	rand1 = rand() / ((double) RAND_MAX);
	if(rand1 < 1e-100) rand1 = 1e-100;
	rand1 = -2 * log(rand1);
	rand2 = (rand() / ((double) RAND_MAX)) * TWO_PI;
 
	return sqrt(variance * rand1) * cos(rand2);
}

//double gsl_ran_gaussian (const gsl_rng * r, double sigma)
//gsl_ran_gaussian(r, sigma);
