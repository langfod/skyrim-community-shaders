RWTexture2D<float> BlendedDepthTexture : register(u0);
Texture2D<unorm float> MainDepthTexture : register(t0);
Texture2D<unorm float> TerrainDepthTexture : register(t1);

[numthreads(32, 32, 1)] void main(uint3 DTid
								  : SV_DispatchThreadID) {
	float mixedDepth = min(MainDepthTexture[DTid.xy], TerrainDepthTexture[DTid.xy]);
	BlendedDepthTexture[DTid.xy] = mixedDepth;
}
