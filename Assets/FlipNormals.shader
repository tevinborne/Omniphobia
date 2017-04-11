﻿Shader "Flip Normals" {
	Properties{
		_MainTex("Base (RGB) Alpha(A)", 2D) = "black" {}
	}
		SubShader{

		Tags{ "RenderType" = "Transparent" }

		Cull Front

		CGPROGRAM

#pragma surface surf Lambert vertex:vert
#pragma surface surf Standard alpha:fade
		sampler2D _MainTex;

	struct Input {
		float2 uv_MainTex;
		float4 color : COLOR;
	};


	void vert(inout appdata_full v)
	{
		v.normal.xyz = v.normal * -1;
	}

	void surf(Input IN, inout SurfaceOutput o) {
		fixed3 result = tex2D(_MainTex, IN.uv_MainTex);
		o.Albedo = result.rgb;
		o.Alpha = 0;
	}

	ENDCG

	}

		Fallback "Diffuse"
}
