#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>



//Note: float variables are used. If you want to generate integer variables, just change the
//return type of the function and all other types which are related to the result...
float Constant(float mean);
float Uniform(float mean);
float Exponential(float mean);
int   Poisson(float mean);
float Pareto(float alpha);
float Normal(float mean, float stdev);
int	  Geometric(float p);
float Weibull(float scale, float shape);
float Erlang(int scale, float shape);

//void main(void)
void main(int argc, char **argv)
{
	float mean, param2, scale, shape;

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

	printf("Give Mean Value:");
	//scanf("%f",&mean);
	
	printf("\nConstant: %f\n",Constant(mean));
	printf("Uniform: %f\n",Uniform(mean));
	printf("Exponential: %f\n",Exponential(mean));
	printf("Poisson: %d\n",Poisson(mean));
	printf("Pareto: %d\n",Pareto(mean)); // alpha
	printf("Geometric: %d\n",Geometric(mean)); // p
	if (argc > 2) {
	printf("Normal: %f\n",Normal(mean, param2)); // mean, stdev
	printf("Weibull: %d\n",Weibull(mean, param2)); // scale, shape
	printf("Erlang: %d\n",Erlang(mean, param2)); // scale, shape
	} else
	printf("\nMore results can be added for other functions too (Normal, Weibull, Erlang) ...\n\n");
}


float Constant (float mean)
{
	return mean;
}


float Uniform(float mean)
{
	//Generate a random number between 0 and 1.
	//REMEMBER: Always cast the oparands of a division to float, or truncation will be performed.
	float R;
	R = (float)rand()/(float)(RAND_MAX+1);
	
	return  2*mean*R;
}


float Exponential(float mean)
{
	//Generate a random number between 0 and 1.
	//REMEMBER: Always cast the oparands of a division to float, or truncation will be performed.
	float R;
	R = (float)rand()/(float)(RAND_MAX+1);
	
	//Put it as a parameter to the inverse distribution function.
	return  -mean*log(R);
}


int Poisson(float mean) //Special technique required: Box-Muller method...
{
	float R;
	float sum = 0;
	int i;
	i=-1;
	float z;

	while(sum <=mean)
	{

		R = (float)rand()/(float)(RAND_MAX+1);
		z = -log(R);
		sum+= z;
		i++;
	}
	return i;
}
		

float Pareto(float alpha)
{

	float R;
	R = (float)rand()/(float)(RAND_MAX+1);
	return (float)1/(float)(pow(R,(float)1/alpha));
}


float Normal(float mean, float stdev)
{

	float R1;
	R1 = (float)rand()/(float)(RAND_MAX+1);
	float R2;
	R2 = (float)rand()/(float)(RAND_MAX+1);
	return mean + stdev*cos(2*3.14*R1)*sqrt(-log(R2));
}


int Geometric(float p)
{
	float R;
	R= (float)rand()/(float)(RAND_MAX+1);
	return (int)(log(R)/log(1-p) - 1);
}


float Weibull(float scale, float shape)
{
	float R;
	R= (float)rand()/(float)(RAND_MAX+1);
	return scale*pow(-log(R),(float)1/shape);
}


float Erlang(int scale, float shape)	//Special technique required...
{
	float R=1;
	int i;
	for (i=1;i<=scale;i++)
		R = R*((float)rand()/(float)(RAND_MAX+1));
	return -shape*log(R);
}
