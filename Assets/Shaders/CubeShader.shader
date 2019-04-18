Shader "Custom/CubeShader"
{
    Properties
    {
        _Color ("Color", Color) = (1, 1, 1, 1)
        _AnimationSpeed("Animation Speed", Range(0,3)) =0
        _OffsetSize("Offset Size", Range(0,10)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            float4 _Color;
            float _AnimationSpeed;
            float _OffsetSize;

            v2f vert (appdata v)
            {
                v2f o;
                v.vertex.x +=sin(_Time.y * _AnimationSpeed + v.vertex.y * _OffsetSize);
                v.vertex.z +=sin(_Time.y * _AnimationSpeed + v.vertex.y * _OffsetSize + .5);
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
              
                fixed4 col = _Color;

                return col;
            }
            ENDCG
        }
    }
}