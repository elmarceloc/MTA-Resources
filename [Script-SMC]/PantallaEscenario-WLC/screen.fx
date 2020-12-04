texture gTexture;
float4 brightness = float4(1, 1, 1, 1);

technique TexReplace
{
    pass P0
    {
        Texture[0] = gTexture;
        MaterialEmissive = brightness;
    }
}


