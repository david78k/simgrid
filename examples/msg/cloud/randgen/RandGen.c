#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>



//Note: double variables are used. If you want to generate integer variables, just change the
//return type of the function and all other types which are related to the result...
double Constant(double mean);
double Uniform(double mean);
double Exponential(double mean);
int   Poisson(double mean);
double Pareto(double alpha);
double Normal(double mean, double stdev);
int	  Geometric(double p);
double Weibull(double scale, double shape);
double Erlang(int scale, double shape);

//void main(void)
void main(int argc, char **argv)
{
	double mean, param2, scale, shape;

	//Seed is the parameter of srand (the random number generator function of C).
	//srand takes an integer as a parameter. If this integer is the same, 
	//then each time the program is exucuted, the same random numbers
	//will be generated. In order to avoid this, we put the current time as the parameter of 
	//the srand function.
	int seed = time(NULL);
	
	//Initiate the random number generator. The initiation must be done outside the generation
	//functions, and usually is done only once.
	srand(seed);
	
	if (argc < 2) {
		printf("usage: %s param1 [param2]\n", argv[0]);
		exit(1);
	}

	mean = atof(argv[1]);
	if(argc > 2) param2 = atof(argv[2]);

	printf("RAND_MAX = %d\n", RAND_MAX);

	printf("Give Mean Value:");
	//scanf("%f",&mean);
	
	printf("\nConstant: %f\n",Constant(mean));
	printf("Uniform [0,1]: %f\n",Uniform(mean));
	printf("Exponential [0, 1]: %f\n",Exponential(mean));
	//printf("Poisson: %d\n",Poisson(mean));
	printf("Pareto: %f\n",Pareto(mean)); // alpha
	printf("Geometric: %d\n",Geometric(mean)); // p
	if (argc > 2) {
		printf("Normal: %f\n",Normal(mean, param2)); // mean, stdev
	//	printf("Weibull: %d\n",Weibull(mean, param2)); // scale, shape
	//	printf("Erlang: %d\n",Erlang(mean, param2)); // scale, shape
	} else
		printf("\nMore results can be added for other functions too (Normal, Weibull, Erlang) ...\n\n");
}


double Constant (double mean)
{
	//printf("mean/5 = %f\n", mean/5);
	return mean;
}


double Uniform(double mean)
{
	//Generate a random number between 0 and 1.
	//REMEMBER: Always cast the oparands of a division to double, or truncation will be performed.
	double R, r;	
	r = rand();
	R = (double)r/((double)RAND_MAX+1.0);
//	printf("rand() = %f, R = %f\n", r, R);
//	printf("rand()/RAND_MAX = %f\n", r/RAND_MAX);
	//printf("rand()/5 = %f\n", r/5);
	
	return  2*mean*R;
}


double Exponential(double mean)
{
	//Generate a random number between 0 and 1.
	//REMEMBER: Always cast the oparands of a division to double, or truncation will be performed.
	double R;
	R = (double)rand()/((double)RAND_MAX+1);
	
	//Put it as a parameter to the inverse distribution function.
	return  -mean*log(R);
}


int Poisson(double mean) //Special technique required: Box-Muller method...
{
	double R;
	double sum = 0;
	int i;
	i=-1;
	double z;

	while(sum <=mean)
	{

		R = (double)rand()/(double)RAND_MAX+1;
		z = -log(R);
		sum+= z;
		i++;
	}
	return i;
}
		

double Pareto(double alpha)
{

	double R;
	R = (double)rand()/((double)RAND_MAX+1);
	return (double)1/(double)(pow(R,(double)1/alpha));
}


double Normal(double mean, double stdev)
{

	double R1;
	R1 = (double)rand()/((double)RAND_MAX+1);
	double R2;
	R2 = (double)rand()/((double)RAND_MAX+1);
	return mean + stdev*cos(2*3.14*R1)*sqrt(-log(R2));
}


int Geometric(double p)
{
	double R;
	R= (double)rand()/((double)RAND_MAX+1);
	return (int)(log(R)/log(1-p) - 1);
}


double Weibull(double scale, double shape)
{
	double R;
	R= (double)rand()/(double)RAND_MAX+1;
	return scale*pow(-log(R),(double)1/shape);
}


double Erlang(int scale, double shape)	//Special technique required...
{
	double R=1;
	int i;
	for (i=1;i<=scale;i++)
		R = R*((double)rand()/((double)RAND_MAX+1));
	return -shape*log(R);
}
