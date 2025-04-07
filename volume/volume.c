#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

const int HEADER_SIZE = 44;

int main(int argc, char *argv[])
{
    if (argc != 4)
    {
        fprintf(stderr, "Usage: ./volume input.wav output.wav factor\n");
        return 1;
    }
    char *input_filename = argv[1];
    char *output_filename = argv[2];
    float factor = atof(argv[3]);

    FILE *input_file = fopen(input_filename, "rb");
    if (input_file == NULL)
    {
        printf("Could not open file %s.\n", input_filename);
        return 1;
    }

    FILE *output_file = fopen(output_filename, "wb");
    if (output_file == NULL)
    {
        printf("Could not create file %s.\n", output_filename);
        fclose(input_file);
        return 1;
    }
    uint8_t header[HEADER_SIZE];
    fread(header, sizeof(uint8_t), HEADER_SIZE, input_file);
    fwrite(header, sizeof(uint8_t), HEADER_SIZE, output_file);

    int16_t sample;
    while (fread(&sample, sizeof(int16_t), 1, input_file))
    {
        int32_t adjusted_sample = (int32_t) (sample * factor);
        if (adjusted_sample > INT16_MAX)
        {
            adjusted_sample = INT16_MAX;
        }
        else if (adjusted_sample < INT16_MIN)
        {
            adjusted_sample = INT16_MIN;
        }
        int16_t final_sample = (int16_t) adjusted_sample;
        fwrite(&final_sample, sizeof(int16_t), 1, output_file);
    }

    fclose(input_file);
    fclose(output_file);
    return 0;
}
