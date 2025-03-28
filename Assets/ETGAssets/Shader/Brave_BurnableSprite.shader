//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/BurnableSprite" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
_PixelHeight ("Pixel Height", Float) = 16
_Threshold ("Burn Percentage", Range(0, 1)) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 2186
Program "vp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "DUMMY" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = _PixelHeight * _Threshold;
    u_xlat1.x = (-u_xlat1.x) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "DUMMY" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 150
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %133 %139 %142 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %142 Location 142 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                         u32 %109 = OpConstant 2 
                                             %110 = OpTypePointer Uniform %6 
                                         u32 %114 = OpConstant 0 
                                             %115 = OpTypePointer Private %6 
                                Private f32* %125 = OpVariable Private 
                               Output f32_3* %133 = OpVariable Output 
                               Output f32_4* %139 = OpVariable Output 
                                         f32 %140 = OpConstant 3.67402E-40 
                                       f32_4 %141 = OpConstantComposite %140 %140 %140 %140 
                               Output f32_3* %142 = OpVariable Output 
                                       f32_3 %143 = OpConstantComposite %140 %140 %140 
                                             %144 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %36 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %36 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %86 = OpAccessChain %21 %36 %46 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %44 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %23 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %100 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %46 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %97 %108 
                                Uniform f32* %111 = OpAccessChain %21 %24 %23 %109 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpFNegate %112 
                                Private f32* %116 = OpAccessChain %9 %114 
                                                      OpStore %116 %113 
                                Uniform f32* %117 = OpAccessChain %21 %24 %24 %109 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                Private f32* %120 = OpAccessChain %9 %81 
                                                      OpStore %120 %119 
                                Uniform f32* %121 = OpAccessChain %21 %24 %36 %109 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                Private f32* %124 = OpAccessChain %9 %109 
                                                      OpStore %124 %123 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                         f32 %130 = OpDot %127 %129 
                                                      OpStore %125 %130 
                                         f32 %131 = OpLoad %125 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %125 %132 
                                         f32 %134 = OpLoad %125 
                                       f32_3 %135 = OpCompositeConstruct %134 %134 %134 
                                       f32_4 %136 = OpLoad %9 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpFMul %135 %137 
                                                      OpStore %133 %138 
                                                      OpStore %139 %141 
                                                      OpStore %142 %143 
                                 Output f32* %145 = OpAccessChain %85 %23 %81 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFNegate %146 
                                 Output f32* %148 = OpAccessChain %85 %23 %81 
                                                      OpStore %148 %147 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 226
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %46 %89 %201 %214 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpMemberDecorate %25 0 RelaxedPrecision 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpMemberDecorate %25 1 RelaxedPrecision 
                                                      OpMemberDecorate %25 1 Offset 25 
                                                      OpMemberDecorate %25 2 Offset 25 
                                                      OpMemberDecorate %25 3 Offset 25 
                                                      OpMemberDecorate %25 4 Offset 25 
                                                      OpMemberDecorate %25 5 Offset 25 
                                                      OpMemberDecorate %25 6 RelaxedPrecision 
                                                      OpMemberDecorate %25 6 Offset 25 
                                                      OpMemberDecorate %25 7 Offset 25 
                                                      OpMemberDecorate %25 8 Offset 25 
                                                      OpDecorate %25 Block 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %170 DescriptorSet 170 
                                                      OpDecorate %170 Binding 170 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 Location 201 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %214 Location 214 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeVector %6 3 
                                              %25 = OpTypeStruct %7 %7 %7 %23 %24 %24 %7 %6 %6 
                                              %26 = OpTypePointer Uniform %25 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 8 
                                              %30 = OpTypePointer Uniform %6 
                                          i32 %33 = OpConstant 7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %24 
                                 Input f32_3* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %58 = OpConstant 3.67402E-40 
                                          i32 %61 = OpConstant 0 
                                          i32 %62 = OpConstant 1 
                                          i32 %64 = OpConstant -1 
                                          i32 %70 = OpConstant 2 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                              %87 = OpTypePointer Private %24 
                               Private f32_3* %88 = OpVariable Private 
                                 Input f32_3* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 3 
                                              %93 = OpTypePointer Uniform %7 
                                             %119 = OpTypePointer Function %24 
                                         i32 %132 = OpConstant 5 
                                             %133 = OpTypePointer Uniform %24 
                                         i32 %142 = OpConstant 4 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                Private f32* %155 = OpVariable Private 
                                         u32 %156 = OpConstant 2 
                                         f32 %159 = OpConstant 3.67402E-40 
                                             %167 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %168 = OpTypeSampledImage %167 
                                             %169 = OpTypePointer UniformConstant %168 
 UniformConstant read_only Texture3DSampled* %170 = OpVariable UniformConstant 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %181 = OpConstant 3 
                              Private f32_3* %183 = OpVariable Private 
                                         i32 %195 = OpConstant 6 
                                Private f32* %200 = OpVariable Private 
                                Input f32_3* %201 = OpVariable Input 
                                             %213 = OpTypePointer Output %7 
                               Output f32_4* %214 = OpVariable Output 
                                             %223 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %120 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %31 = OpAccessChain %27 %29 
                                          f32 %32 = OpLoad %31 
                                 Uniform f32* %34 = OpAccessChain %27 %33 
                                          f32 %35 = OpLoad %34 
                                          f32 %36 = OpFMul %32 %35 
                                 Private f32* %39 = OpAccessChain %20 %37 
                                                      OpStore %39 %36 
                                 Private f32* %40 = OpAccessChain %20 %37 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFMul %42 %43 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %44 %50 
                                 Private f32* %52 = OpAccessChain %20 %37 
                                                      OpStore %52 %51 
                                 Private f32* %56 = OpAccessChain %20 %37 
                                          f32 %57 = OpLoad %56 
                                         bool %59 = OpFOrdLessThan %57 %58 
                                                      OpStore %55 %59 
                                         bool %60 = OpLoad %55 
                                          i32 %63 = OpSelect %60 %62 %61 
                                          i32 %65 = OpIMul %63 %64 
                                         bool %66 = OpINotEqual %65 %61 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %68 
                                              %67 = OpLabel 
                                                      OpKill
                                              %68 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %27 %70 %37 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %55 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %55 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %177 
                                              %82 = OpLabel 
                                 Uniform f32* %84 = OpAccessChain %27 %70 %47 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdEqual %85 %73 
                                                      OpStore %55 %86 
                                        f32_3 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 1 1 1 
                               Uniform f32_4* %94 = OpAccessChain %27 %92 %62 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFMul %91 %96 
                                                      OpStore %88 %97 
                               Uniform f32_4* %98 = OpAccessChain %27 %92 %61 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpLoad %89 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_3 %104 = OpLoad %88 
                                       f32_3 %105 = OpFAdd %103 %104 
                                                      OpStore %88 %105 
                              Uniform f32_4* %106 = OpAccessChain %27 %92 %70 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpLoad %89 
                                       f32_3 %110 = OpVectorShuffle %109 %109 2 2 2 
                                       f32_3 %111 = OpFMul %108 %110 
                                       f32_3 %112 = OpLoad %88 
                                       f32_3 %113 = OpFAdd %111 %112 
                                                      OpStore %88 %113 
                                       f32_3 %114 = OpLoad %88 
                              Uniform f32_4* %115 = OpAccessChain %27 %92 %92 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                                      OpStore %88 %118 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %125 
                                             %122 = OpLabel 
                                       f32_3 %124 = OpLoad %88 
                                                      OpStore %120 %124 
                                                      OpBranch %123 
                                             %125 = OpLabel 
                                       f32_3 %126 = OpLoad %89 
                                                      OpStore %120 %126 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_3 %127 = OpLoad %120 
                                       f32_4 %128 = OpLoad %20 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %20 %129 
                                       f32_4 %130 = OpLoad %20 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %27 %132 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFNegate %135 
                                       f32_3 %137 = OpFAdd %131 %136 
                                       f32_4 %138 = OpLoad %20 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %20 %139 
                                       f32_4 %140 = OpLoad %20 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %27 %142 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %141 %144 
                                       f32_4 %146 = OpLoad %20 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %20 %147 
                                Private f32* %148 = OpAccessChain %20 %47 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %88 %37 
                                                      OpStore %154 %153 
                                Uniform f32* %157 = OpAccessChain %27 %70 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                         f32 %161 = OpFAdd %160 %152 
                                                      OpStore %155 %161 
                                Private f32* %162 = OpAccessChain %88 %37 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpLoad %155 
                                         f32 %165 = OpExtInst %1 40 %163 %164 
                                Private f32* %166 = OpAccessChain %20 %37 
                                                      OpStore %166 %165 
                  read_only Texture3DSampled %171 = OpLoad %170 
                                       f32_4 %172 = OpLoad %20 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 2 3 
                                       f32_4 %174 = OpImageSampleImplicitLod %171 %173 
                                                      OpStore %20 %174 
                                       f32_4 %176 = OpLoad %20 
                                                      OpStore %175 %176 
                                                      OpBranch %83 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %175 %37 
                                                      OpStore %178 %73 
                                Private f32* %179 = OpAccessChain %175 %47 
                                                      OpStore %179 %73 
                                Private f32* %180 = OpAccessChain %175 %156 
                                                      OpStore %180 %73 
                                Private f32* %182 = OpAccessChain %175 %181 
                                                      OpStore %182 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %184 = OpLoad %175 
                              Uniform f32_4* %185 = OpAccessChain %27 %62 
                                       f32_4 %186 = OpLoad %185 
                                         f32 %187 = OpDot %184 %186 
                                Private f32* %188 = OpAccessChain %183 %37 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %183 %37 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpExtInst %1 43 %190 %58 %73 
                                Private f32* %192 = OpAccessChain %183 %37 
                                                      OpStore %192 %191 
                                       f32_3 %193 = OpLoad %183 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                              Uniform f32_4* %196 = OpAccessChain %27 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFMul %194 %198 
                                                      OpStore %183 %199 
                                       f32_3 %202 = OpLoad %201 
                              Uniform f32_4* %203 = OpAccessChain %27 %61 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                         f32 %206 = OpDot %202 %205 
                                                      OpStore %200 %206 
                                         f32 %207 = OpLoad %200 
                                         f32 %208 = OpExtInst %1 40 %207 %58 
                                                      OpStore %200 %208 
                                       f32_4 %209 = OpLoad %9 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpLoad %183 
                                       f32_3 %212 = OpFMul %210 %211 
                                                      OpStore %183 %212 
                                         f32 %215 = OpLoad %200 
                                       f32_3 %216 = OpCompositeConstruct %215 %215 %215 
                                       f32_3 %217 = OpLoad %183 
                                       f32_3 %218 = OpFMul %216 %217 
                                       f32_4 %219 = OpLoad %214 
                                       f32_4 %220 = OpVectorShuffle %219 %218 4 5 6 3 
                                                      OpStore %214 %220 
                                Private f32* %221 = OpAccessChain %9 %181 
                                         f32 %222 = OpLoad %221 
                                 Output f32* %224 = OpAccessChain %214 %181 
                                                      OpStore %224 %222 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "DUMMY" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat1.x = u_xlat0.y * u_xlat0.y;
    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat0.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat0);
    u_xlat2.y = dot(unity_SHAg, u_xlat0);
    u_xlat2.z = dot(unity_SHAb, u_xlat0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = _PixelHeight * _Threshold;
    u_xlat1.x = (-u_xlat1.x) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD5.xyz;
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "DUMMY" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 266
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %53 %87 %99 %100 %144 %147 %150 %257 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 RelaxedPrecision 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpMemberDecorate %19 10 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %53 Location 53 
                                                      OpMemberDecorate %85 0 BuiltIn 85 
                                                      OpMemberDecorate %85 1 BuiltIn 85 
                                                      OpMemberDecorate %85 2 BuiltIn 85 
                                                      OpDecorate %85 Block 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %100 Location 100 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %257 Location 257 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %7 %7 %7 %7 %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 7 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %29 = OpConstant 0 
                                          i32 %37 = OpConstant 2 
                               Private f32_4* %45 = OpVariable Private 
                                          i32 %47 = OpConstant 3 
                                              %51 = OpTypeVector %6 3 
                                              %52 = OpTypePointer Output %51 
                                Output f32_3* %53 = OpVariable Output 
                                          i32 %65 = OpConstant 9 
                                          u32 %83 = OpConstant 1 
                                              %84 = OpTypeArray %6 %83 
                                              %85 = OpTypeStruct %7 %6 %84 
                                              %86 = OpTypePointer Output %85 
         Output struct {f32_4; f32; f32[1];}* %87 = OpVariable Output 
                                              %95 = OpTypePointer Output %7 
                                              %97 = OpTypeVector %6 2 
                                              %98 = OpTypePointer Output %97 
                                Output f32_2* %99 = OpVariable Output 
                                Input f32_4* %100 = OpVariable Input 
                                         i32 %103 = OpConstant 10 
                                         i32 %112 = OpConstant 8 
                                         u32 %113 = OpConstant 2 
                                             %114 = OpTypePointer Uniform %6 
                                         u32 %118 = OpConstant 0 
                                             %119 = OpTypePointer Private %6 
                                Private f32* %129 = OpVariable Private 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                                         f32 %148 = OpConstant 3.67402E-40 
                                       f32_4 %149 = OpConstantComposite %148 %148 %148 %148 
                               Output f32_3* %150 = OpVariable Output 
                                       f32_3 %151 = OpConstantComposite %148 %148 %148 
                                             %152 = OpTypePointer Private %51 
                              Private f32_3* %153 = OpVariable Private 
                              Private f32_4* %170 = OpVariable Private 
                              Private f32_3* %176 = OpVariable Private 
                                         i32 %182 = OpConstant 4 
                                         i32 %188 = OpConstant 5 
                                         i32 %194 = OpConstant 6 
                                         f32 %203 = OpConstant 3.67402E-40 
                                         u32 %204 = OpConstant 3 
                                         f32 %232 = OpConstant 3.67402E-40 
                                       f32_3 %233 = OpConstantComposite %232 %232 %232 
                                         f32 %244 = OpConstant 3.67402E-40 
                                       f32_3 %245 = OpConstantComposite %244 %244 %244 
                                         f32 %247 = OpConstant 3.67402E-40 
                                       f32_3 %248 = OpConstantComposite %247 %247 %247 
                               Output f32_3* %257 = OpVariable Output 
                                             %260 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %30 = OpAccessChain %21 %23 %29 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %21 %23 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %46 = OpLoad %9 
                               Uniform f32_4* %48 = OpAccessChain %21 %23 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpFAdd %46 %49 
                                                      OpStore %45 %50 
                               Uniform f32_4* %54 = OpAccessChain %21 %23 %47 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_4 %57 = OpLoad %11 
                                        f32_3 %58 = OpVectorShuffle %57 %57 3 3 3 
                                        f32_3 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFAdd %59 %61 
                                                      OpStore %53 %62 
                                        f32_4 %63 = OpLoad %45 
                                        f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %21 %65 %24 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpFMul %64 %67 
                                                      OpStore %9 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %65 %29 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %45 
                                        f32_4 %72 = OpVectorShuffle %71 %71 0 0 0 0 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                               Uniform f32_4* %76 = OpAccessChain %21 %65 %37 
                                        f32_4 %77 = OpLoad %76 
                                        f32_4 %78 = OpLoad %45 
                                        f32_4 %79 = OpVectorShuffle %78 %78 2 2 2 2 
                                        f32_4 %80 = OpFMul %77 %79 
                                        f32_4 %81 = OpLoad %9 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %9 %82 
                               Uniform f32_4* %88 = OpAccessChain %21 %65 %47 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpLoad %45 
                                        f32_4 %91 = OpVectorShuffle %90 %90 3 3 3 3 
                                        f32_4 %92 = OpFMul %89 %91 
                                        f32_4 %93 = OpLoad %9 
                                        f32_4 %94 = OpFAdd %92 %93 
                                Output f32_4* %96 = OpAccessChain %87 %29 
                                                      OpStore %96 %94 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                              Uniform f32_4* %104 = OpAccessChain %21 %103 
                                       f32_4 %105 = OpLoad %104 
                                       f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                       f32_2 %107 = OpFMul %102 %106 
                              Uniform f32_4* %108 = OpAccessChain %21 %103 
                                       f32_4 %109 = OpLoad %108 
                                       f32_2 %110 = OpVectorShuffle %109 %109 2 3 
                                       f32_2 %111 = OpFAdd %107 %110 
                                                      OpStore %99 %111 
                                Uniform f32* %115 = OpAccessChain %21 %112 %29 %113 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFNegate %116 
                                Private f32* %120 = OpAccessChain %9 %118 
                                                      OpStore %120 %117 
                                Uniform f32* %121 = OpAccessChain %21 %112 %24 %113 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                Private f32* %124 = OpAccessChain %9 %83 
                                                      OpStore %124 %123 
                                Uniform f32* %125 = OpAccessChain %21 %112 %37 %113 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFNegate %126 
                                Private f32* %128 = OpAccessChain %9 %113 
                                                      OpStore %128 %127 
                                       f32_4 %130 = OpLoad %9 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %9 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %137 = OpLoad %129 
                                       f32_3 %138 = OpCompositeConstruct %137 %137 %137 
                                       f32_4 %139 = OpLoad %9 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFMul %138 %140 
                                       f32_4 %142 = OpLoad %9 
                                       f32_4 %143 = OpVectorShuffle %142 %141 4 5 6 3 
                                                      OpStore %9 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                                      OpStore %147 %149 
                                                      OpStore %150 %151 
                                Private f32* %154 = OpAccessChain %9 %83 
                                         f32 %155 = OpLoad %154 
                                Private f32* %156 = OpAccessChain %9 %83 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFMul %155 %157 
                                Private f32* %159 = OpAccessChain %153 %118 
                                                      OpStore %159 %158 
                                Private f32* %160 = OpAccessChain %9 %118 
                                         f32 %161 = OpLoad %160 
                                Private f32* %162 = OpAccessChain %9 %118 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFMul %161 %163 
                                Private f32* %165 = OpAccessChain %153 %118 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFNegate %166 
                                         f32 %168 = OpFAdd %164 %167 
                                Private f32* %169 = OpAccessChain %153 %118 
                                                      OpStore %169 %168 
                                       f32_4 %171 = OpLoad %9 
                                       f32_4 %172 = OpVectorShuffle %171 %171 1 2 2 0 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 0 1 2 2 
                                       f32_4 %175 = OpFMul %172 %174 
                                                      OpStore %170 %175 
                              Uniform f32_4* %177 = OpAccessChain %21 %47 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpLoad %170 
                                         f32 %180 = OpDot %178 %179 
                                Private f32* %181 = OpAccessChain %176 %118 
                                                      OpStore %181 %180 
                              Uniform f32_4* %183 = OpAccessChain %21 %182 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %170 
                                         f32 %186 = OpDot %184 %185 
                                Private f32* %187 = OpAccessChain %176 %83 
                                                      OpStore %187 %186 
                              Uniform f32_4* %189 = OpAccessChain %21 %188 
                                       f32_4 %190 = OpLoad %189 
                                       f32_4 %191 = OpLoad %170 
                                         f32 %192 = OpDot %190 %191 
                                Private f32* %193 = OpAccessChain %176 %113 
                                                      OpStore %193 %192 
                              Uniform f32_4* %195 = OpAccessChain %21 %194 
                                       f32_4 %196 = OpLoad %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                       f32_3 %198 = OpLoad %153 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 0 0 
                                       f32_3 %200 = OpFMul %197 %199 
                                       f32_3 %201 = OpLoad %176 
                                       f32_3 %202 = OpFAdd %200 %201 
                                                      OpStore %153 %202 
                                Private f32* %205 = OpAccessChain %9 %204 
                                                      OpStore %205 %203 
                              Uniform f32_4* %206 = OpAccessChain %21 %29 
                                       f32_4 %207 = OpLoad %206 
                                       f32_4 %208 = OpLoad %9 
                                         f32 %209 = OpDot %207 %208 
                                Private f32* %210 = OpAccessChain %176 %118 
                                                      OpStore %210 %209 
                              Uniform f32_4* %211 = OpAccessChain %21 %24 
                                       f32_4 %212 = OpLoad %211 
                                       f32_4 %213 = OpLoad %9 
                                         f32 %214 = OpDot %212 %213 
                                Private f32* %215 = OpAccessChain %176 %83 
                                                      OpStore %215 %214 
                              Uniform f32_4* %216 = OpAccessChain %21 %37 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %9 
                                         f32 %219 = OpDot %217 %218 
                                Private f32* %220 = OpAccessChain %176 %113 
                                                      OpStore %220 %219 
                                       f32_3 %221 = OpLoad %153 
                                       f32_3 %222 = OpLoad %176 
                                       f32_3 %223 = OpFAdd %221 %222 
                                                      OpStore %153 %223 
                                       f32_3 %224 = OpLoad %153 
                                       f32_3 %225 = OpExtInst %1 40 %224 %151 
                                                      OpStore %153 %225 
                                       f32_3 %226 = OpLoad %153 
                                       f32_3 %227 = OpExtInst %1 30 %226 
                                       f32_4 %228 = OpLoad %9 
                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                                      OpStore %9 %229 
                                       f32_4 %230 = OpLoad %9 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                                       f32_3 %234 = OpFMul %231 %233 
                                       f32_4 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 6 3 
                                                      OpStore %9 %236 
                                       f32_4 %237 = OpLoad %9 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %239 = OpExtInst %1 29 %238 
                                       f32_4 %240 = OpLoad %9 
                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 6 3 
                                                      OpStore %9 %241 
                                       f32_4 %242 = OpLoad %9 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_3 %249 = OpFAdd %246 %248 
                                       f32_4 %250 = OpLoad %9 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %9 %251 
                                       f32_4 %252 = OpLoad %9 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_3 %254 = OpExtInst %1 40 %253 %151 
                                       f32_4 %255 = OpLoad %9 
                                       f32_4 %256 = OpVectorShuffle %255 %254 4 5 6 3 
                                                      OpStore %9 %256 
                                       f32_4 %258 = OpLoad %9 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                                      OpStore %257 %259 
                                 Output f32* %261 = OpAccessChain %87 %29 %83 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpFNegate %262 
                                 Output f32* %264 = OpAccessChain %87 %29 %83 
                                                      OpStore %264 %263 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 234
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %46 %89 %201 %216 %220 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpMemberDecorate %25 0 RelaxedPrecision 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpMemberDecorate %25 1 RelaxedPrecision 
                                                      OpMemberDecorate %25 1 Offset 25 
                                                      OpMemberDecorate %25 2 Offset 25 
                                                      OpMemberDecorate %25 3 Offset 25 
                                                      OpMemberDecorate %25 4 Offset 25 
                                                      OpMemberDecorate %25 5 Offset 25 
                                                      OpMemberDecorate %25 6 RelaxedPrecision 
                                                      OpMemberDecorate %25 6 Offset 25 
                                                      OpMemberDecorate %25 7 Offset 25 
                                                      OpMemberDecorate %25 8 Offset 25 
                                                      OpDecorate %25 Block 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %170 DescriptorSet 170 
                                                      OpDecorate %170 Binding 170 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 Location 201 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %216 Location 216 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %220 Location 220 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeVector %6 3 
                                              %25 = OpTypeStruct %7 %7 %7 %23 %24 %24 %7 %6 %6 
                                              %26 = OpTypePointer Uniform %25 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 8 
                                              %30 = OpTypePointer Uniform %6 
                                          i32 %33 = OpConstant 7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %24 
                                 Input f32_3* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %58 = OpConstant 3.67402E-40 
                                          i32 %61 = OpConstant 0 
                                          i32 %62 = OpConstant 1 
                                          i32 %64 = OpConstant -1 
                                          i32 %70 = OpConstant 2 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                              %87 = OpTypePointer Private %24 
                               Private f32_3* %88 = OpVariable Private 
                                 Input f32_3* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 3 
                                              %93 = OpTypePointer Uniform %7 
                                             %119 = OpTypePointer Function %24 
                                         i32 %132 = OpConstant 5 
                                             %133 = OpTypePointer Uniform %24 
                                         i32 %142 = OpConstant 4 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                Private f32* %155 = OpVariable Private 
                                         u32 %156 = OpConstant 2 
                                         f32 %159 = OpConstant 3.67402E-40 
                                             %167 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %168 = OpTypeSampledImage %167 
                                             %169 = OpTypePointer UniformConstant %168 
 UniformConstant read_only Texture3DSampled* %170 = OpVariable UniformConstant 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %181 = OpConstant 3 
                              Private f32_3* %183 = OpVariable Private 
                                         i32 %195 = OpConstant 6 
                                Private f32* %200 = OpVariable Private 
                                Input f32_3* %201 = OpVariable Input 
                              Private f32_3* %213 = OpVariable Private 
                                Input f32_3* %216 = OpVariable Input 
                                             %219 = OpTypePointer Output %7 
                               Output f32_4* %220 = OpVariable Output 
                                             %231 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %120 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %31 = OpAccessChain %27 %29 
                                          f32 %32 = OpLoad %31 
                                 Uniform f32* %34 = OpAccessChain %27 %33 
                                          f32 %35 = OpLoad %34 
                                          f32 %36 = OpFMul %32 %35 
                                 Private f32* %39 = OpAccessChain %20 %37 
                                                      OpStore %39 %36 
                                 Private f32* %40 = OpAccessChain %20 %37 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFMul %42 %43 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %44 %50 
                                 Private f32* %52 = OpAccessChain %20 %37 
                                                      OpStore %52 %51 
                                 Private f32* %56 = OpAccessChain %20 %37 
                                          f32 %57 = OpLoad %56 
                                         bool %59 = OpFOrdLessThan %57 %58 
                                                      OpStore %55 %59 
                                         bool %60 = OpLoad %55 
                                          i32 %63 = OpSelect %60 %62 %61 
                                          i32 %65 = OpIMul %63 %64 
                                         bool %66 = OpINotEqual %65 %61 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %68 
                                              %67 = OpLabel 
                                                      OpKill
                                              %68 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %27 %70 %37 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %55 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %55 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %177 
                                              %82 = OpLabel 
                                 Uniform f32* %84 = OpAccessChain %27 %70 %47 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdEqual %85 %73 
                                                      OpStore %55 %86 
                                        f32_3 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 1 1 1 
                               Uniform f32_4* %94 = OpAccessChain %27 %92 %62 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFMul %91 %96 
                                                      OpStore %88 %97 
                               Uniform f32_4* %98 = OpAccessChain %27 %92 %61 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpLoad %89 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_3 %104 = OpLoad %88 
                                       f32_3 %105 = OpFAdd %103 %104 
                                                      OpStore %88 %105 
                              Uniform f32_4* %106 = OpAccessChain %27 %92 %70 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpLoad %89 
                                       f32_3 %110 = OpVectorShuffle %109 %109 2 2 2 
                                       f32_3 %111 = OpFMul %108 %110 
                                       f32_3 %112 = OpLoad %88 
                                       f32_3 %113 = OpFAdd %111 %112 
                                                      OpStore %88 %113 
                                       f32_3 %114 = OpLoad %88 
                              Uniform f32_4* %115 = OpAccessChain %27 %92 %92 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                                      OpStore %88 %118 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %125 
                                             %122 = OpLabel 
                                       f32_3 %124 = OpLoad %88 
                                                      OpStore %120 %124 
                                                      OpBranch %123 
                                             %125 = OpLabel 
                                       f32_3 %126 = OpLoad %89 
                                                      OpStore %120 %126 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_3 %127 = OpLoad %120 
                                       f32_4 %128 = OpLoad %20 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %20 %129 
                                       f32_4 %130 = OpLoad %20 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %27 %132 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFNegate %135 
                                       f32_3 %137 = OpFAdd %131 %136 
                                       f32_4 %138 = OpLoad %20 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %20 %139 
                                       f32_4 %140 = OpLoad %20 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %27 %142 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %141 %144 
                                       f32_4 %146 = OpLoad %20 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %20 %147 
                                Private f32* %148 = OpAccessChain %20 %47 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %88 %37 
                                                      OpStore %154 %153 
                                Uniform f32* %157 = OpAccessChain %27 %70 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                         f32 %161 = OpFAdd %160 %152 
                                                      OpStore %155 %161 
                                Private f32* %162 = OpAccessChain %88 %37 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpLoad %155 
                                         f32 %165 = OpExtInst %1 40 %163 %164 
                                Private f32* %166 = OpAccessChain %20 %37 
                                                      OpStore %166 %165 
                  read_only Texture3DSampled %171 = OpLoad %170 
                                       f32_4 %172 = OpLoad %20 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 2 3 
                                       f32_4 %174 = OpImageSampleImplicitLod %171 %173 
                                                      OpStore %20 %174 
                                       f32_4 %176 = OpLoad %20 
                                                      OpStore %175 %176 
                                                      OpBranch %83 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %175 %37 
                                                      OpStore %178 %73 
                                Private f32* %179 = OpAccessChain %175 %47 
                                                      OpStore %179 %73 
                                Private f32* %180 = OpAccessChain %175 %156 
                                                      OpStore %180 %73 
                                Private f32* %182 = OpAccessChain %175 %181 
                                                      OpStore %182 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %184 = OpLoad %175 
                              Uniform f32_4* %185 = OpAccessChain %27 %62 
                                       f32_4 %186 = OpLoad %185 
                                         f32 %187 = OpDot %184 %186 
                                Private f32* %188 = OpAccessChain %183 %37 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %183 %37 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpExtInst %1 43 %190 %58 %73 
                                Private f32* %192 = OpAccessChain %183 %37 
                                                      OpStore %192 %191 
                                       f32_3 %193 = OpLoad %183 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                              Uniform f32_4* %196 = OpAccessChain %27 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFMul %194 %198 
                                                      OpStore %183 %199 
                                       f32_3 %202 = OpLoad %201 
                              Uniform f32_4* %203 = OpAccessChain %27 %61 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                         f32 %206 = OpDot %202 %205 
                                                      OpStore %200 %206 
                                         f32 %207 = OpLoad %200 
                                         f32 %208 = OpExtInst %1 40 %207 %58 
                                                      OpStore %200 %208 
                                       f32_4 %209 = OpLoad %9 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpLoad %183 
                                       f32_3 %212 = OpFMul %210 %211 
                                                      OpStore %183 %212 
                                       f32_4 %214 = OpLoad %9 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %217 = OpLoad %216 
                                       f32_3 %218 = OpFMul %215 %217 
                                                      OpStore %213 %218 
                                       f32_3 %221 = OpLoad %183 
                                         f32 %222 = OpLoad %200 
                                       f32_3 %223 = OpCompositeConstruct %222 %222 %222 
                                       f32_3 %224 = OpFMul %221 %223 
                                       f32_3 %225 = OpLoad %213 
                                       f32_3 %226 = OpFAdd %224 %225 
                                       f32_4 %227 = OpLoad %220 
                                       f32_4 %228 = OpVectorShuffle %227 %226 4 5 6 3 
                                                      OpStore %220 %228 
                                Private f32* %229 = OpAccessChain %9 %181 
                                         f32 %230 = OpLoad %229 
                                 Output f32* %232 = OpAccessChain %220 %181 
                                                      OpStore %232 %230 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "DUMMY" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat1.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat1.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat18 = u_xlat1.y * u_xlat1.y;
    u_xlat18 = u_xlat1.x * u_xlat1.x + (-u_xlat18);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat1);
    u_xlat3.y = dot(unity_SHAg, u_xlat1);
    u_xlat3.z = dot(unity_SHAb, u_xlat1);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = _PixelHeight * _Threshold;
    u_xlat1.x = (-u_xlat1.x) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD5.xyz;
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "DUMMY" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 393
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %90 %102 %103 %148 %151 %154 %157 %381 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 RelaxedPrecision 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 RelaxedPrecision 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 RelaxedPrecision 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 RelaxedPrecision 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 RelaxedPrecision 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 RelaxedPrecision 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpMemberDecorate %21 9 RelaxedPrecision 
                                                      OpMemberDecorate %21 9 Offset 21 
                                                      OpMemberDecorate %21 10 RelaxedPrecision 
                                                      OpMemberDecorate %21 10 Offset 21 
                                                      OpMemberDecorate %21 11 RelaxedPrecision 
                                                      OpMemberDecorate %21 11 Offset 21 
                                                      OpMemberDecorate %21 12 Offset 21 
                                                      OpMemberDecorate %21 13 Offset 21 
                                                      OpMemberDecorate %21 14 Offset 21 
                                                      OpMemberDecorate %21 15 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %88 0 BuiltIn 88 
                                                      OpMemberDecorate %88 1 BuiltIn 88 
                                                      OpMemberDecorate %88 2 BuiltIn 88 
                                                      OpDecorate %88 Block 
                                                      OpDecorate %102 Location 102 
                                                      OpDecorate %103 Location 103 
                                                      OpDecorate %148 Location 148 
                                                      OpDecorate %151 Location 151 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %154 Location 154 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %381 Location 381 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 8 
                                              %16 = OpTypeArray %7 %15 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeStruct %7 %7 %7 %7 %16 %7 %7 %7 %7 %7 %7 %7 %18 %19 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 12 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 0 
                                          i32 %39 = OpConstant 2 
                               Private f32_4* %47 = OpVariable Private 
                                          i32 %49 = OpConstant 3 
                                              %53 = OpTypeVector %6 3 
                               Private f32_4* %65 = OpVariable Private 
                                          i32 %68 = OpConstant 14 
                                          u32 %86 = OpConstant 1 
                                              %87 = OpTypeArray %6 %86 
                                              %88 = OpTypeStruct %7 %6 %87 
                                              %89 = OpTypePointer Output %88 
         Output struct {f32_4; f32; f32[1];}* %90 = OpVariable Output 
                                              %98 = OpTypePointer Output %7 
                                             %100 = OpTypeVector %6 2 
                                             %101 = OpTypePointer Output %100 
                               Output f32_2* %102 = OpVariable Output 
                                Input f32_4* %103 = OpVariable Input 
                                         i32 %106 = OpConstant 15 
                                         i32 %115 = OpConstant 13 
                                         u32 %116 = OpConstant 2 
                                             %117 = OpTypePointer Uniform %6 
                                         u32 %121 = OpConstant 0 
                                             %122 = OpTypePointer Private %6 
                                Private f32* %132 = OpVariable Private 
                                             %147 = OpTypePointer Output %53 
                               Output f32_3* %148 = OpVariable Output 
                               Output f32_3* %151 = OpVariable Output 
                               Output f32_4* %154 = OpVariable Output 
                                         f32 %155 = OpConstant 3.67402E-40 
                                       f32_4 %156 = OpConstantComposite %155 %155 %155 %155 
                               Output f32_3* %157 = OpVariable Output 
                                       f32_3 %158 = OpConstantComposite %155 %155 %155 
                              Private f32_4* %165 = OpVariable Private 
                              Private f32_4* %178 = OpVariable Private 
                                         f32 %209 = OpConstant 3.67402E-40 
                                       f32_4 %210 = OpConstantComposite %209 %209 %209 %209 
                                         f32 %218 = OpConstant 3.67402E-40 
                                       f32_4 %219 = OpConstantComposite %218 %218 %218 %218 
                                         i32 %233 = OpConstant 4 
                                             %273 = OpTypePointer Private %53 
                              Private f32_3* %274 = OpVariable Private 
                              Private f32_4* %291 = OpVariable Private 
                              Private f32_3* %297 = OpVariable Private 
                                         i32 %298 = OpConstant 8 
                                         i32 %304 = OpConstant 9 
                                         i32 %310 = OpConstant 10 
                                         i32 %316 = OpConstant 11 
                                         u32 %325 = OpConstant 3 
                                         i32 %327 = OpConstant 5 
                                         i32 %333 = OpConstant 6 
                                         i32 %339 = OpConstant 7 
                                         f32 %356 = OpConstant 3.67402E-40 
                                       f32_3 %357 = OpConstantComposite %356 %356 %356 
                                         f32 %368 = OpConstant 3.67402E-40 
                                       f32_3 %369 = OpConstantComposite %368 %368 %368 
                                         f32 %371 = OpConstant 3.67402E-40 
                                       f32_3 %372 = OpConstantComposite %371 %371 %371 
                               Output f32_3* %381 = OpVariable Output 
                                             %387 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %28 = OpAccessChain %23 %25 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpFMul %13 %29 
                                                      OpStore %9 %30 
                               Uniform f32_4* %32 = OpAccessChain %23 %25 %31 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpLoad %11 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                        f32_4 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpFAdd %36 %37 
                                                      OpStore %9 %38 
                               Uniform f32_4* %40 = OpAccessChain %23 %25 %39 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpLoad %11 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                        f32_4 %44 = OpFMul %41 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %9 %46 
                                        f32_4 %48 = OpLoad %9 
                               Uniform f32_4* %50 = OpAccessChain %23 %25 %49 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpFAdd %48 %51 
                                                      OpStore %47 %52 
                               Uniform f32_4* %54 = OpAccessChain %23 %25 %49 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_4 %57 = OpLoad %11 
                                        f32_3 %58 = OpVectorShuffle %57 %57 3 3 3 
                                        f32_3 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %9 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFAdd %59 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %62 4 5 6 3 
                                                      OpStore %9 %64 
                                        f32_4 %66 = OpLoad %47 
                                        f32_4 %67 = OpVectorShuffle %66 %66 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %23 %68 %26 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %67 %70 
                                                      OpStore %65 %71 
                               Uniform f32_4* %72 = OpAccessChain %23 %68 %31 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %47 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %65 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %65 %78 
                               Uniform f32_4* %79 = OpAccessChain %23 %68 %39 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %47 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %65 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %65 %85 
                               Uniform f32_4* %91 = OpAccessChain %23 %68 %49 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpLoad %47 
                                        f32_4 %94 = OpVectorShuffle %93 %93 3 3 3 3 
                                        f32_4 %95 = OpFMul %92 %94 
                                        f32_4 %96 = OpLoad %65 
                                        f32_4 %97 = OpFAdd %95 %96 
                                Output f32_4* %99 = OpAccessChain %90 %31 
                                                      OpStore %99 %97 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                              Uniform f32_4* %107 = OpAccessChain %23 %106 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_2 %110 = OpFMul %105 %109 
                              Uniform f32_4* %111 = OpAccessChain %23 %106 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 2 3 
                                       f32_2 %114 = OpFAdd %110 %113 
                                                      OpStore %102 %114 
                                Uniform f32* %118 = OpAccessChain %23 %115 %31 %116 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFNegate %119 
                                Private f32* %123 = OpAccessChain %47 %121 
                                                      OpStore %123 %120 
                                Uniform f32* %124 = OpAccessChain %23 %115 %26 %116 
                                         f32 %125 = OpLoad %124 
                                         f32 %126 = OpFNegate %125 
                                Private f32* %127 = OpAccessChain %47 %86 
                                                      OpStore %127 %126 
                                Uniform f32* %128 = OpAccessChain %23 %115 %39 %116 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFNegate %129 
                                Private f32* %131 = OpAccessChain %47 %116 
                                                      OpStore %131 %130 
                                       f32_4 %133 = OpLoad %47 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_4 %135 = OpLoad %47 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                         f32 %137 = OpDot %134 %136 
                                                      OpStore %132 %137 
                                         f32 %138 = OpLoad %132 
                                         f32 %139 = OpExtInst %1 32 %138 
                                                      OpStore %132 %139 
                                         f32 %140 = OpLoad %132 
                                       f32_3 %141 = OpCompositeConstruct %140 %140 %140 
                                       f32_4 %142 = OpLoad %47 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %47 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 5 6 3 
                                                      OpStore %47 %146 
                                       f32_4 %149 = OpLoad %47 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                                      OpStore %148 %150 
                                       f32_4 %152 = OpLoad %9 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                                      OpStore %151 %153 
                                                      OpStore %154 %156 
                                                      OpStore %157 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 0 0 0 0 
                                       f32_4 %161 = OpFNegate %160 
                              Uniform f32_4* %162 = OpAccessChain %23 %31 
                                       f32_4 %163 = OpLoad %162 
                                       f32_4 %164 = OpFAdd %161 %163 
                                                      OpStore %65 %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %166 1 1 1 1 
                                       f32_4 %168 = OpFNegate %167 
                              Uniform f32_4* %169 = OpAccessChain %23 %26 
                                       f32_4 %170 = OpLoad %169 
                                       f32_4 %171 = OpFAdd %168 %170 
                                                      OpStore %165 %171 
                                       f32_4 %172 = OpLoad %9 
                                       f32_4 %173 = OpVectorShuffle %172 %172 2 2 2 2 
                                       f32_4 %174 = OpFNegate %173 
                              Uniform f32_4* %175 = OpAccessChain %23 %39 
                                       f32_4 %176 = OpLoad %175 
                                       f32_4 %177 = OpFAdd %174 %176 
                                                      OpStore %9 %177 
                                       f32_4 %179 = OpLoad %47 
                                       f32_4 %180 = OpVectorShuffle %179 %179 1 1 1 1 
                                       f32_4 %181 = OpLoad %165 
                                       f32_4 %182 = OpFMul %180 %181 
                                                      OpStore %178 %182 
                                       f32_4 %183 = OpLoad %165 
                                       f32_4 %184 = OpLoad %165 
                                       f32_4 %185 = OpFMul %183 %184 
                                                      OpStore %165 %185 
                                       f32_4 %186 = OpLoad %65 
                                       f32_4 %187 = OpLoad %65 
                                       f32_4 %188 = OpFMul %186 %187 
                                       f32_4 %189 = OpLoad %165 
                                       f32_4 %190 = OpFAdd %188 %189 
                                                      OpStore %165 %190 
                                       f32_4 %191 = OpLoad %65 
                                       f32_4 %192 = OpLoad %47 
                                       f32_4 %193 = OpVectorShuffle %192 %192 0 0 0 0 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %178 
                                       f32_4 %196 = OpFAdd %194 %195 
                                                      OpStore %65 %196 
                                       f32_4 %197 = OpLoad %9 
                                       f32_4 %198 = OpLoad %47 
                                       f32_4 %199 = OpVectorShuffle %198 %198 2 2 2 2 
                                       f32_4 %200 = OpFMul %197 %199 
                                       f32_4 %201 = OpLoad %65 
                                       f32_4 %202 = OpFAdd %200 %201 
                                                      OpStore %65 %202 
                                       f32_4 %203 = OpLoad %9 
                                       f32_4 %204 = OpLoad %9 
                                       f32_4 %205 = OpFMul %203 %204 
                                       f32_4 %206 = OpLoad %165 
                                       f32_4 %207 = OpFAdd %205 %206 
                                                      OpStore %9 %207 
                                       f32_4 %208 = OpLoad %9 
                                       f32_4 %211 = OpExtInst %1 40 %208 %210 
                                                      OpStore %9 %211 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %213 = OpExtInst %1 32 %212 
                                                      OpStore %165 %213 
                                       f32_4 %214 = OpLoad %9 
                              Uniform f32_4* %215 = OpAccessChain %23 %49 
                                       f32_4 %216 = OpLoad %215 
                                       f32_4 %217 = OpFMul %214 %216 
                                       f32_4 %220 = OpFAdd %217 %219 
                                                      OpStore %9 %220 
                                       f32_4 %221 = OpLoad %9 
                                       f32_4 %222 = OpFDiv %219 %221 
                                                      OpStore %9 %222 
                                       f32_4 %223 = OpLoad %65 
                                       f32_4 %224 = OpLoad %165 
                                       f32_4 %225 = OpFMul %223 %224 
                                                      OpStore %65 %225 
                                       f32_4 %226 = OpLoad %65 
                                       f32_4 %227 = OpExtInst %1 40 %226 %156 
                                                      OpStore %65 %227 
                                       f32_4 %228 = OpLoad %9 
                                       f32_4 %229 = OpLoad %65 
                                       f32_4 %230 = OpFMul %228 %229 
                                                      OpStore %9 %230 
                                       f32_4 %231 = OpLoad %9 
                                       f32_3 %232 = OpVectorShuffle %231 %231 1 1 1 
                              Uniform f32_4* %234 = OpAccessChain %23 %233 %26 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_3 %237 = OpFMul %232 %236 
                                       f32_4 %238 = OpLoad %65 
                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 6 3 
                                                      OpStore %65 %239 
                              Uniform f32_4* %240 = OpAccessChain %23 %233 %31 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_4 %243 = OpLoad %9 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 0 0 
                                       f32_3 %245 = OpFMul %242 %244 
                                       f32_4 %246 = OpLoad %65 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 1 2 
                                       f32_3 %248 = OpFAdd %245 %247 
                                       f32_4 %249 = OpLoad %65 
                                       f32_4 %250 = OpVectorShuffle %249 %248 4 5 6 3 
                                                      OpStore %65 %250 
                              Uniform f32_4* %251 = OpAccessChain %23 %233 %39 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_4 %254 = OpLoad %9 
                                       f32_3 %255 = OpVectorShuffle %254 %254 2 2 2 
                                       f32_3 %256 = OpFMul %253 %255 
                                       f32_4 %257 = OpLoad %65 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                                       f32_3 %259 = OpFAdd %256 %258 
                                       f32_4 %260 = OpLoad %9 
                                       f32_4 %261 = OpVectorShuffle %260 %259 4 5 6 3 
                                                      OpStore %9 %261 
                              Uniform f32_4* %262 = OpAccessChain %23 %233 %49 
                                       f32_4 %263 = OpLoad %262 
                                       f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
                                       f32_4 %265 = OpLoad %9 
                                       f32_3 %266 = OpVectorShuffle %265 %265 3 3 3 
                                       f32_3 %267 = OpFMul %264 %266 
                                       f32_4 %268 = OpLoad %9 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                       f32_3 %270 = OpFAdd %267 %269 
                                       f32_4 %271 = OpLoad %9 
                                       f32_4 %272 = OpVectorShuffle %271 %270 4 5 6 3 
                                                      OpStore %9 %272 
                                Private f32* %275 = OpAccessChain %47 %86 
                                         f32 %276 = OpLoad %275 
                                Private f32* %277 = OpAccessChain %47 %86 
                                         f32 %278 = OpLoad %277 
                                         f32 %279 = OpFMul %276 %278 
                                Private f32* %280 = OpAccessChain %274 %121 
                                                      OpStore %280 %279 
                                Private f32* %281 = OpAccessChain %47 %121 
                                         f32 %282 = OpLoad %281 
                                Private f32* %283 = OpAccessChain %47 %121 
                                         f32 %284 = OpLoad %283 
                                         f32 %285 = OpFMul %282 %284 
                                Private f32* %286 = OpAccessChain %274 %121 
                                         f32 %287 = OpLoad %286 
                                         f32 %288 = OpFNegate %287 
                                         f32 %289 = OpFAdd %285 %288 
                                Private f32* %290 = OpAccessChain %274 %121 
                                                      OpStore %290 %289 
                                       f32_4 %292 = OpLoad %47 
                                       f32_4 %293 = OpVectorShuffle %292 %292 1 2 2 0 
                                       f32_4 %294 = OpLoad %47 
                                       f32_4 %295 = OpVectorShuffle %294 %294 0 1 2 2 
                                       f32_4 %296 = OpFMul %293 %295 
                                                      OpStore %291 %296 
                              Uniform f32_4* %299 = OpAccessChain %23 %298 
                                       f32_4 %300 = OpLoad %299 
                                       f32_4 %301 = OpLoad %291 
                                         f32 %302 = OpDot %300 %301 
                                Private f32* %303 = OpAccessChain %297 %121 
                                                      OpStore %303 %302 
                              Uniform f32_4* %305 = OpAccessChain %23 %304 
                                       f32_4 %306 = OpLoad %305 
                                       f32_4 %307 = OpLoad %291 
                                         f32 %308 = OpDot %306 %307 
                                Private f32* %309 = OpAccessChain %297 %86 
                                                      OpStore %309 %308 
                              Uniform f32_4* %311 = OpAccessChain %23 %310 
                                       f32_4 %312 = OpLoad %311 
                                       f32_4 %313 = OpLoad %291 
                                         f32 %314 = OpDot %312 %313 
                                Private f32* %315 = OpAccessChain %297 %116 
                                                      OpStore %315 %314 
                              Uniform f32_4* %317 = OpAccessChain %23 %316 
                                       f32_4 %318 = OpLoad %317 
                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                                       f32_3 %320 = OpLoad %274 
                                       f32_3 %321 = OpVectorShuffle %320 %320 0 0 0 
                                       f32_3 %322 = OpFMul %319 %321 
                                       f32_3 %323 = OpLoad %297 
                                       f32_3 %324 = OpFAdd %322 %323 
                                                      OpStore %274 %324 
                                Private f32* %326 = OpAccessChain %47 %325 
                                                      OpStore %326 %218 
                              Uniform f32_4* %328 = OpAccessChain %23 %327 
                                       f32_4 %329 = OpLoad %328 
                                       f32_4 %330 = OpLoad %47 
                                         f32 %331 = OpDot %329 %330 
                                Private f32* %332 = OpAccessChain %297 %121 
                                                      OpStore %332 %331 
                              Uniform f32_4* %334 = OpAccessChain %23 %333 
                                       f32_4 %335 = OpLoad %334 
                                       f32_4 %336 = OpLoad %47 
                                         f32 %337 = OpDot %335 %336 
                                Private f32* %338 = OpAccessChain %297 %86 
                                                      OpStore %338 %337 
                              Uniform f32_4* %340 = OpAccessChain %23 %339 
                                       f32_4 %341 = OpLoad %340 
                                       f32_4 %342 = OpLoad %47 
                                         f32 %343 = OpDot %341 %342 
                                Private f32* %344 = OpAccessChain %297 %116 
                                                      OpStore %344 %343 
                                       f32_3 %345 = OpLoad %274 
                                       f32_3 %346 = OpLoad %297 
                                       f32_3 %347 = OpFAdd %345 %346 
                                                      OpStore %274 %347 
                                       f32_3 %348 = OpLoad %274 
                                       f32_3 %349 = OpExtInst %1 40 %348 %158 
                                                      OpStore %274 %349 
                                       f32_3 %350 = OpLoad %274 
                                       f32_3 %351 = OpExtInst %1 30 %350 
                                       f32_4 %352 = OpLoad %47 
                                       f32_4 %353 = OpVectorShuffle %352 %351 4 5 6 3 
                                                      OpStore %47 %353 
                                       f32_4 %354 = OpLoad %47 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                       f32_3 %358 = OpFMul %355 %357 
                                       f32_4 %359 = OpLoad %47 
                                       f32_4 %360 = OpVectorShuffle %359 %358 4 5 6 3 
                                                      OpStore %47 %360 
                                       f32_4 %361 = OpLoad %47 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
                                       f32_3 %363 = OpExtInst %1 29 %362 
                                       f32_4 %364 = OpLoad %47 
                                       f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
                                                      OpStore %47 %365 
                                       f32_4 %366 = OpLoad %47 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_3 %370 = OpFMul %367 %369 
                                       f32_3 %373 = OpFAdd %370 %372 
                                       f32_4 %374 = OpLoad %47 
                                       f32_4 %375 = OpVectorShuffle %374 %373 4 5 6 3 
                                                      OpStore %47 %375 
                                       f32_4 %376 = OpLoad %47 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                                       f32_3 %378 = OpExtInst %1 40 %377 %158 
                                       f32_4 %379 = OpLoad %47 
                                       f32_4 %380 = OpVectorShuffle %379 %378 4 5 6 3 
                                                      OpStore %47 %380 
                                       f32_4 %382 = OpLoad %9 
                                       f32_3 %383 = OpVectorShuffle %382 %382 0 1 2 
                                       f32_4 %384 = OpLoad %47 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
                                       f32_3 %386 = OpFAdd %383 %385 
                                                      OpStore %381 %386 
                                 Output f32* %388 = OpAccessChain %90 %31 %86 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                 Output f32* %391 = OpAccessChain %90 %31 %86 
                                                      OpStore %391 %390 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 234
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %46 %89 %201 %216 %220 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpMemberDecorate %25 0 RelaxedPrecision 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpMemberDecorate %25 1 RelaxedPrecision 
                                                      OpMemberDecorate %25 1 Offset 25 
                                                      OpMemberDecorate %25 2 Offset 25 
                                                      OpMemberDecorate %25 3 Offset 25 
                                                      OpMemberDecorate %25 4 Offset 25 
                                                      OpMemberDecorate %25 5 Offset 25 
                                                      OpMemberDecorate %25 6 RelaxedPrecision 
                                                      OpMemberDecorate %25 6 Offset 25 
                                                      OpMemberDecorate %25 7 Offset 25 
                                                      OpMemberDecorate %25 8 Offset 25 
                                                      OpDecorate %25 Block 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %170 DescriptorSet 170 
                                                      OpDecorate %170 Binding 170 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 Location 201 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %216 Location 216 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %220 Location 220 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeVector %6 3 
                                              %25 = OpTypeStruct %7 %7 %7 %23 %24 %24 %7 %6 %6 
                                              %26 = OpTypePointer Uniform %25 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 8 
                                              %30 = OpTypePointer Uniform %6 
                                          i32 %33 = OpConstant 7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %24 
                                 Input f32_3* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %58 = OpConstant 3.67402E-40 
                                          i32 %61 = OpConstant 0 
                                          i32 %62 = OpConstant 1 
                                          i32 %64 = OpConstant -1 
                                          i32 %70 = OpConstant 2 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                              %87 = OpTypePointer Private %24 
                               Private f32_3* %88 = OpVariable Private 
                                 Input f32_3* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 3 
                                              %93 = OpTypePointer Uniform %7 
                                             %119 = OpTypePointer Function %24 
                                         i32 %132 = OpConstant 5 
                                             %133 = OpTypePointer Uniform %24 
                                         i32 %142 = OpConstant 4 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                Private f32* %155 = OpVariable Private 
                                         u32 %156 = OpConstant 2 
                                         f32 %159 = OpConstant 3.67402E-40 
                                             %167 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %168 = OpTypeSampledImage %167 
                                             %169 = OpTypePointer UniformConstant %168 
 UniformConstant read_only Texture3DSampled* %170 = OpVariable UniformConstant 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %181 = OpConstant 3 
                              Private f32_3* %183 = OpVariable Private 
                                         i32 %195 = OpConstant 6 
                                Private f32* %200 = OpVariable Private 
                                Input f32_3* %201 = OpVariable Input 
                              Private f32_3* %213 = OpVariable Private 
                                Input f32_3* %216 = OpVariable Input 
                                             %219 = OpTypePointer Output %7 
                               Output f32_4* %220 = OpVariable Output 
                                             %231 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %120 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %31 = OpAccessChain %27 %29 
                                          f32 %32 = OpLoad %31 
                                 Uniform f32* %34 = OpAccessChain %27 %33 
                                          f32 %35 = OpLoad %34 
                                          f32 %36 = OpFMul %32 %35 
                                 Private f32* %39 = OpAccessChain %20 %37 
                                                      OpStore %39 %36 
                                 Private f32* %40 = OpAccessChain %20 %37 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFMul %42 %43 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %44 %50 
                                 Private f32* %52 = OpAccessChain %20 %37 
                                                      OpStore %52 %51 
                                 Private f32* %56 = OpAccessChain %20 %37 
                                          f32 %57 = OpLoad %56 
                                         bool %59 = OpFOrdLessThan %57 %58 
                                                      OpStore %55 %59 
                                         bool %60 = OpLoad %55 
                                          i32 %63 = OpSelect %60 %62 %61 
                                          i32 %65 = OpIMul %63 %64 
                                         bool %66 = OpINotEqual %65 %61 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %68 
                                              %67 = OpLabel 
                                                      OpKill
                                              %68 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %27 %70 %37 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %55 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %55 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %177 
                                              %82 = OpLabel 
                                 Uniform f32* %84 = OpAccessChain %27 %70 %47 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdEqual %85 %73 
                                                      OpStore %55 %86 
                                        f32_3 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 1 1 1 
                               Uniform f32_4* %94 = OpAccessChain %27 %92 %62 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFMul %91 %96 
                                                      OpStore %88 %97 
                               Uniform f32_4* %98 = OpAccessChain %27 %92 %61 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpLoad %89 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_3 %104 = OpLoad %88 
                                       f32_3 %105 = OpFAdd %103 %104 
                                                      OpStore %88 %105 
                              Uniform f32_4* %106 = OpAccessChain %27 %92 %70 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpLoad %89 
                                       f32_3 %110 = OpVectorShuffle %109 %109 2 2 2 
                                       f32_3 %111 = OpFMul %108 %110 
                                       f32_3 %112 = OpLoad %88 
                                       f32_3 %113 = OpFAdd %111 %112 
                                                      OpStore %88 %113 
                                       f32_3 %114 = OpLoad %88 
                              Uniform f32_4* %115 = OpAccessChain %27 %92 %92 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                                      OpStore %88 %118 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %125 
                                             %122 = OpLabel 
                                       f32_3 %124 = OpLoad %88 
                                                      OpStore %120 %124 
                                                      OpBranch %123 
                                             %125 = OpLabel 
                                       f32_3 %126 = OpLoad %89 
                                                      OpStore %120 %126 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_3 %127 = OpLoad %120 
                                       f32_4 %128 = OpLoad %20 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %20 %129 
                                       f32_4 %130 = OpLoad %20 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %27 %132 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFNegate %135 
                                       f32_3 %137 = OpFAdd %131 %136 
                                       f32_4 %138 = OpLoad %20 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %20 %139 
                                       f32_4 %140 = OpLoad %20 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %27 %142 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %141 %144 
                                       f32_4 %146 = OpLoad %20 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %20 %147 
                                Private f32* %148 = OpAccessChain %20 %47 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %88 %37 
                                                      OpStore %154 %153 
                                Uniform f32* %157 = OpAccessChain %27 %70 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                         f32 %161 = OpFAdd %160 %152 
                                                      OpStore %155 %161 
                                Private f32* %162 = OpAccessChain %88 %37 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpLoad %155 
                                         f32 %165 = OpExtInst %1 40 %163 %164 
                                Private f32* %166 = OpAccessChain %20 %37 
                                                      OpStore %166 %165 
                  read_only Texture3DSampled %171 = OpLoad %170 
                                       f32_4 %172 = OpLoad %20 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 2 3 
                                       f32_4 %174 = OpImageSampleImplicitLod %171 %173 
                                                      OpStore %20 %174 
                                       f32_4 %176 = OpLoad %20 
                                                      OpStore %175 %176 
                                                      OpBranch %83 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %175 %37 
                                                      OpStore %178 %73 
                                Private f32* %179 = OpAccessChain %175 %47 
                                                      OpStore %179 %73 
                                Private f32* %180 = OpAccessChain %175 %156 
                                                      OpStore %180 %73 
                                Private f32* %182 = OpAccessChain %175 %181 
                                                      OpStore %182 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %184 = OpLoad %175 
                              Uniform f32_4* %185 = OpAccessChain %27 %62 
                                       f32_4 %186 = OpLoad %185 
                                         f32 %187 = OpDot %184 %186 
                                Private f32* %188 = OpAccessChain %183 %37 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %183 %37 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpExtInst %1 43 %190 %58 %73 
                                Private f32* %192 = OpAccessChain %183 %37 
                                                      OpStore %192 %191 
                                       f32_3 %193 = OpLoad %183 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                              Uniform f32_4* %196 = OpAccessChain %27 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFMul %194 %198 
                                                      OpStore %183 %199 
                                       f32_3 %202 = OpLoad %201 
                              Uniform f32_4* %203 = OpAccessChain %27 %61 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                         f32 %206 = OpDot %202 %205 
                                                      OpStore %200 %206 
                                         f32 %207 = OpLoad %200 
                                         f32 %208 = OpExtInst %1 40 %207 %58 
                                                      OpStore %200 %208 
                                       f32_4 %209 = OpLoad %9 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpLoad %183 
                                       f32_3 %212 = OpFMul %210 %211 
                                                      OpStore %183 %212 
                                       f32_4 %214 = OpLoad %9 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %217 = OpLoad %216 
                                       f32_3 %218 = OpFMul %215 %217 
                                                      OpStore %213 %218 
                                       f32_3 %221 = OpLoad %183 
                                         f32 %222 = OpLoad %200 
                                       f32_3 %223 = OpCompositeConstruct %222 %222 %222 
                                       f32_3 %224 = OpFMul %221 %223 
                                       f32_3 %225 = OpLoad %213 
                                       f32_3 %226 = OpFAdd %224 %225 
                                       f32_4 %227 = OpLoad %220 
                                       f32_4 %228 = OpVectorShuffle %227 %226 4 5 6 3 
                                                      OpStore %220 %228 
                                Private f32* %229 = OpAccessChain %9 %181 
                                         f32 %230 = OpLoad %229 
                                 Output f32* %232 = OpAccessChain %220 %181 
                                                      OpStore %232 %230 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0.xy = in_POSITION0.xy / in_POSITION0.ww;
    u_xlat4.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat4.xy * u_xlat0.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xy;
    u_xlat0.xy = u_xlat0.xy * in_POSITION0.ww;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = _PixelHeight * _Threshold;
    u_xlat1.x = (-u_xlat1.x) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 190
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %125 %136 %137 %173 %179 %182 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpDecorate %26 ArrayStride 26 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %92 Location 92 
                                                      OpMemberDecorate %123 0 BuiltIn 123 
                                                      OpMemberDecorate %123 1 BuiltIn 123 
                                                      OpMemberDecorate %123 2 BuiltIn 123 
                                                      OpDecorate %123 Block 
                                                      OpDecorate %136 Location 136 
                                                      OpDecorate %137 Location 137 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %182 Location 182 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %20 = OpTypePointer Private %12 
                               Private f32_2* %21 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeArray %7 %23 
                                              %26 = OpTypeArray %7 %23 
                                              %27 = OpTypeStruct %7 %24 %25 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Uniform %7 
                                          f32 %36 = OpConstant 3.67402E-40 
                                        f32_2 %37 = OpConstantComposite %36 %36 
                               Private f32_4* %63 = OpVariable Private 
                                          i32 %66 = OpConstant 1 
                                          i32 %77 = OpConstant 2 
                                          i32 %86 = OpConstant 3 
                                              %90 = OpTypeVector %6 3 
                                              %91 = OpTypePointer Output %90 
                                Output f32_3* %92 = OpVariable Output 
                                         u32 %121 = OpConstant 1 
                                             %122 = OpTypeArray %6 %121 
                                             %123 = OpTypeStruct %7 %6 %122 
                                             %124 = OpTypePointer Output %123 
        Output struct {f32_4; f32; f32[1];}* %125 = OpVariable Output 
                                             %133 = OpTypePointer Output %7 
                                             %135 = OpTypePointer Output %12 
                               Output f32_2* %136 = OpVariable Output 
                                Input f32_4* %137 = OpVariable Input 
                                         i32 %140 = OpConstant 4 
                                         u32 %149 = OpConstant 2 
                                             %150 = OpTypePointer Uniform %6 
                                         u32 %154 = OpConstant 0 
                                             %155 = OpTypePointer Private %6 
                                Private f32* %165 = OpVariable Private 
                               Output f32_3* %173 = OpVariable Output 
                               Output f32_4* %179 = OpVariable Output 
                                         f32 %180 = OpConstant 3.67402E-40 
                                       f32_4 %181 = OpConstantComposite %180 %180 %180 %180 
                               Output f32_3* %182 = OpVariable Output 
                                       f32_3 %183 = OpConstantComposite %180 %180 %180 
                                             %184 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_4 %15 = OpLoad %11 
                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                        f32_2 %17 = OpFDiv %14 %16 
                                        f32_4 %18 = OpLoad %9 
                                        f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                      OpStore %9 %19 
                               Uniform f32_4* %33 = OpAccessChain %29 %31 
                                        f32_4 %34 = OpLoad %33 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                                        f32_2 %38 = OpFMul %35 %37 
                                                      OpStore %21 %38 
                                        f32_2 %39 = OpLoad %21 
                                        f32_4 %40 = OpLoad %9 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpExtInst %1 2 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_4 %49 = OpVectorShuffle %48 %47 4 5 2 3 
                                                      OpStore %9 %49 
                                        f32_4 %50 = OpLoad %9 
                                        f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                        f32_2 %52 = OpLoad %21 
                                        f32_2 %53 = OpFDiv %51 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %9 %55 
                                        f32_4 %56 = OpLoad %9 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_4 %58 = OpLoad %11 
                                        f32_2 %59 = OpVectorShuffle %58 %58 3 3 
                                        f32_2 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_4 %62 = OpVectorShuffle %61 %60 4 5 2 3 
                                                      OpStore %9 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                               Uniform f32_4* %67 = OpAccessChain %29 %66 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpFMul %65 %68 
                                                      OpStore %63 %69 
                               Uniform f32_4* %70 = OpAccessChain %29 %66 %31 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 0 0 0 0 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %63 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %9 %76 
                               Uniform f32_4* %78 = OpAccessChain %29 %66 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %11 
                                        f32_4 %81 = OpVectorShuffle %80 %80 2 2 2 2 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %9 %84 
                                        f32_4 %85 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %29 %66 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %85 %88 
                                                      OpStore %63 %89 
                               Uniform f32_4* %93 = OpAccessChain %29 %66 %86 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_4 %96 = OpLoad %11 
                                        f32_3 %97 = OpVectorShuffle %96 %96 3 3 3 
                                        f32_3 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %9 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFAdd %98 %100 
                                                      OpStore %92 %101 
                                       f32_4 %102 = OpLoad %63 
                                       f32_4 %103 = OpVectorShuffle %102 %102 1 1 1 1 
                              Uniform f32_4* %104 = OpAccessChain %29 %86 %66 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpFMul %103 %105 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %29 %86 %31 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpLoad %63 
                                       f32_4 %110 = OpVectorShuffle %109 %109 0 0 0 0 
                                       f32_4 %111 = OpFMul %108 %110 
                                       f32_4 %112 = OpLoad %9 
                                       f32_4 %113 = OpFAdd %111 %112 
                                                      OpStore %9 %113 
                              Uniform f32_4* %114 = OpAccessChain %29 %86 %77 
                                       f32_4 %115 = OpLoad %114 
                                       f32_4 %116 = OpLoad %63 
                                       f32_4 %117 = OpVectorShuffle %116 %116 2 2 2 2 
                                       f32_4 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpFAdd %118 %119 
                                                      OpStore %9 %120 
                              Uniform f32_4* %126 = OpAccessChain %29 %86 %86 
                                       f32_4 %127 = OpLoad %126 
                                       f32_4 %128 = OpLoad %63 
                                       f32_4 %129 = OpVectorShuffle %128 %128 3 3 3 3 
                                       f32_4 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpFAdd %130 %131 
                               Output f32_4* %134 = OpAccessChain %125 %31 
                                                      OpStore %134 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
                              Uniform f32_4* %141 = OpAccessChain %29 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                                       f32_2 %144 = OpFMul %139 %143 
                              Uniform f32_4* %145 = OpAccessChain %29 %140 
                                       f32_4 %146 = OpLoad %145 
                                       f32_2 %147 = OpVectorShuffle %146 %146 2 3 
                                       f32_2 %148 = OpFAdd %144 %147 
                                                      OpStore %136 %148 
                                Uniform f32* %151 = OpAccessChain %29 %77 %31 %149 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFNegate %152 
                                Private f32* %156 = OpAccessChain %9 %154 
                                                      OpStore %156 %153 
                                Uniform f32* %157 = OpAccessChain %29 %77 %66 %149 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFNegate %158 
                                Private f32* %160 = OpAccessChain %9 %121 
                                                      OpStore %160 %159 
                                Uniform f32* %161 = OpAccessChain %29 %77 %77 %149 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                Private f32* %164 = OpAccessChain %9 %149 
                                                      OpStore %164 %163 
                                       f32_4 %166 = OpLoad %9 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                         f32 %170 = OpDot %167 %169 
                                                      OpStore %165 %170 
                                         f32 %171 = OpLoad %165 
                                         f32 %172 = OpExtInst %1 32 %171 
                                                      OpStore %165 %172 
                                         f32 %174 = OpLoad %165 
                                       f32_3 %175 = OpCompositeConstruct %174 %174 %174 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %178 = OpFMul %175 %177 
                                                      OpStore %173 %178 
                                                      OpStore %179 %181 
                                                      OpStore %182 %183 
                                 Output f32* %185 = OpAccessChain %125 %31 %121 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFNegate %186 
                                 Output f32* %188 = OpAccessChain %125 %31 %121 
                                                      OpStore %188 %187 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 226
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %46 %89 %201 %214 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpMemberDecorate %25 0 RelaxedPrecision 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpMemberDecorate %25 1 RelaxedPrecision 
                                                      OpMemberDecorate %25 1 Offset 25 
                                                      OpMemberDecorate %25 2 Offset 25 
                                                      OpMemberDecorate %25 3 Offset 25 
                                                      OpMemberDecorate %25 4 Offset 25 
                                                      OpMemberDecorate %25 5 Offset 25 
                                                      OpMemberDecorate %25 6 RelaxedPrecision 
                                                      OpMemberDecorate %25 6 Offset 25 
                                                      OpMemberDecorate %25 7 Offset 25 
                                                      OpMemberDecorate %25 8 Offset 25 
                                                      OpDecorate %25 Block 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %170 DescriptorSet 170 
                                                      OpDecorate %170 Binding 170 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 Location 201 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %214 Location 214 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeVector %6 3 
                                              %25 = OpTypeStruct %7 %7 %7 %23 %24 %24 %7 %6 %6 
                                              %26 = OpTypePointer Uniform %25 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 8 
                                              %30 = OpTypePointer Uniform %6 
                                          i32 %33 = OpConstant 7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %24 
                                 Input f32_3* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %58 = OpConstant 3.67402E-40 
                                          i32 %61 = OpConstant 0 
                                          i32 %62 = OpConstant 1 
                                          i32 %64 = OpConstant -1 
                                          i32 %70 = OpConstant 2 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                              %87 = OpTypePointer Private %24 
                               Private f32_3* %88 = OpVariable Private 
                                 Input f32_3* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 3 
                                              %93 = OpTypePointer Uniform %7 
                                             %119 = OpTypePointer Function %24 
                                         i32 %132 = OpConstant 5 
                                             %133 = OpTypePointer Uniform %24 
                                         i32 %142 = OpConstant 4 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                Private f32* %155 = OpVariable Private 
                                         u32 %156 = OpConstant 2 
                                         f32 %159 = OpConstant 3.67402E-40 
                                             %167 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %168 = OpTypeSampledImage %167 
                                             %169 = OpTypePointer UniformConstant %168 
 UniformConstant read_only Texture3DSampled* %170 = OpVariable UniformConstant 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %181 = OpConstant 3 
                              Private f32_3* %183 = OpVariable Private 
                                         i32 %195 = OpConstant 6 
                                Private f32* %200 = OpVariable Private 
                                Input f32_3* %201 = OpVariable Input 
                                             %213 = OpTypePointer Output %7 
                               Output f32_4* %214 = OpVariable Output 
                                             %223 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %120 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %31 = OpAccessChain %27 %29 
                                          f32 %32 = OpLoad %31 
                                 Uniform f32* %34 = OpAccessChain %27 %33 
                                          f32 %35 = OpLoad %34 
                                          f32 %36 = OpFMul %32 %35 
                                 Private f32* %39 = OpAccessChain %20 %37 
                                                      OpStore %39 %36 
                                 Private f32* %40 = OpAccessChain %20 %37 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFMul %42 %43 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %44 %50 
                                 Private f32* %52 = OpAccessChain %20 %37 
                                                      OpStore %52 %51 
                                 Private f32* %56 = OpAccessChain %20 %37 
                                          f32 %57 = OpLoad %56 
                                         bool %59 = OpFOrdLessThan %57 %58 
                                                      OpStore %55 %59 
                                         bool %60 = OpLoad %55 
                                          i32 %63 = OpSelect %60 %62 %61 
                                          i32 %65 = OpIMul %63 %64 
                                         bool %66 = OpINotEqual %65 %61 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %68 
                                              %67 = OpLabel 
                                                      OpKill
                                              %68 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %27 %70 %37 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %55 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %55 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %177 
                                              %82 = OpLabel 
                                 Uniform f32* %84 = OpAccessChain %27 %70 %47 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdEqual %85 %73 
                                                      OpStore %55 %86 
                                        f32_3 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 1 1 1 
                               Uniform f32_4* %94 = OpAccessChain %27 %92 %62 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFMul %91 %96 
                                                      OpStore %88 %97 
                               Uniform f32_4* %98 = OpAccessChain %27 %92 %61 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpLoad %89 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_3 %104 = OpLoad %88 
                                       f32_3 %105 = OpFAdd %103 %104 
                                                      OpStore %88 %105 
                              Uniform f32_4* %106 = OpAccessChain %27 %92 %70 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpLoad %89 
                                       f32_3 %110 = OpVectorShuffle %109 %109 2 2 2 
                                       f32_3 %111 = OpFMul %108 %110 
                                       f32_3 %112 = OpLoad %88 
                                       f32_3 %113 = OpFAdd %111 %112 
                                                      OpStore %88 %113 
                                       f32_3 %114 = OpLoad %88 
                              Uniform f32_4* %115 = OpAccessChain %27 %92 %92 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                                      OpStore %88 %118 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %125 
                                             %122 = OpLabel 
                                       f32_3 %124 = OpLoad %88 
                                                      OpStore %120 %124 
                                                      OpBranch %123 
                                             %125 = OpLabel 
                                       f32_3 %126 = OpLoad %89 
                                                      OpStore %120 %126 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_3 %127 = OpLoad %120 
                                       f32_4 %128 = OpLoad %20 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %20 %129 
                                       f32_4 %130 = OpLoad %20 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %27 %132 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFNegate %135 
                                       f32_3 %137 = OpFAdd %131 %136 
                                       f32_4 %138 = OpLoad %20 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %20 %139 
                                       f32_4 %140 = OpLoad %20 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %27 %142 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %141 %144 
                                       f32_4 %146 = OpLoad %20 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %20 %147 
                                Private f32* %148 = OpAccessChain %20 %47 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %88 %37 
                                                      OpStore %154 %153 
                                Uniform f32* %157 = OpAccessChain %27 %70 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                         f32 %161 = OpFAdd %160 %152 
                                                      OpStore %155 %161 
                                Private f32* %162 = OpAccessChain %88 %37 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpLoad %155 
                                         f32 %165 = OpExtInst %1 40 %163 %164 
                                Private f32* %166 = OpAccessChain %20 %37 
                                                      OpStore %166 %165 
                  read_only Texture3DSampled %171 = OpLoad %170 
                                       f32_4 %172 = OpLoad %20 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 2 3 
                                       f32_4 %174 = OpImageSampleImplicitLod %171 %173 
                                                      OpStore %20 %174 
                                       f32_4 %176 = OpLoad %20 
                                                      OpStore %175 %176 
                                                      OpBranch %83 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %175 %37 
                                                      OpStore %178 %73 
                                Private f32* %179 = OpAccessChain %175 %47 
                                                      OpStore %179 %73 
                                Private f32* %180 = OpAccessChain %175 %156 
                                                      OpStore %180 %73 
                                Private f32* %182 = OpAccessChain %175 %181 
                                                      OpStore %182 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %184 = OpLoad %175 
                              Uniform f32_4* %185 = OpAccessChain %27 %62 
                                       f32_4 %186 = OpLoad %185 
                                         f32 %187 = OpDot %184 %186 
                                Private f32* %188 = OpAccessChain %183 %37 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %183 %37 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpExtInst %1 43 %190 %58 %73 
                                Private f32* %192 = OpAccessChain %183 %37 
                                                      OpStore %192 %191 
                                       f32_3 %193 = OpLoad %183 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                              Uniform f32_4* %196 = OpAccessChain %27 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFMul %194 %198 
                                                      OpStore %183 %199 
                                       f32_3 %202 = OpLoad %201 
                              Uniform f32_4* %203 = OpAccessChain %27 %61 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                         f32 %206 = OpDot %202 %205 
                                                      OpStore %200 %206 
                                         f32 %207 = OpLoad %200 
                                         f32 %208 = OpExtInst %1 40 %207 %58 
                                                      OpStore %200 %208 
                                       f32_4 %209 = OpLoad %9 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpLoad %183 
                                       f32_3 %212 = OpFMul %210 %211 
                                                      OpStore %183 %212 
                                         f32 %215 = OpLoad %200 
                                       f32_3 %216 = OpCompositeConstruct %215 %215 %215 
                                       f32_3 %217 = OpLoad %183 
                                       f32_3 %218 = OpFMul %216 %217 
                                       f32_4 %219 = OpLoad %214 
                                       f32_4 %220 = OpVectorShuffle %219 %218 4 5 6 3 
                                                      OpStore %214 %220 
                                Private f32* %221 = OpAccessChain %9 %181 
                                         f32 %222 = OpLoad %221 
                                 Output f32* %224 = OpAccessChain %214 %181 
                                                      OpStore %224 %222 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ScreenParams;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xy = in_POSITION0.xy / in_POSITION0.ww;
    u_xlat8.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xy * in_POSITION0.ww;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat1.x = u_xlat0.y * u_xlat0.y;
    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat0.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat0);
    u_xlat2.y = dot(unity_SHAg, u_xlat0);
    u_xlat2.z = dot(unity_SHAb, u_xlat0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = _PixelHeight * _Threshold;
    u_xlat1.x = (-u_xlat1.x) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD5.xyz;
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 306
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %93 %127 %138 %139 %183 %186 %189 %297 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpDecorate %26 ArrayStride 26 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 RelaxedPrecision 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 RelaxedPrecision 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 RelaxedPrecision 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 RelaxedPrecision 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 RelaxedPrecision 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpMemberDecorate %27 6 RelaxedPrecision 
                                                      OpMemberDecorate %27 6 Offset 27 
                                                      OpMemberDecorate %27 7 RelaxedPrecision 
                                                      OpMemberDecorate %27 7 Offset 27 
                                                      OpMemberDecorate %27 8 Offset 27 
                                                      OpMemberDecorate %27 9 Offset 27 
                                                      OpMemberDecorate %27 10 Offset 27 
                                                      OpMemberDecorate %27 11 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %93 Location 93 
                                                      OpMemberDecorate %125 0 BuiltIn 125 
                                                      OpMemberDecorate %125 1 BuiltIn 125 
                                                      OpMemberDecorate %125 2 BuiltIn 125 
                                                      OpDecorate %125 Block 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %189 Location 189 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %297 Location 297 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %20 = OpTypePointer Private %12 
                               Private f32_2* %21 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeArray %7 %23 
                                              %26 = OpTypeArray %7 %23 
                                              %27 = OpTypeStruct %7 %7 %7 %7 %7 %7 %7 %7 %24 %25 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Uniform %7 
                                          f32 %36 = OpConstant 3.67402E-40 
                                        f32_2 %37 = OpConstantComposite %36 %36 
                               Private f32_4* %63 = OpVariable Private 
                                          i32 %66 = OpConstant 8 
                                          i32 %67 = OpConstant 1 
                                          i32 %78 = OpConstant 2 
                                          i32 %87 = OpConstant 3 
                                              %91 = OpTypeVector %6 3 
                                              %92 = OpTypePointer Output %91 
                                Output f32_3* %93 = OpVariable Output 
                                         i32 %105 = OpConstant 10 
                                         u32 %123 = OpConstant 1 
                                             %124 = OpTypeArray %6 %123 
                                             %125 = OpTypeStruct %7 %6 %124 
                                             %126 = OpTypePointer Output %125 
        Output struct {f32_4; f32; f32[1];}* %127 = OpVariable Output 
                                             %135 = OpTypePointer Output %7 
                                             %137 = OpTypePointer Output %12 
                               Output f32_2* %138 = OpVariable Output 
                                Input f32_4* %139 = OpVariable Input 
                                         i32 %142 = OpConstant 11 
                                         i32 %151 = OpConstant 9 
                                         u32 %152 = OpConstant 2 
                                             %153 = OpTypePointer Uniform %6 
                                         u32 %157 = OpConstant 0 
                                             %158 = OpTypePointer Private %6 
                                Private f32* %168 = OpVariable Private 
                               Output f32_3* %183 = OpVariable Output 
                               Output f32_4* %186 = OpVariable Output 
                                         f32 %187 = OpConstant 3.67402E-40 
                                       f32_4 %188 = OpConstantComposite %187 %187 %187 %187 
                               Output f32_3* %189 = OpVariable Output 
                                       f32_3 %190 = OpConstantComposite %187 %187 %187 
                                             %191 = OpTypePointer Private %91 
                              Private f32_3* %192 = OpVariable Private 
                              Private f32_4* %209 = OpVariable Private 
                              Private f32_3* %215 = OpVariable Private 
                                         i32 %216 = OpConstant 4 
                                         i32 %222 = OpConstant 5 
                                         i32 %228 = OpConstant 6 
                                         i32 %234 = OpConstant 7 
                                         f32 %243 = OpConstant 3.67402E-40 
                                         u32 %244 = OpConstant 3 
                                         f32 %272 = OpConstant 3.67402E-40 
                                       f32_3 %273 = OpConstantComposite %272 %272 %272 
                                         f32 %284 = OpConstant 3.67402E-40 
                                       f32_3 %285 = OpConstantComposite %284 %284 %284 
                                         f32 %287 = OpConstant 3.67402E-40 
                                       f32_3 %288 = OpConstantComposite %287 %287 %287 
                               Output f32_3* %297 = OpVariable Output 
                                             %300 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_4 %15 = OpLoad %11 
                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                        f32_2 %17 = OpFDiv %14 %16 
                                        f32_4 %18 = OpLoad %9 
                                        f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                      OpStore %9 %19 
                               Uniform f32_4* %33 = OpAccessChain %29 %31 
                                        f32_4 %34 = OpLoad %33 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                                        f32_2 %38 = OpFMul %35 %37 
                                                      OpStore %21 %38 
                                        f32_2 %39 = OpLoad %21 
                                        f32_4 %40 = OpLoad %9 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpExtInst %1 2 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_4 %49 = OpVectorShuffle %48 %47 4 5 2 3 
                                                      OpStore %9 %49 
                                        f32_4 %50 = OpLoad %9 
                                        f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                        f32_2 %52 = OpLoad %21 
                                        f32_2 %53 = OpFDiv %51 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %9 %55 
                                        f32_4 %56 = OpLoad %9 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_4 %58 = OpLoad %11 
                                        f32_2 %59 = OpVectorShuffle %58 %58 3 3 
                                        f32_2 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_4 %62 = OpVectorShuffle %61 %60 4 5 2 3 
                                                      OpStore %9 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                               Uniform f32_4* %68 = OpAccessChain %29 %66 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpFMul %65 %69 
                                                      OpStore %63 %70 
                               Uniform f32_4* %71 = OpAccessChain %29 %66 %31 
                                        f32_4 %72 = OpLoad %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_4 %74 = OpVectorShuffle %73 %73 0 0 0 0 
                                        f32_4 %75 = OpFMul %72 %74 
                                        f32_4 %76 = OpLoad %63 
                                        f32_4 %77 = OpFAdd %75 %76 
                                                      OpStore %9 %77 
                               Uniform f32_4* %79 = OpAccessChain %29 %66 %78 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %11 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %9 %85 
                                        f32_4 %86 = OpLoad %9 
                               Uniform f32_4* %88 = OpAccessChain %29 %66 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFAdd %86 %89 
                                                      OpStore %63 %90 
                               Uniform f32_4* %94 = OpAccessChain %29 %66 %87 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_4 %97 = OpLoad %11 
                                        f32_3 %98 = OpVectorShuffle %97 %97 3 3 3 
                                        f32_3 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpFAdd %99 %101 
                                                      OpStore %93 %102 
                                       f32_4 %103 = OpLoad %63 
                                       f32_4 %104 = OpVectorShuffle %103 %103 1 1 1 1 
                              Uniform f32_4* %106 = OpAccessChain %29 %105 %67 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpFMul %104 %107 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %29 %105 %31 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %63 
                                       f32_4 %112 = OpVectorShuffle %111 %111 0 0 0 0 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %9 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %9 %115 
                              Uniform f32_4* %116 = OpAccessChain %29 %105 %78 
                                       f32_4 %117 = OpLoad %116 
                                       f32_4 %118 = OpLoad %63 
                                       f32_4 %119 = OpVectorShuffle %118 %118 2 2 2 2 
                                       f32_4 %120 = OpFMul %117 %119 
                                       f32_4 %121 = OpLoad %9 
                                       f32_4 %122 = OpFAdd %120 %121 
                                                      OpStore %9 %122 
                              Uniform f32_4* %128 = OpAccessChain %29 %105 %87 
                                       f32_4 %129 = OpLoad %128 
                                       f32_4 %130 = OpLoad %63 
                                       f32_4 %131 = OpVectorShuffle %130 %130 3 3 3 3 
                                       f32_4 %132 = OpFMul %129 %131 
                                       f32_4 %133 = OpLoad %9 
                                       f32_4 %134 = OpFAdd %132 %133 
                               Output f32_4* %136 = OpAccessChain %127 %31 
                                                      OpStore %136 %134 
                                       f32_4 %140 = OpLoad %139 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                              Uniform f32_4* %143 = OpAccessChain %29 %142 
                                       f32_4 %144 = OpLoad %143 
                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
                                       f32_2 %146 = OpFMul %141 %145 
                              Uniform f32_4* %147 = OpAccessChain %29 %142 
                                       f32_4 %148 = OpLoad %147 
                                       f32_2 %149 = OpVectorShuffle %148 %148 2 3 
                                       f32_2 %150 = OpFAdd %146 %149 
                                                      OpStore %138 %150 
                                Uniform f32* %154 = OpAccessChain %29 %151 %31 %152 
                                         f32 %155 = OpLoad %154 
                                         f32 %156 = OpFNegate %155 
                                Private f32* %159 = OpAccessChain %9 %157 
                                                      OpStore %159 %156 
                                Uniform f32* %160 = OpAccessChain %29 %151 %67 %152 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpFNegate %161 
                                Private f32* %163 = OpAccessChain %9 %123 
                                                      OpStore %163 %162 
                                Uniform f32* %164 = OpAccessChain %29 %151 %78 %152 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFNegate %165 
                                Private f32* %167 = OpAccessChain %9 %152 
                                                      OpStore %167 %166 
                                       f32_4 %169 = OpLoad %9 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_4 %171 = OpLoad %9 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                         f32 %173 = OpDot %170 %172 
                                                      OpStore %168 %173 
                                         f32 %174 = OpLoad %168 
                                         f32 %175 = OpExtInst %1 32 %174 
                                                      OpStore %168 %175 
                                         f32 %176 = OpLoad %168 
                                       f32_3 %177 = OpCompositeConstruct %176 %176 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                                       f32_3 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %9 
                                       f32_4 %182 = OpVectorShuffle %181 %180 4 5 6 3 
                                                      OpStore %9 %182 
                                       f32_4 %184 = OpLoad %9 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                                      OpStore %183 %185 
                                                      OpStore %186 %188 
                                                      OpStore %189 %190 
                                Private f32* %193 = OpAccessChain %9 %123 
                                         f32 %194 = OpLoad %193 
                                Private f32* %195 = OpAccessChain %9 %123 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFMul %194 %196 
                                Private f32* %198 = OpAccessChain %192 %157 
                                                      OpStore %198 %197 
                                Private f32* %199 = OpAccessChain %9 %157 
                                         f32 %200 = OpLoad %199 
                                Private f32* %201 = OpAccessChain %9 %157 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFMul %200 %202 
                                Private f32* %204 = OpAccessChain %192 %157 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFNegate %205 
                                         f32 %207 = OpFAdd %203 %206 
                                Private f32* %208 = OpAccessChain %192 %157 
                                                      OpStore %208 %207 
                                       f32_4 %210 = OpLoad %9 
                                       f32_4 %211 = OpVectorShuffle %210 %210 1 2 2 0 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %213 = OpVectorShuffle %212 %212 0 1 2 2 
                                       f32_4 %214 = OpFMul %211 %213 
                                                      OpStore %209 %214 
                              Uniform f32_4* %217 = OpAccessChain %29 %216 
                                       f32_4 %218 = OpLoad %217 
                                       f32_4 %219 = OpLoad %209 
                                         f32 %220 = OpDot %218 %219 
                                Private f32* %221 = OpAccessChain %215 %157 
                                                      OpStore %221 %220 
                              Uniform f32_4* %223 = OpAccessChain %29 %222 
                                       f32_4 %224 = OpLoad %223 
                                       f32_4 %225 = OpLoad %209 
                                         f32 %226 = OpDot %224 %225 
                                Private f32* %227 = OpAccessChain %215 %123 
                                                      OpStore %227 %226 
                              Uniform f32_4* %229 = OpAccessChain %29 %228 
                                       f32_4 %230 = OpLoad %229 
                                       f32_4 %231 = OpLoad %209 
                                         f32 %232 = OpDot %230 %231 
                                Private f32* %233 = OpAccessChain %215 %152 
                                                      OpStore %233 %232 
                              Uniform f32_4* %235 = OpAccessChain %29 %234 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                                       f32_3 %238 = OpLoad %192 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 0 0 
                                       f32_3 %240 = OpFMul %237 %239 
                                       f32_3 %241 = OpLoad %215 
                                       f32_3 %242 = OpFAdd %240 %241 
                                                      OpStore %192 %242 
                                Private f32* %245 = OpAccessChain %9 %244 
                                                      OpStore %245 %243 
                              Uniform f32_4* %246 = OpAccessChain %29 %67 
                                       f32_4 %247 = OpLoad %246 
                                       f32_4 %248 = OpLoad %9 
                                         f32 %249 = OpDot %247 %248 
                                Private f32* %250 = OpAccessChain %215 %157 
                                                      OpStore %250 %249 
                              Uniform f32_4* %251 = OpAccessChain %29 %78 
                                       f32_4 %252 = OpLoad %251 
                                       f32_4 %253 = OpLoad %9 
                                         f32 %254 = OpDot %252 %253 
                                Private f32* %255 = OpAccessChain %215 %123 
                                                      OpStore %255 %254 
                              Uniform f32_4* %256 = OpAccessChain %29 %87 
                                       f32_4 %257 = OpLoad %256 
                                       f32_4 %258 = OpLoad %9 
                                         f32 %259 = OpDot %257 %258 
                                Private f32* %260 = OpAccessChain %215 %152 
                                                      OpStore %260 %259 
                                       f32_3 %261 = OpLoad %192 
                                       f32_3 %262 = OpLoad %215 
                                       f32_3 %263 = OpFAdd %261 %262 
                                                      OpStore %192 %263 
                                       f32_3 %264 = OpLoad %192 
                                       f32_3 %265 = OpExtInst %1 40 %264 %190 
                                                      OpStore %192 %265 
                                       f32_3 %266 = OpLoad %192 
                                       f32_3 %267 = OpExtInst %1 30 %266 
                                       f32_4 %268 = OpLoad %9 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %9 %269 
                                       f32_4 %270 = OpLoad %9 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                       f32_3 %274 = OpFMul %271 %273 
                                       f32_4 %275 = OpLoad %9 
                                       f32_4 %276 = OpVectorShuffle %275 %274 4 5 6 3 
                                                      OpStore %9 %276 
                                       f32_4 %277 = OpLoad %9 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
                                       f32_3 %279 = OpExtInst %1 29 %278 
                                       f32_4 %280 = OpLoad %9 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 6 3 
                                                      OpStore %9 %281 
                                       f32_4 %282 = OpLoad %9 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_3 %286 = OpFMul %283 %285 
                                       f32_3 %289 = OpFAdd %286 %288 
                                       f32_4 %290 = OpLoad %9 
                                       f32_4 %291 = OpVectorShuffle %290 %289 4 5 6 3 
                                                      OpStore %9 %291 
                                       f32_4 %292 = OpLoad %9 
                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                                       f32_3 %294 = OpExtInst %1 40 %293 %190 
                                       f32_4 %295 = OpLoad %9 
                                       f32_4 %296 = OpVectorShuffle %295 %294 4 5 6 3 
                                                      OpStore %9 %296 
                                       f32_4 %298 = OpLoad %9 
                                       f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                                      OpStore %297 %299 
                                 Output f32* %301 = OpAccessChain %127 %31 %123 
                                         f32 %302 = OpLoad %301 
                                         f32 %303 = OpFNegate %302 
                                 Output f32* %304 = OpAccessChain %127 %31 %123 
                                                      OpStore %304 %303 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 234
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %46 %89 %201 %216 %220 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpMemberDecorate %25 0 RelaxedPrecision 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpMemberDecorate %25 1 RelaxedPrecision 
                                                      OpMemberDecorate %25 1 Offset 25 
                                                      OpMemberDecorate %25 2 Offset 25 
                                                      OpMemberDecorate %25 3 Offset 25 
                                                      OpMemberDecorate %25 4 Offset 25 
                                                      OpMemberDecorate %25 5 Offset 25 
                                                      OpMemberDecorate %25 6 RelaxedPrecision 
                                                      OpMemberDecorate %25 6 Offset 25 
                                                      OpMemberDecorate %25 7 Offset 25 
                                                      OpMemberDecorate %25 8 Offset 25 
                                                      OpDecorate %25 Block 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %170 DescriptorSet 170 
                                                      OpDecorate %170 Binding 170 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 Location 201 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %216 Location 216 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %220 Location 220 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeVector %6 3 
                                              %25 = OpTypeStruct %7 %7 %7 %23 %24 %24 %7 %6 %6 
                                              %26 = OpTypePointer Uniform %25 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 8 
                                              %30 = OpTypePointer Uniform %6 
                                          i32 %33 = OpConstant 7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %24 
                                 Input f32_3* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %58 = OpConstant 3.67402E-40 
                                          i32 %61 = OpConstant 0 
                                          i32 %62 = OpConstant 1 
                                          i32 %64 = OpConstant -1 
                                          i32 %70 = OpConstant 2 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                              %87 = OpTypePointer Private %24 
                               Private f32_3* %88 = OpVariable Private 
                                 Input f32_3* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 3 
                                              %93 = OpTypePointer Uniform %7 
                                             %119 = OpTypePointer Function %24 
                                         i32 %132 = OpConstant 5 
                                             %133 = OpTypePointer Uniform %24 
                                         i32 %142 = OpConstant 4 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                Private f32* %155 = OpVariable Private 
                                         u32 %156 = OpConstant 2 
                                         f32 %159 = OpConstant 3.67402E-40 
                                             %167 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %168 = OpTypeSampledImage %167 
                                             %169 = OpTypePointer UniformConstant %168 
 UniformConstant read_only Texture3DSampled* %170 = OpVariable UniformConstant 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %181 = OpConstant 3 
                              Private f32_3* %183 = OpVariable Private 
                                         i32 %195 = OpConstant 6 
                                Private f32* %200 = OpVariable Private 
                                Input f32_3* %201 = OpVariable Input 
                              Private f32_3* %213 = OpVariable Private 
                                Input f32_3* %216 = OpVariable Input 
                                             %219 = OpTypePointer Output %7 
                               Output f32_4* %220 = OpVariable Output 
                                             %231 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %120 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %31 = OpAccessChain %27 %29 
                                          f32 %32 = OpLoad %31 
                                 Uniform f32* %34 = OpAccessChain %27 %33 
                                          f32 %35 = OpLoad %34 
                                          f32 %36 = OpFMul %32 %35 
                                 Private f32* %39 = OpAccessChain %20 %37 
                                                      OpStore %39 %36 
                                 Private f32* %40 = OpAccessChain %20 %37 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFMul %42 %43 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %44 %50 
                                 Private f32* %52 = OpAccessChain %20 %37 
                                                      OpStore %52 %51 
                                 Private f32* %56 = OpAccessChain %20 %37 
                                          f32 %57 = OpLoad %56 
                                         bool %59 = OpFOrdLessThan %57 %58 
                                                      OpStore %55 %59 
                                         bool %60 = OpLoad %55 
                                          i32 %63 = OpSelect %60 %62 %61 
                                          i32 %65 = OpIMul %63 %64 
                                         bool %66 = OpINotEqual %65 %61 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %68 
                                              %67 = OpLabel 
                                                      OpKill
                                              %68 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %27 %70 %37 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %55 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %55 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %177 
                                              %82 = OpLabel 
                                 Uniform f32* %84 = OpAccessChain %27 %70 %47 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdEqual %85 %73 
                                                      OpStore %55 %86 
                                        f32_3 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 1 1 1 
                               Uniform f32_4* %94 = OpAccessChain %27 %92 %62 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFMul %91 %96 
                                                      OpStore %88 %97 
                               Uniform f32_4* %98 = OpAccessChain %27 %92 %61 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpLoad %89 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_3 %104 = OpLoad %88 
                                       f32_3 %105 = OpFAdd %103 %104 
                                                      OpStore %88 %105 
                              Uniform f32_4* %106 = OpAccessChain %27 %92 %70 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpLoad %89 
                                       f32_3 %110 = OpVectorShuffle %109 %109 2 2 2 
                                       f32_3 %111 = OpFMul %108 %110 
                                       f32_3 %112 = OpLoad %88 
                                       f32_3 %113 = OpFAdd %111 %112 
                                                      OpStore %88 %113 
                                       f32_3 %114 = OpLoad %88 
                              Uniform f32_4* %115 = OpAccessChain %27 %92 %92 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                                      OpStore %88 %118 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %125 
                                             %122 = OpLabel 
                                       f32_3 %124 = OpLoad %88 
                                                      OpStore %120 %124 
                                                      OpBranch %123 
                                             %125 = OpLabel 
                                       f32_3 %126 = OpLoad %89 
                                                      OpStore %120 %126 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_3 %127 = OpLoad %120 
                                       f32_4 %128 = OpLoad %20 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %20 %129 
                                       f32_4 %130 = OpLoad %20 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %27 %132 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFNegate %135 
                                       f32_3 %137 = OpFAdd %131 %136 
                                       f32_4 %138 = OpLoad %20 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %20 %139 
                                       f32_4 %140 = OpLoad %20 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %27 %142 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %141 %144 
                                       f32_4 %146 = OpLoad %20 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %20 %147 
                                Private f32* %148 = OpAccessChain %20 %47 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %88 %37 
                                                      OpStore %154 %153 
                                Uniform f32* %157 = OpAccessChain %27 %70 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                         f32 %161 = OpFAdd %160 %152 
                                                      OpStore %155 %161 
                                Private f32* %162 = OpAccessChain %88 %37 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpLoad %155 
                                         f32 %165 = OpExtInst %1 40 %163 %164 
                                Private f32* %166 = OpAccessChain %20 %37 
                                                      OpStore %166 %165 
                  read_only Texture3DSampled %171 = OpLoad %170 
                                       f32_4 %172 = OpLoad %20 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 2 3 
                                       f32_4 %174 = OpImageSampleImplicitLod %171 %173 
                                                      OpStore %20 %174 
                                       f32_4 %176 = OpLoad %20 
                                                      OpStore %175 %176 
                                                      OpBranch %83 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %175 %37 
                                                      OpStore %178 %73 
                                Private f32* %179 = OpAccessChain %175 %47 
                                                      OpStore %179 %73 
                                Private f32* %180 = OpAccessChain %175 %156 
                                                      OpStore %180 %73 
                                Private f32* %182 = OpAccessChain %175 %181 
                                                      OpStore %182 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %184 = OpLoad %175 
                              Uniform f32_4* %185 = OpAccessChain %27 %62 
                                       f32_4 %186 = OpLoad %185 
                                         f32 %187 = OpDot %184 %186 
                                Private f32* %188 = OpAccessChain %183 %37 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %183 %37 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpExtInst %1 43 %190 %58 %73 
                                Private f32* %192 = OpAccessChain %183 %37 
                                                      OpStore %192 %191 
                                       f32_3 %193 = OpLoad %183 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                              Uniform f32_4* %196 = OpAccessChain %27 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFMul %194 %198 
                                                      OpStore %183 %199 
                                       f32_3 %202 = OpLoad %201 
                              Uniform f32_4* %203 = OpAccessChain %27 %61 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                         f32 %206 = OpDot %202 %205 
                                                      OpStore %200 %206 
                                         f32 %207 = OpLoad %200 
                                         f32 %208 = OpExtInst %1 40 %207 %58 
                                                      OpStore %200 %208 
                                       f32_4 %209 = OpLoad %9 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpLoad %183 
                                       f32_3 %212 = OpFMul %210 %211 
                                                      OpStore %183 %212 
                                       f32_4 %214 = OpLoad %9 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %217 = OpLoad %216 
                                       f32_3 %218 = OpFMul %215 %217 
                                                      OpStore %213 %218 
                                       f32_3 %221 = OpLoad %183 
                                         f32 %222 = OpLoad %200 
                                       f32_3 %223 = OpCompositeConstruct %222 %222 %222 
                                       f32_3 %224 = OpFMul %221 %223 
                                       f32_3 %225 = OpLoad %213 
                                       f32_3 %226 = OpFAdd %224 %225 
                                       f32_4 %227 = OpLoad %220 
                                       f32_4 %228 = OpVectorShuffle %227 %226 4 5 6 3 
                                                      OpStore %220 %228 
                                Private f32* %229 = OpAccessChain %9 %181 
                                         f32 %230 = OpLoad %229 
                                 Output f32* %232 = OpAccessChain %220 %181 
                                                      OpStore %232 %230 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ScreenParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec2 u_xlat12;
float u_xlat18;
void main()
{
    u_xlat0.xy = in_POSITION0.xy / in_POSITION0.ww;
    u_xlat12.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat12.xy * u_xlat0.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat12.xy;
    u_xlat0.xy = u_xlat0.xy * in_POSITION0.ww;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat1.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat1.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat18 = u_xlat1.y * u_xlat1.y;
    u_xlat18 = u_xlat1.x * u_xlat1.x + (-u_xlat18);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat1);
    u_xlat3.y = dot(unity_SHAg, u_xlat1);
    u_xlat3.z = dot(unity_SHAb, u_xlat1);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat3 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat1.zzzz + u_xlat4;
    u_xlat1 = max(u_xlat3, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat3 = inversesqrt(u_xlat1);
    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat1 * u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = _PixelHeight * _Threshold;
    u_xlat1.x = (-u_xlat1.x) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD5.xyz;
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 433
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %130 %141 %142 %187 %190 %193 %196 %421 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %26 ArrayStride 26 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 RelaxedPrecision 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 RelaxedPrecision 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 RelaxedPrecision 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpMemberDecorate %29 8 RelaxedPrecision 
                                                      OpMemberDecorate %29 8 Offset 29 
                                                      OpMemberDecorate %29 9 RelaxedPrecision 
                                                      OpMemberDecorate %29 9 Offset 29 
                                                      OpMemberDecorate %29 10 RelaxedPrecision 
                                                      OpMemberDecorate %29 10 Offset 29 
                                                      OpMemberDecorate %29 11 RelaxedPrecision 
                                                      OpMemberDecorate %29 11 Offset 29 
                                                      OpMemberDecorate %29 12 RelaxedPrecision 
                                                      OpMemberDecorate %29 12 Offset 29 
                                                      OpMemberDecorate %29 13 Offset 29 
                                                      OpMemberDecorate %29 14 Offset 29 
                                                      OpMemberDecorate %29 15 Offset 29 
                                                      OpMemberDecorate %29 16 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpMemberDecorate %128 0 BuiltIn 128 
                                                      OpMemberDecorate %128 1 BuiltIn 128 
                                                      OpMemberDecorate %128 2 BuiltIn 128 
                                                      OpDecorate %128 Block 
                                                      OpDecorate %141 Location 141 
                                                      OpDecorate %142 Location 142 
                                                      OpDecorate %187 Location 187 
                                                      OpDecorate %190 Location 190 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %193 Location 193 
                                                      OpDecorate %196 Location 196 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %358 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %362 RelaxedPrecision 
                                                      OpDecorate %363 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %386 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %389 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %391 RelaxedPrecision 
                                                      OpDecorate %421 RelaxedPrecision 
                                                      OpDecorate %421 Location 421 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %20 = OpTypePointer Private %12 
                               Private f32_2* %21 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 8 
                                              %24 = OpTypeArray %7 %23 
                                          u32 %25 = OpConstant 4 
                                              %26 = OpTypeArray %7 %25 
                                              %27 = OpTypeArray %7 %25 
                                              %28 = OpTypeArray %7 %25 
                                              %29 = OpTypeStruct %7 %7 %7 %7 %7 %24 %7 %7 %7 %7 %7 %7 %7 %26 %27 %28 %7 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 0 
                                              %34 = OpTypePointer Uniform %7 
                                          f32 %38 = OpConstant 3.67402E-40 
                                        f32_2 %39 = OpConstantComposite %38 %38 
                               Private f32_4* %65 = OpVariable Private 
                                          i32 %68 = OpConstant 13 
                                          i32 %69 = OpConstant 1 
                                          i32 %80 = OpConstant 2 
                                          i32 %89 = OpConstant 3 
                                              %93 = OpTypeVector %6 3 
                              Private f32_4* %105 = OpVariable Private 
                                         i32 %108 = OpConstant 15 
                                         u32 %126 = OpConstant 1 
                                             %127 = OpTypeArray %6 %126 
                                             %128 = OpTypeStruct %7 %6 %127 
                                             %129 = OpTypePointer Output %128 
        Output struct {f32_4; f32; f32[1];}* %130 = OpVariable Output 
                                             %138 = OpTypePointer Output %7 
                                             %140 = OpTypePointer Output %12 
                               Output f32_2* %141 = OpVariable Output 
                                Input f32_4* %142 = OpVariable Input 
                                         i32 %145 = OpConstant 16 
                                         i32 %154 = OpConstant 14 
                                         u32 %155 = OpConstant 2 
                                             %156 = OpTypePointer Uniform %6 
                                         u32 %160 = OpConstant 0 
                                             %161 = OpTypePointer Private %6 
                                Private f32* %171 = OpVariable Private 
                                             %186 = OpTypePointer Output %93 
                               Output f32_3* %187 = OpVariable Output 
                               Output f32_3* %190 = OpVariable Output 
                               Output f32_4* %193 = OpVariable Output 
                                         f32 %194 = OpConstant 3.67402E-40 
                                       f32_4 %195 = OpConstantComposite %194 %194 %194 %194 
                               Output f32_3* %196 = OpVariable Output 
                                       f32_3 %197 = OpConstantComposite %194 %194 %194 
                              Private f32_4* %204 = OpVariable Private 
                              Private f32_4* %217 = OpVariable Private 
                                         f32 %248 = OpConstant 3.67402E-40 
                                       f32_4 %249 = OpConstantComposite %248 %248 %248 %248 
                                         i32 %254 = OpConstant 4 
                                         f32 %258 = OpConstant 3.67402E-40 
                                       f32_4 %259 = OpConstantComposite %258 %258 %258 %258 
                                         i32 %273 = OpConstant 5 
                                             %313 = OpTypePointer Private %93 
                              Private f32_3* %314 = OpVariable Private 
                              Private f32_4* %331 = OpVariable Private 
                              Private f32_3* %337 = OpVariable Private 
                                         i32 %338 = OpConstant 9 
                                         i32 %344 = OpConstant 10 
                                         i32 %350 = OpConstant 11 
                                         i32 %356 = OpConstant 12 
                                         u32 %365 = OpConstant 3 
                                         i32 %367 = OpConstant 6 
                                         i32 %373 = OpConstant 7 
                                         i32 %379 = OpConstant 8 
                                         f32 %396 = OpConstant 3.67402E-40 
                                       f32_3 %397 = OpConstantComposite %396 %396 %396 
                                         f32 %408 = OpConstant 3.67402E-40 
                                       f32_3 %409 = OpConstantComposite %408 %408 %408 
                                         f32 %411 = OpConstant 3.67402E-40 
                                       f32_3 %412 = OpConstantComposite %411 %411 %411 
                               Output f32_3* %421 = OpVariable Output 
                                             %427 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_4 %15 = OpLoad %11 
                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                        f32_2 %17 = OpFDiv %14 %16 
                                        f32_4 %18 = OpLoad %9 
                                        f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                      OpStore %9 %19 
                               Uniform f32_4* %35 = OpAccessChain %31 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_2 %37 = OpVectorShuffle %36 %36 0 1 
                                        f32_2 %40 = OpFMul %37 %39 
                                                      OpStore %21 %40 
                                        f32_2 %41 = OpLoad %21 
                                        f32_4 %42 = OpLoad %9 
                                        f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                                        f32_2 %44 = OpFMul %41 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpVectorShuffle %45 %44 4 5 2 3 
                                                      OpStore %9 %46 
                                        f32_4 %47 = OpLoad %9 
                                        f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                        f32_2 %49 = OpExtInst %1 2 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 2 3 
                                                      OpStore %9 %51 
                                        f32_4 %52 = OpLoad %9 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_2 %54 = OpLoad %21 
                                        f32_2 %55 = OpFDiv %53 %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 2 3 
                                                      OpStore %9 %57 
                                        f32_4 %58 = OpLoad %9 
                                        f32_2 %59 = OpVectorShuffle %58 %58 0 1 
                                        f32_4 %60 = OpLoad %11 
                                        f32_2 %61 = OpVectorShuffle %60 %60 3 3 
                                        f32_2 %62 = OpFMul %59 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                                      OpStore %9 %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpVectorShuffle %66 %66 1 1 1 1 
                               Uniform f32_4* %70 = OpAccessChain %31 %68 %69 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpFMul %67 %71 
                                                      OpStore %65 %72 
                               Uniform f32_4* %73 = OpAccessChain %31 %68 %33 
                                        f32_4 %74 = OpLoad %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %75 0 0 0 0 
                                        f32_4 %77 = OpFMul %74 %76 
                                        f32_4 %78 = OpLoad %65 
                                        f32_4 %79 = OpFAdd %77 %78 
                                                      OpStore %9 %79 
                               Uniform f32_4* %81 = OpAccessChain %31 %68 %80 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %11 
                                        f32_4 %84 = OpVectorShuffle %83 %83 2 2 2 2 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %88 = OpLoad %9 
                               Uniform f32_4* %90 = OpAccessChain %31 %68 %89 
                                        f32_4 %91 = OpLoad %90 
                                        f32_4 %92 = OpFAdd %88 %91 
                                                      OpStore %65 %92 
                               Uniform f32_4* %94 = OpAccessChain %31 %68 %89 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_4 %97 = OpLoad %11 
                                        f32_3 %98 = OpVectorShuffle %97 %97 3 3 3 
                                        f32_3 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpFAdd %99 %101 
                                       f32_4 %103 = OpLoad %9 
                                       f32_4 %104 = OpVectorShuffle %103 %102 4 5 6 3 
                                                      OpStore %9 %104 
                                       f32_4 %106 = OpLoad %65 
                                       f32_4 %107 = OpVectorShuffle %106 %106 1 1 1 1 
                              Uniform f32_4* %109 = OpAccessChain %31 %108 %69 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpFMul %107 %110 
                                                      OpStore %105 %111 
                              Uniform f32_4* %112 = OpAccessChain %31 %108 %33 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpLoad %65 
                                       f32_4 %115 = OpVectorShuffle %114 %114 0 0 0 0 
                                       f32_4 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %105 
                                       f32_4 %118 = OpFAdd %116 %117 
                                                      OpStore %105 %118 
                              Uniform f32_4* %119 = OpAccessChain %31 %108 %80 
                                       f32_4 %120 = OpLoad %119 
                                       f32_4 %121 = OpLoad %65 
                                       f32_4 %122 = OpVectorShuffle %121 %121 2 2 2 2 
                                       f32_4 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %105 
                                       f32_4 %125 = OpFAdd %123 %124 
                                                      OpStore %105 %125 
                              Uniform f32_4* %131 = OpAccessChain %31 %108 %89 
                                       f32_4 %132 = OpLoad %131 
                                       f32_4 %133 = OpLoad %65 
                                       f32_4 %134 = OpVectorShuffle %133 %133 3 3 3 3 
                                       f32_4 %135 = OpFMul %132 %134 
                                       f32_4 %136 = OpLoad %105 
                                       f32_4 %137 = OpFAdd %135 %136 
                               Output f32_4* %139 = OpAccessChain %130 %33 
                                                      OpStore %139 %137 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                              Uniform f32_4* %146 = OpAccessChain %31 %145 
                                       f32_4 %147 = OpLoad %146 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                                       f32_2 %149 = OpFMul %144 %148 
                              Uniform f32_4* %150 = OpAccessChain %31 %145 
                                       f32_4 %151 = OpLoad %150 
                                       f32_2 %152 = OpVectorShuffle %151 %151 2 3 
                                       f32_2 %153 = OpFAdd %149 %152 
                                                      OpStore %141 %153 
                                Uniform f32* %157 = OpAccessChain %31 %154 %33 %155 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFNegate %158 
                                Private f32* %162 = OpAccessChain %65 %160 
                                                      OpStore %162 %159 
                                Uniform f32* %163 = OpAccessChain %31 %154 %69 %155 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpFNegate %164 
                                Private f32* %166 = OpAccessChain %65 %126 
                                                      OpStore %166 %165 
                                Uniform f32* %167 = OpAccessChain %31 %154 %80 %155 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFNegate %168 
                                Private f32* %170 = OpAccessChain %65 %155 
                                                      OpStore %170 %169 
                                       f32_4 %172 = OpLoad %65 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_4 %174 = OpLoad %65 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                         f32 %176 = OpDot %173 %175 
                                                      OpStore %171 %176 
                                         f32 %177 = OpLoad %171 
                                         f32 %178 = OpExtInst %1 32 %177 
                                                      OpStore %171 %178 
                                         f32 %179 = OpLoad %171 
                                       f32_3 %180 = OpCompositeConstruct %179 %179 %179 
                                       f32_4 %181 = OpLoad %65 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                       f32_3 %183 = OpFMul %180 %182 
                                       f32_4 %184 = OpLoad %65 
                                       f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
                                                      OpStore %65 %185 
                                       f32_4 %188 = OpLoad %65 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                                      OpStore %187 %189 
                                       f32_4 %191 = OpLoad %9 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 2 
                                                      OpStore %190 %192 
                                                      OpStore %193 %195 
                                                      OpStore %196 %197 
                                       f32_4 %198 = OpLoad %9 
                                       f32_4 %199 = OpVectorShuffle %198 %198 0 0 0 0 
                                       f32_4 %200 = OpFNegate %199 
                              Uniform f32_4* %201 = OpAccessChain %31 %69 
                                       f32_4 %202 = OpLoad %201 
                                       f32_4 %203 = OpFAdd %200 %202 
                                                      OpStore %105 %203 
                                       f32_4 %205 = OpLoad %9 
                                       f32_4 %206 = OpVectorShuffle %205 %205 1 1 1 1 
                                       f32_4 %207 = OpFNegate %206 
                              Uniform f32_4* %208 = OpAccessChain %31 %80 
                                       f32_4 %209 = OpLoad %208 
                                       f32_4 %210 = OpFAdd %207 %209 
                                                      OpStore %204 %210 
                                       f32_4 %211 = OpLoad %9 
                                       f32_4 %212 = OpVectorShuffle %211 %211 2 2 2 2 
                                       f32_4 %213 = OpFNegate %212 
                              Uniform f32_4* %214 = OpAccessChain %31 %89 
                                       f32_4 %215 = OpLoad %214 
                                       f32_4 %216 = OpFAdd %213 %215 
                                                      OpStore %9 %216 
                                       f32_4 %218 = OpLoad %65 
                                       f32_4 %219 = OpVectorShuffle %218 %218 1 1 1 1 
                                       f32_4 %220 = OpLoad %204 
                                       f32_4 %221 = OpFMul %219 %220 
                                                      OpStore %217 %221 
                                       f32_4 %222 = OpLoad %204 
                                       f32_4 %223 = OpLoad %204 
                                       f32_4 %224 = OpFMul %222 %223 
                                                      OpStore %204 %224 
                                       f32_4 %225 = OpLoad %105 
                                       f32_4 %226 = OpLoad %105 
                                       f32_4 %227 = OpFMul %225 %226 
                                       f32_4 %228 = OpLoad %204 
                                       f32_4 %229 = OpFAdd %227 %228 
                                                      OpStore %204 %229 
                                       f32_4 %230 = OpLoad %105 
                                       f32_4 %231 = OpLoad %65 
                                       f32_4 %232 = OpVectorShuffle %231 %231 0 0 0 0 
                                       f32_4 %233 = OpFMul %230 %232 
                                       f32_4 %234 = OpLoad %217 
                                       f32_4 %235 = OpFAdd %233 %234 
                                                      OpStore %105 %235 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpLoad %65 
                                       f32_4 %238 = OpVectorShuffle %237 %237 2 2 2 2 
                                       f32_4 %239 = OpFMul %236 %238 
                                       f32_4 %240 = OpLoad %105 
                                       f32_4 %241 = OpFAdd %239 %240 
                                                      OpStore %105 %241 
                                       f32_4 %242 = OpLoad %9 
                                       f32_4 %243 = OpLoad %9 
                                       f32_4 %244 = OpFMul %242 %243 
                                       f32_4 %245 = OpLoad %204 
                                       f32_4 %246 = OpFAdd %244 %245 
                                                      OpStore %9 %246 
                                       f32_4 %247 = OpLoad %9 
                                       f32_4 %250 = OpExtInst %1 40 %247 %249 
                                                      OpStore %9 %250 
                                       f32_4 %251 = OpLoad %9 
                                       f32_4 %252 = OpExtInst %1 32 %251 
                                                      OpStore %204 %252 
                                       f32_4 %253 = OpLoad %9 
                              Uniform f32_4* %255 = OpAccessChain %31 %254 
                                       f32_4 %256 = OpLoad %255 
                                       f32_4 %257 = OpFMul %253 %256 
                                       f32_4 %260 = OpFAdd %257 %259 
                                                      OpStore %9 %260 
                                       f32_4 %261 = OpLoad %9 
                                       f32_4 %262 = OpFDiv %259 %261 
                                                      OpStore %9 %262 
                                       f32_4 %263 = OpLoad %105 
                                       f32_4 %264 = OpLoad %204 
                                       f32_4 %265 = OpFMul %263 %264 
                                                      OpStore %105 %265 
                                       f32_4 %266 = OpLoad %105 
                                       f32_4 %267 = OpExtInst %1 40 %266 %195 
                                                      OpStore %105 %267 
                                       f32_4 %268 = OpLoad %9 
                                       f32_4 %269 = OpLoad %105 
                                       f32_4 %270 = OpFMul %268 %269 
                                                      OpStore %9 %270 
                                       f32_4 %271 = OpLoad %9 
                                       f32_3 %272 = OpVectorShuffle %271 %271 1 1 1 
                              Uniform f32_4* %274 = OpAccessChain %31 %273 %69 
                                       f32_4 %275 = OpLoad %274 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 1 2 
                                       f32_3 %277 = OpFMul %272 %276 
                                       f32_4 %278 = OpLoad %105 
                                       f32_4 %279 = OpVectorShuffle %278 %277 4 5 6 3 
                                                      OpStore %105 %279 
                              Uniform f32_4* %280 = OpAccessChain %31 %273 %33 
                                       f32_4 %281 = OpLoad %280 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                                       f32_4 %283 = OpLoad %9 
                                       f32_3 %284 = OpVectorShuffle %283 %283 0 0 0 
                                       f32_3 %285 = OpFMul %282 %284 
                                       f32_4 %286 = OpLoad %105 
                                       f32_3 %287 = OpVectorShuffle %286 %286 0 1 2 
                                       f32_3 %288 = OpFAdd %285 %287 
                                       f32_4 %289 = OpLoad %105 
                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 6 3 
                                                      OpStore %105 %290 
                              Uniform f32_4* %291 = OpAccessChain %31 %273 %80 
                                       f32_4 %292 = OpLoad %291 
                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                                       f32_4 %294 = OpLoad %9 
                                       f32_3 %295 = OpVectorShuffle %294 %294 2 2 2 
                                       f32_3 %296 = OpFMul %293 %295 
                                       f32_4 %297 = OpLoad %105 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 2 
                                       f32_3 %299 = OpFAdd %296 %298 
                                       f32_4 %300 = OpLoad %9 
                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 6 3 
                                                      OpStore %9 %301 
                              Uniform f32_4* %302 = OpAccessChain %31 %273 %89 
                                       f32_4 %303 = OpLoad %302 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 1 2 
                                       f32_4 %305 = OpLoad %9 
                                       f32_3 %306 = OpVectorShuffle %305 %305 3 3 3 
                                       f32_3 %307 = OpFMul %304 %306 
                                       f32_4 %308 = OpLoad %9 
                                       f32_3 %309 = OpVectorShuffle %308 %308 0 1 2 
                                       f32_3 %310 = OpFAdd %307 %309 
                                       f32_4 %311 = OpLoad %9 
                                       f32_4 %312 = OpVectorShuffle %311 %310 4 5 6 3 
                                                      OpStore %9 %312 
                                Private f32* %315 = OpAccessChain %65 %126 
                                         f32 %316 = OpLoad %315 
                                Private f32* %317 = OpAccessChain %65 %126 
                                         f32 %318 = OpLoad %317 
                                         f32 %319 = OpFMul %316 %318 
                                Private f32* %320 = OpAccessChain %314 %160 
                                                      OpStore %320 %319 
                                Private f32* %321 = OpAccessChain %65 %160 
                                         f32 %322 = OpLoad %321 
                                Private f32* %323 = OpAccessChain %65 %160 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFMul %322 %324 
                                Private f32* %326 = OpAccessChain %314 %160 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpFNegate %327 
                                         f32 %329 = OpFAdd %325 %328 
                                Private f32* %330 = OpAccessChain %314 %160 
                                                      OpStore %330 %329 
                                       f32_4 %332 = OpLoad %65 
                                       f32_4 %333 = OpVectorShuffle %332 %332 1 2 2 0 
                                       f32_4 %334 = OpLoad %65 
                                       f32_4 %335 = OpVectorShuffle %334 %334 0 1 2 2 
                                       f32_4 %336 = OpFMul %333 %335 
                                                      OpStore %331 %336 
                              Uniform f32_4* %339 = OpAccessChain %31 %338 
                                       f32_4 %340 = OpLoad %339 
                                       f32_4 %341 = OpLoad %331 
                                         f32 %342 = OpDot %340 %341 
                                Private f32* %343 = OpAccessChain %337 %160 
                                                      OpStore %343 %342 
                              Uniform f32_4* %345 = OpAccessChain %31 %344 
                                       f32_4 %346 = OpLoad %345 
                                       f32_4 %347 = OpLoad %331 
                                         f32 %348 = OpDot %346 %347 
                                Private f32* %349 = OpAccessChain %337 %126 
                                                      OpStore %349 %348 
                              Uniform f32_4* %351 = OpAccessChain %31 %350 
                                       f32_4 %352 = OpLoad %351 
                                       f32_4 %353 = OpLoad %331 
                                         f32 %354 = OpDot %352 %353 
                                Private f32* %355 = OpAccessChain %337 %155 
                                                      OpStore %355 %354 
                              Uniform f32_4* %357 = OpAccessChain %31 %356 
                                       f32_4 %358 = OpLoad %357 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                       f32_3 %360 = OpLoad %314 
                                       f32_3 %361 = OpVectorShuffle %360 %360 0 0 0 
                                       f32_3 %362 = OpFMul %359 %361 
                                       f32_3 %363 = OpLoad %337 
                                       f32_3 %364 = OpFAdd %362 %363 
                                                      OpStore %314 %364 
                                Private f32* %366 = OpAccessChain %65 %365 
                                                      OpStore %366 %258 
                              Uniform f32_4* %368 = OpAccessChain %31 %367 
                                       f32_4 %369 = OpLoad %368 
                                       f32_4 %370 = OpLoad %65 
                                         f32 %371 = OpDot %369 %370 
                                Private f32* %372 = OpAccessChain %337 %160 
                                                      OpStore %372 %371 
                              Uniform f32_4* %374 = OpAccessChain %31 %373 
                                       f32_4 %375 = OpLoad %374 
                                       f32_4 %376 = OpLoad %65 
                                         f32 %377 = OpDot %375 %376 
                                Private f32* %378 = OpAccessChain %337 %126 
                                                      OpStore %378 %377 
                              Uniform f32_4* %380 = OpAccessChain %31 %379 
                                       f32_4 %381 = OpLoad %380 
                                       f32_4 %382 = OpLoad %65 
                                         f32 %383 = OpDot %381 %382 
                                Private f32* %384 = OpAccessChain %337 %155 
                                                      OpStore %384 %383 
                                       f32_3 %385 = OpLoad %314 
                                       f32_3 %386 = OpLoad %337 
                                       f32_3 %387 = OpFAdd %385 %386 
                                                      OpStore %314 %387 
                                       f32_3 %388 = OpLoad %314 
                                       f32_3 %389 = OpExtInst %1 40 %388 %197 
                                                      OpStore %314 %389 
                                       f32_3 %390 = OpLoad %314 
                                       f32_3 %391 = OpExtInst %1 30 %390 
                                       f32_4 %392 = OpLoad %65 
                                       f32_4 %393 = OpVectorShuffle %392 %391 4 5 6 3 
                                                      OpStore %65 %393 
                                       f32_4 %394 = OpLoad %65 
                                       f32_3 %395 = OpVectorShuffle %394 %394 0 1 2 
                                       f32_3 %398 = OpFMul %395 %397 
                                       f32_4 %399 = OpLoad %65 
                                       f32_4 %400 = OpVectorShuffle %399 %398 4 5 6 3 
                                                      OpStore %65 %400 
                                       f32_4 %401 = OpLoad %65 
                                       f32_3 %402 = OpVectorShuffle %401 %401 0 1 2 
                                       f32_3 %403 = OpExtInst %1 29 %402 
                                       f32_4 %404 = OpLoad %65 
                                       f32_4 %405 = OpVectorShuffle %404 %403 4 5 6 3 
                                                      OpStore %65 %405 
                                       f32_4 %406 = OpLoad %65 
                                       f32_3 %407 = OpVectorShuffle %406 %406 0 1 2 
                                       f32_3 %410 = OpFMul %407 %409 
                                       f32_3 %413 = OpFAdd %410 %412 
                                       f32_4 %414 = OpLoad %65 
                                       f32_4 %415 = OpVectorShuffle %414 %413 4 5 6 3 
                                                      OpStore %65 %415 
                                       f32_4 %416 = OpLoad %65 
                                       f32_3 %417 = OpVectorShuffle %416 %416 0 1 2 
                                       f32_3 %418 = OpExtInst %1 40 %417 %197 
                                       f32_4 %419 = OpLoad %65 
                                       f32_4 %420 = OpVectorShuffle %419 %418 4 5 6 3 
                                                      OpStore %65 %420 
                                       f32_4 %422 = OpLoad %9 
                                       f32_3 %423 = OpVectorShuffle %422 %422 0 1 2 
                                       f32_4 %424 = OpLoad %65 
                                       f32_3 %425 = OpVectorShuffle %424 %424 0 1 2 
                                       f32_3 %426 = OpFAdd %423 %425 
                                                      OpStore %421 %426 
                                 Output f32* %428 = OpAccessChain %130 %33 %126 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFNegate %429 
                                 Output f32* %431 = OpAccessChain %130 %33 %126 
                                                      OpStore %431 %430 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 234
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %46 %89 %201 %216 %220 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpMemberDecorate %25 0 RelaxedPrecision 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpMemberDecorate %25 1 RelaxedPrecision 
                                                      OpMemberDecorate %25 1 Offset 25 
                                                      OpMemberDecorate %25 2 Offset 25 
                                                      OpMemberDecorate %25 3 Offset 25 
                                                      OpMemberDecorate %25 4 Offset 25 
                                                      OpMemberDecorate %25 5 Offset 25 
                                                      OpMemberDecorate %25 6 RelaxedPrecision 
                                                      OpMemberDecorate %25 6 Offset 25 
                                                      OpMemberDecorate %25 7 Offset 25 
                                                      OpMemberDecorate %25 8 Offset 25 
                                                      OpDecorate %25 Block 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %170 DescriptorSet 170 
                                                      OpDecorate %170 Binding 170 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 Location 201 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %216 Location 216 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %220 Location 220 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeVector %6 3 
                                              %25 = OpTypeStruct %7 %7 %7 %23 %24 %24 %7 %6 %6 
                                              %26 = OpTypePointer Uniform %25 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 8 
                                              %30 = OpTypePointer Uniform %6 
                                          i32 %33 = OpConstant 7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %24 
                                 Input f32_3* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %58 = OpConstant 3.67402E-40 
                                          i32 %61 = OpConstant 0 
                                          i32 %62 = OpConstant 1 
                                          i32 %64 = OpConstant -1 
                                          i32 %70 = OpConstant 2 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                              %87 = OpTypePointer Private %24 
                               Private f32_3* %88 = OpVariable Private 
                                 Input f32_3* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 3 
                                              %93 = OpTypePointer Uniform %7 
                                             %119 = OpTypePointer Function %24 
                                         i32 %132 = OpConstant 5 
                                             %133 = OpTypePointer Uniform %24 
                                         i32 %142 = OpConstant 4 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                Private f32* %155 = OpVariable Private 
                                         u32 %156 = OpConstant 2 
                                         f32 %159 = OpConstant 3.67402E-40 
                                             %167 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %168 = OpTypeSampledImage %167 
                                             %169 = OpTypePointer UniformConstant %168 
 UniformConstant read_only Texture3DSampled* %170 = OpVariable UniformConstant 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %181 = OpConstant 3 
                              Private f32_3* %183 = OpVariable Private 
                                         i32 %195 = OpConstant 6 
                                Private f32* %200 = OpVariable Private 
                                Input f32_3* %201 = OpVariable Input 
                              Private f32_3* %213 = OpVariable Private 
                                Input f32_3* %216 = OpVariable Input 
                                             %219 = OpTypePointer Output %7 
                               Output f32_4* %220 = OpVariable Output 
                                             %231 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %120 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %31 = OpAccessChain %27 %29 
                                          f32 %32 = OpLoad %31 
                                 Uniform f32* %34 = OpAccessChain %27 %33 
                                          f32 %35 = OpLoad %34 
                                          f32 %36 = OpFMul %32 %35 
                                 Private f32* %39 = OpAccessChain %20 %37 
                                                      OpStore %39 %36 
                                 Private f32* %40 = OpAccessChain %20 %37 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFMul %42 %43 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %44 %50 
                                 Private f32* %52 = OpAccessChain %20 %37 
                                                      OpStore %52 %51 
                                 Private f32* %56 = OpAccessChain %20 %37 
                                          f32 %57 = OpLoad %56 
                                         bool %59 = OpFOrdLessThan %57 %58 
                                                      OpStore %55 %59 
                                         bool %60 = OpLoad %55 
                                          i32 %63 = OpSelect %60 %62 %61 
                                          i32 %65 = OpIMul %63 %64 
                                         bool %66 = OpINotEqual %65 %61 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %68 
                                              %67 = OpLabel 
                                                      OpKill
                                              %68 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %27 %70 %37 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %55 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %55 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %177 
                                              %82 = OpLabel 
                                 Uniform f32* %84 = OpAccessChain %27 %70 %47 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdEqual %85 %73 
                                                      OpStore %55 %86 
                                        f32_3 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 1 1 1 
                               Uniform f32_4* %94 = OpAccessChain %27 %92 %62 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFMul %91 %96 
                                                      OpStore %88 %97 
                               Uniform f32_4* %98 = OpAccessChain %27 %92 %61 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpLoad %89 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_3 %104 = OpLoad %88 
                                       f32_3 %105 = OpFAdd %103 %104 
                                                      OpStore %88 %105 
                              Uniform f32_4* %106 = OpAccessChain %27 %92 %70 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpLoad %89 
                                       f32_3 %110 = OpVectorShuffle %109 %109 2 2 2 
                                       f32_3 %111 = OpFMul %108 %110 
                                       f32_3 %112 = OpLoad %88 
                                       f32_3 %113 = OpFAdd %111 %112 
                                                      OpStore %88 %113 
                                       f32_3 %114 = OpLoad %88 
                              Uniform f32_4* %115 = OpAccessChain %27 %92 %92 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                                      OpStore %88 %118 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %125 
                                             %122 = OpLabel 
                                       f32_3 %124 = OpLoad %88 
                                                      OpStore %120 %124 
                                                      OpBranch %123 
                                             %125 = OpLabel 
                                       f32_3 %126 = OpLoad %89 
                                                      OpStore %120 %126 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_3 %127 = OpLoad %120 
                                       f32_4 %128 = OpLoad %20 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %20 %129 
                                       f32_4 %130 = OpLoad %20 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %27 %132 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFNegate %135 
                                       f32_3 %137 = OpFAdd %131 %136 
                                       f32_4 %138 = OpLoad %20 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %20 %139 
                                       f32_4 %140 = OpLoad %20 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %27 %142 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %141 %144 
                                       f32_4 %146 = OpLoad %20 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %20 %147 
                                Private f32* %148 = OpAccessChain %20 %47 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %88 %37 
                                                      OpStore %154 %153 
                                Uniform f32* %157 = OpAccessChain %27 %70 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                         f32 %161 = OpFAdd %160 %152 
                                                      OpStore %155 %161 
                                Private f32* %162 = OpAccessChain %88 %37 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpLoad %155 
                                         f32 %165 = OpExtInst %1 40 %163 %164 
                                Private f32* %166 = OpAccessChain %20 %37 
                                                      OpStore %166 %165 
                  read_only Texture3DSampled %171 = OpLoad %170 
                                       f32_4 %172 = OpLoad %20 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 2 3 
                                       f32_4 %174 = OpImageSampleImplicitLod %171 %173 
                                                      OpStore %20 %174 
                                       f32_4 %176 = OpLoad %20 
                                                      OpStore %175 %176 
                                                      OpBranch %83 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %175 %37 
                                                      OpStore %178 %73 
                                Private f32* %179 = OpAccessChain %175 %47 
                                                      OpStore %179 %73 
                                Private f32* %180 = OpAccessChain %175 %156 
                                                      OpStore %180 %73 
                                Private f32* %182 = OpAccessChain %175 %181 
                                                      OpStore %182 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %184 = OpLoad %175 
                              Uniform f32_4* %185 = OpAccessChain %27 %62 
                                       f32_4 %186 = OpLoad %185 
                                         f32 %187 = OpDot %184 %186 
                                Private f32* %188 = OpAccessChain %183 %37 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %183 %37 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpExtInst %1 43 %190 %58 %73 
                                Private f32* %192 = OpAccessChain %183 %37 
                                                      OpStore %192 %191 
                                       f32_3 %193 = OpLoad %183 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                              Uniform f32_4* %196 = OpAccessChain %27 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFMul %194 %198 
                                                      OpStore %183 %199 
                                       f32_3 %202 = OpLoad %201 
                              Uniform f32_4* %203 = OpAccessChain %27 %61 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                         f32 %206 = OpDot %202 %205 
                                                      OpStore %200 %206 
                                         f32 %207 = OpLoad %200 
                                         f32 %208 = OpExtInst %1 40 %207 %58 
                                                      OpStore %200 %208 
                                       f32_4 %209 = OpLoad %9 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpLoad %183 
                                       f32_3 %212 = OpFMul %210 %211 
                                                      OpStore %183 %212 
                                       f32_4 %214 = OpLoad %9 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %217 = OpLoad %216 
                                       f32_3 %218 = OpFMul %215 %217 
                                                      OpStore %213 %218 
                                       f32_3 %221 = OpLoad %183 
                                         f32 %222 = OpLoad %200 
                                       f32_3 %223 = OpCompositeConstruct %222 %222 %222 
                                       f32_3 %224 = OpFMul %221 %223 
                                       f32_3 %225 = OpLoad %213 
                                       f32_3 %226 = OpFAdd %224 %225 
                                       f32_4 %227 = OpLoad %220 
                                       f32_4 %228 = OpVectorShuffle %227 %226 4 5 6 3 
                                                      OpStore %220 %228 
                                Private f32* %229 = OpAccessChain %9 %181 
                                         f32 %230 = OpLoad %229 
                                 Output f32* %232 = OpAccessChain %220 %181 
                                                      OpStore %232 %230 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "DUMMY" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "DUMMY" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "DUMMY" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "DUMMY" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "PIXELSNAP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "PIXELSNAP_ON" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "PIXELSNAP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "PIXELSNAP_ON" }
""
}
}
}
 Pass {
  Name "FORWARD"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 130975
Program "vp" {
SubProgram "d3d11 " {
Keywords { "POINT" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "DUMMY" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
bool u_xlatb12;
float u_xlat14;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat12 = _PixelHeight * _Threshold;
    u_xlat12 = (-u_xlat12) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb12 = u_xlat12<0.0;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb12)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat3.y * 0.25 + 0.75;
        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat12, u_xlat14);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xx);
    u_xlat12 = u_xlat12 * u_xlat10_2.w;
    u_xlat2.xyz = vec3(u_xlat12) * _LightColor0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat4.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT" "DUMMY" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 150
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %133 %139 %142 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %142 Location 142 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                         u32 %109 = OpConstant 2 
                                             %110 = OpTypePointer Uniform %6 
                                         u32 %114 = OpConstant 0 
                                             %115 = OpTypePointer Private %6 
                                Private f32* %125 = OpVariable Private 
                               Output f32_3* %133 = OpVariable Output 
                               Output f32_4* %139 = OpVariable Output 
                                         f32 %140 = OpConstant 3.67402E-40 
                                       f32_4 %141 = OpConstantComposite %140 %140 %140 %140 
                               Output f32_3* %142 = OpVariable Output 
                                       f32_3 %143 = OpConstantComposite %140 %140 %140 
                                             %144 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %36 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %36 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %86 = OpAccessChain %21 %36 %46 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %44 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %23 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %100 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %46 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %97 %108 
                                Uniform f32* %111 = OpAccessChain %21 %24 %23 %109 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpFNegate %112 
                                Private f32* %116 = OpAccessChain %9 %114 
                                                      OpStore %116 %113 
                                Uniform f32* %117 = OpAccessChain %21 %24 %24 %109 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                Private f32* %120 = OpAccessChain %9 %81 
                                                      OpStore %120 %119 
                                Uniform f32* %121 = OpAccessChain %21 %24 %36 %109 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                Private f32* %124 = OpAccessChain %9 %109 
                                                      OpStore %124 %123 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                         f32 %130 = OpDot %127 %129 
                                                      OpStore %125 %130 
                                         f32 %131 = OpLoad %125 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %125 %132 
                                         f32 %134 = OpLoad %125 
                                       f32_3 %135 = OpCompositeConstruct %134 %134 %134 
                                       f32_4 %136 = OpLoad %9 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpFMul %135 %137 
                                                      OpStore %133 %138 
                                                      OpStore %139 %141 
                                                      OpStore %142 %143 
                                 Output f32* %145 = OpAccessChain %85 %23 %81 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFNegate %146 
                                 Output f32* %148 = OpAccessChain %85 %23 %81 
                                                      OpStore %148 %147 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 289
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %49 %64 %266 %277 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 Location 49 
                                                      OpDecorate %64 Location 64 
                                                      OpDecorate %127 SpecId 127 
                                                      OpDecorate %222 DescriptorSet 222 
                                                      OpDecorate %222 Binding 222 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %248 DescriptorSet 248 
                                                      OpDecorate %248 Binding 248 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 Location 266 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %277 Location 277 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_3* %11 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %14 %16 
                                              %18 = OpTypeArray %14 %16 
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %14 
                                              %29 = OpTypePointer Private %6 
                                 Private f32* %30 = OpVariable Private 
                                              %40 = OpTypePointer Private %14 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %43 = OpTypeSampledImage %42 
                                              %44 = OpTypePointer UniformConstant %43 
  UniformConstant read_only Texture2DSampled* %45 = OpVariable UniformConstant 
                                              %47 = OpTypeVector %6 2 
                                              %48 = OpTypePointer Input %47 
                                 Input f32_2* %49 = OpVariable Input 
                                          i32 %52 = OpConstant 9 
                                              %53 = OpTypePointer Uniform %6 
                                          i32 %56 = OpConstant 8 
                                          f32 %62 = OpConstant 3.67402E-40 
                                 Input f32_3* %64 = OpVariable Input 
                                          u32 %65 = OpConstant 1 
                                              %66 = OpTypePointer Input %6 
                                              %70 = OpTypeBool 
                                              %71 = OpTypePointer Private %70 
                                Private bool* %72 = OpVariable Private 
                                          f32 %74 = OpConstant 3.67402E-40 
                                          i32 %77 = OpConstant 1 
                                          i32 %79 = OpConstant -1 
                               Private f32_3* %85 = OpVariable Private 
                                          i32 %88 = OpConstant 7 
                                         i32 %101 = OpConstant 2 
                                         i32 %111 = OpConstant 3 
                                         u32 %116 = OpConstant 0 
                                         f32 %119 = OpConstant 3.67402E-40 
                                        bool %121 = OpConstantFalse 
                                        bool %127 = OpSpecConstantFalse 
                              Private f32_4* %133 = OpVariable Private 
                                             %172 = OpTypePointer Function %7 
                                         i32 %186 = OpConstant 5 
                                             %187 = OpTypePointer Uniform %7 
                                         i32 %196 = OpConstant 4 
                                         f32 %204 = OpConstant 3.67402E-40 
                                         f32 %206 = OpConstant 3.67402E-40 
                                Private f32* %208 = OpVariable Private 
                                         u32 %209 = OpConstant 2 
                                         f32 %212 = OpConstant 3.67402E-40 
                                             %219 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %220 = OpTypeSampledImage %219 
                                             %221 = OpTypePointer UniformConstant %220 
 UniformConstant read_only Texture3DSampled* %222 = OpVariable UniformConstant 
                              Private f32_4* %227 = OpVariable Private 
                                         u32 %233 = OpConstant 3 
                              Private f32_3* %235 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %248 = OpVariable UniformConstant 
                                         i32 %260 = OpConstant 6 
                                Private f32* %265 = OpVariable Private 
                                Input f32_3* %266 = OpVariable Input 
                                             %276 = OpTypePointer Output %14 
                               Output f32_4* %277 = OpVariable Output 
                                             %286 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %173 = OpVariable Function 
                                        f32_3 %12 = OpLoad %11 
                                        f32_3 %13 = OpFNegate %12 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFAdd %13 %27 
                                                      OpStore %9 %28 
                                        f32_3 %31 = OpLoad %9 
                                        f32_3 %32 = OpLoad %9 
                                          f32 %33 = OpDot %31 %32 
                                                      OpStore %30 %33 
                                          f32 %34 = OpLoad %30 
                                          f32 %35 = OpExtInst %1 32 %34 
                                                      OpStore %30 %35 
                                          f32 %36 = OpLoad %30 
                                        f32_3 %37 = OpCompositeConstruct %36 %36 %36 
                                        f32_3 %38 = OpLoad %9 
                                        f32_3 %39 = OpFMul %37 %38 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %46 = OpLoad %45 
                                        f32_2 %50 = OpLoad %49 
                                        f32_4 %51 = OpImageSampleImplicitLod %46 %50 
                                                      OpStore %41 %51 
                                 Uniform f32* %54 = OpAccessChain %21 %52 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %57 = OpAccessChain %21 %56 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpFMul %55 %58 
                                                      OpStore %30 %59 
                                          f32 %60 = OpLoad %30 
                                          f32 %61 = OpFNegate %60 
                                          f32 %63 = OpFMul %61 %62 
                                   Input f32* %67 = OpAccessChain %64 %65 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpFAdd %63 %68 
                                                      OpStore %30 %69 
                                          f32 %73 = OpLoad %30 
                                         bool %75 = OpFOrdLessThan %73 %74 
                                                      OpStore %72 %75 
                                         bool %76 = OpLoad %72 
                                          i32 %78 = OpSelect %76 %77 %23 
                                          i32 %80 = OpIMul %78 %79 
                                         bool %81 = OpINotEqual %80 %23 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %83 
                                              %82 = OpLabel 
                                                      OpKill
                                              %83 = OpLabel 
                                        f32_3 %86 = OpLoad %11 
                                        f32_3 %87 = OpVectorShuffle %86 %86 1 1 1 
                               Uniform f32_4* %89 = OpAccessChain %21 %88 %77 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_3 %92 = OpFMul %87 %91 
                                                      OpStore %85 %92 
                               Uniform f32_4* %93 = OpAccessChain %21 %88 %23 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpLoad %11 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 0 0 
                                        f32_3 %98 = OpFMul %95 %97 
                                        f32_3 %99 = OpLoad %85 
                                       f32_3 %100 = OpFAdd %98 %99 
                                                      OpStore %85 %100 
                              Uniform f32_4* %102 = OpAccessChain %21 %88 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpLoad %11 
                                       f32_3 %106 = OpVectorShuffle %105 %105 2 2 2 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_3 %108 = OpLoad %85 
                                       f32_3 %109 = OpFAdd %107 %108 
                                                      OpStore %85 %109 
                                       f32_3 %110 = OpLoad %85 
                              Uniform f32_4* %112 = OpAccessChain %21 %88 %111 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpFAdd %110 %114 
                                                      OpStore %85 %115 
                                Uniform f32* %117 = OpAccessChain %21 %101 %116 
                                         f32 %118 = OpLoad %117 
                                        bool %120 = OpFOrdEqual %118 %119 
                                                      OpStore %72 %120 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %123 
                                             %122 = OpLabel 
                                        bool %124 = OpLoad %72 
                                                      OpSelectionMerge %126 None 
                                                      OpBranchConditional %124 %125 %126 
                                             %125 = OpLabel 
                                                      OpBranch %126 
                                             %126 = OpLabel 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %229 
                                             %128 = OpLabel 
                                Uniform f32* %130 = OpAccessChain %21 %101 %65 
                                         f32 %131 = OpLoad %130 
                                        bool %132 = OpFOrdEqual %131 %119 
                                                      OpStore %72 %132 
                                       f32_3 %134 = OpLoad %11 
                                       f32_3 %135 = OpVectorShuffle %134 %134 1 1 1 
                              Uniform f32_4* %136 = OpAccessChain %21 %111 %77 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFMul %135 %138 
                                       f32_4 %140 = OpLoad %133 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
                                                      OpStore %133 %141 
                              Uniform f32_4* %142 = OpAccessChain %21 %111 %23 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpLoad %11 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 0 0 
                                       f32_3 %147 = OpFMul %144 %146 
                                       f32_4 %148 = OpLoad %133 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                       f32_3 %150 = OpFAdd %147 %149 
                                       f32_4 %151 = OpLoad %133 
                                       f32_4 %152 = OpVectorShuffle %151 %150 4 5 6 3 
                                                      OpStore %133 %152 
                              Uniform f32_4* %153 = OpAccessChain %21 %111 %101 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpLoad %11 
                                       f32_3 %157 = OpVectorShuffle %156 %156 2 2 2 
                                       f32_3 %158 = OpFMul %155 %157 
                                       f32_4 %159 = OpLoad %133 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_3 %161 = OpFAdd %158 %160 
                                       f32_4 %162 = OpLoad %133 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %133 %163 
                                       f32_4 %164 = OpLoad %133 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %21 %111 %111 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %133 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 6 3 
                                                      OpStore %133 %171 
                                        bool %174 = OpLoad %72 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %179 
                                             %175 = OpLabel 
                                       f32_4 %177 = OpLoad %133 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                                      OpStore %173 %178 
                                                      OpBranch %176 
                                             %179 = OpLabel 
                                       f32_3 %180 = OpLoad %11 
                                                      OpStore %173 %180 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_3 %181 = OpLoad %173 
                                       f32_4 %182 = OpLoad %133 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %133 %183 
                                       f32_4 %184 = OpLoad %133 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                              Uniform f32_3* %188 = OpAccessChain %21 %186 
                                       f32_3 %189 = OpLoad %188 
                                       f32_3 %190 = OpFNegate %189 
                                       f32_3 %191 = OpFAdd %185 %190 
                                       f32_4 %192 = OpLoad %133 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 6 3 
                                                      OpStore %133 %193 
                                       f32_4 %194 = OpLoad %133 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
                              Uniform f32_3* %197 = OpAccessChain %21 %196 
                                       f32_3 %198 = OpLoad %197 
                                       f32_3 %199 = OpFMul %195 %198 
                                       f32_4 %200 = OpLoad %133 
                                       f32_4 %201 = OpVectorShuffle %200 %199 0 4 5 6 
                                                      OpStore %133 %201 
                                Private f32* %202 = OpAccessChain %133 %65 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %207 = OpFAdd %205 %206 
                                                      OpStore %30 %207 
                                Uniform f32* %210 = OpAccessChain %21 %101 %209 
                                         f32 %211 = OpLoad %210 
                                         f32 %213 = OpFMul %211 %212 
                                         f32 %214 = OpFAdd %213 %206 
                                                      OpStore %208 %214 
                                         f32 %215 = OpLoad %30 
                                         f32 %216 = OpLoad %208 
                                         f32 %217 = OpExtInst %1 40 %215 %216 
                                Private f32* %218 = OpAccessChain %133 %116 
                                                      OpStore %218 %217 
                  read_only Texture3DSampled %223 = OpLoad %222 
                                       f32_4 %224 = OpLoad %133 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 2 3 
                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                                      OpStore %133 %226 
                                       f32_4 %228 = OpLoad %133 
                                                      OpStore %227 %228 
                                                      OpBranch %129 
                                             %229 = OpLabel 
                                Private f32* %230 = OpAccessChain %227 %116 
                                                      OpStore %230 %119 
                                Private f32* %231 = OpAccessChain %227 %65 
                                                      OpStore %231 %119 
                                Private f32* %232 = OpAccessChain %227 %209 
                                                      OpStore %232 %119 
                                Private f32* %234 = OpAccessChain %227 %233 
                                                      OpStore %234 %119 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                       f32_4 %236 = OpLoad %227 
                              Uniform f32_4* %237 = OpAccessChain %21 %77 
                                       f32_4 %238 = OpLoad %237 
                                         f32 %239 = OpDot %236 %238 
                                Private f32* %240 = OpAccessChain %235 %116 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %235 %116 
                                         f32 %242 = OpLoad %241 
                                         f32 %243 = OpExtInst %1 43 %242 %74 %119 
                                Private f32* %244 = OpAccessChain %235 %116 
                                                      OpStore %244 %243 
                                       f32_3 %245 = OpLoad %85 
                                       f32_3 %246 = OpLoad %85 
                                         f32 %247 = OpDot %245 %246 
                                                      OpStore %30 %247 
                  read_only Texture2DSampled %249 = OpLoad %248 
                                         f32 %250 = OpLoad %30 
                                       f32_2 %251 = OpCompositeConstruct %250 %250 
                                       f32_4 %252 = OpImageSampleImplicitLod %249 %251 
                                         f32 %253 = OpCompositeExtract %252 3 
                                                      OpStore %30 %253 
                                Private f32* %254 = OpAccessChain %235 %116 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpLoad %30 
                                         f32 %257 = OpFMul %255 %256 
                                                      OpStore %30 %257 
                                         f32 %258 = OpLoad %30 
                                       f32_3 %259 = OpCompositeConstruct %258 %258 %258 
                              Uniform f32_4* %261 = OpAccessChain %21 %260 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpFMul %259 %263 
                                                      OpStore %235 %264 
                                       f32_3 %267 = OpLoad %266 
                                       f32_3 %268 = OpLoad %9 
                                         f32 %269 = OpDot %267 %268 
                                                      OpStore %265 %269 
                                         f32 %270 = OpLoad %265 
                                         f32 %271 = OpExtInst %1 40 %270 %74 
                                                      OpStore %265 %271 
                                       f32_4 %272 = OpLoad %41 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %274 = OpLoad %235 
                                       f32_3 %275 = OpFMul %273 %274 
                                                      OpStore %235 %275 
                                         f32 %278 = OpLoad %265 
                                       f32_3 %279 = OpCompositeConstruct %278 %278 %278 
                                       f32_3 %280 = OpLoad %235 
                                       f32_3 %281 = OpFMul %279 %280 
                                       f32_4 %282 = OpLoad %277 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 6 3 
                                                      OpStore %277 %283 
                                Private f32* %284 = OpAccessChain %41 %233 
                                         f32 %285 = OpLoad %284 
                                 Output f32* %287 = OpAccessChain %277 %233 
                                                      OpStore %287 %285 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "DUMMY" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = _PixelHeight * _Threshold;
    u_xlat1.x = (-u_xlat1.x) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "DUMMY" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 150
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %133 %139 %142 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %142 Location 142 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                         u32 %109 = OpConstant 2 
                                             %110 = OpTypePointer Uniform %6 
                                         u32 %114 = OpConstant 0 
                                             %115 = OpTypePointer Private %6 
                                Private f32* %125 = OpVariable Private 
                               Output f32_3* %133 = OpVariable Output 
                               Output f32_4* %139 = OpVariable Output 
                                         f32 %140 = OpConstant 3.67402E-40 
                                       f32_4 %141 = OpConstantComposite %140 %140 %140 %140 
                               Output f32_3* %142 = OpVariable Output 
                                       f32_3 %143 = OpConstantComposite %140 %140 %140 
                                             %144 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %36 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %36 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %86 = OpAccessChain %21 %36 %46 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %44 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %23 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %100 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %46 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %97 %108 
                                Uniform f32* %111 = OpAccessChain %21 %24 %23 %109 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpFNegate %112 
                                Private f32* %116 = OpAccessChain %9 %114 
                                                      OpStore %116 %113 
                                Uniform f32* %117 = OpAccessChain %21 %24 %24 %109 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                Private f32* %120 = OpAccessChain %9 %81 
                                                      OpStore %120 %119 
                                Uniform f32* %121 = OpAccessChain %21 %24 %36 %109 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                Private f32* %124 = OpAccessChain %9 %109 
                                                      OpStore %124 %123 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                         f32 %130 = OpDot %127 %129 
                                                      OpStore %125 %130 
                                         f32 %131 = OpLoad %125 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %125 %132 
                                         f32 %134 = OpLoad %125 
                                       f32_3 %135 = OpCompositeConstruct %134 %134 %134 
                                       f32_4 %136 = OpLoad %9 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpFMul %135 %137 
                                                      OpStore %133 %138 
                                                      OpStore %139 %141 
                                                      OpStore %142 %143 
                                 Output f32* %145 = OpAccessChain %85 %23 %81 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFNegate %146 
                                 Output f32* %148 = OpAccessChain %85 %23 %81 
                                                      OpStore %148 %147 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 226
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %46 %89 %201 %214 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpMemberDecorate %25 0 RelaxedPrecision 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpMemberDecorate %25 1 RelaxedPrecision 
                                                      OpMemberDecorate %25 1 Offset 25 
                                                      OpMemberDecorate %25 2 Offset 25 
                                                      OpMemberDecorate %25 3 Offset 25 
                                                      OpMemberDecorate %25 4 Offset 25 
                                                      OpMemberDecorate %25 5 Offset 25 
                                                      OpMemberDecorate %25 6 RelaxedPrecision 
                                                      OpMemberDecorate %25 6 Offset 25 
                                                      OpMemberDecorate %25 7 Offset 25 
                                                      OpMemberDecorate %25 8 Offset 25 
                                                      OpDecorate %25 Block 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %170 DescriptorSet 170 
                                                      OpDecorate %170 Binding 170 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 Location 201 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %214 Location 214 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeVector %6 3 
                                              %25 = OpTypeStruct %7 %7 %7 %23 %24 %24 %7 %6 %6 
                                              %26 = OpTypePointer Uniform %25 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 8 
                                              %30 = OpTypePointer Uniform %6 
                                          i32 %33 = OpConstant 7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %24 
                                 Input f32_3* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %58 = OpConstant 3.67402E-40 
                                          i32 %61 = OpConstant 0 
                                          i32 %62 = OpConstant 1 
                                          i32 %64 = OpConstant -1 
                                          i32 %70 = OpConstant 2 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                              %87 = OpTypePointer Private %24 
                               Private f32_3* %88 = OpVariable Private 
                                 Input f32_3* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 3 
                                              %93 = OpTypePointer Uniform %7 
                                             %119 = OpTypePointer Function %24 
                                         i32 %132 = OpConstant 5 
                                             %133 = OpTypePointer Uniform %24 
                                         i32 %142 = OpConstant 4 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                Private f32* %155 = OpVariable Private 
                                         u32 %156 = OpConstant 2 
                                         f32 %159 = OpConstant 3.67402E-40 
                                             %167 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %168 = OpTypeSampledImage %167 
                                             %169 = OpTypePointer UniformConstant %168 
 UniformConstant read_only Texture3DSampled* %170 = OpVariable UniformConstant 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %181 = OpConstant 3 
                              Private f32_3* %183 = OpVariable Private 
                                         i32 %195 = OpConstant 6 
                                Private f32* %200 = OpVariable Private 
                                Input f32_3* %201 = OpVariable Input 
                                             %213 = OpTypePointer Output %7 
                               Output f32_4* %214 = OpVariable Output 
                                             %223 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %120 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %31 = OpAccessChain %27 %29 
                                          f32 %32 = OpLoad %31 
                                 Uniform f32* %34 = OpAccessChain %27 %33 
                                          f32 %35 = OpLoad %34 
                                          f32 %36 = OpFMul %32 %35 
                                 Private f32* %39 = OpAccessChain %20 %37 
                                                      OpStore %39 %36 
                                 Private f32* %40 = OpAccessChain %20 %37 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFMul %42 %43 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %44 %50 
                                 Private f32* %52 = OpAccessChain %20 %37 
                                                      OpStore %52 %51 
                                 Private f32* %56 = OpAccessChain %20 %37 
                                          f32 %57 = OpLoad %56 
                                         bool %59 = OpFOrdLessThan %57 %58 
                                                      OpStore %55 %59 
                                         bool %60 = OpLoad %55 
                                          i32 %63 = OpSelect %60 %62 %61 
                                          i32 %65 = OpIMul %63 %64 
                                         bool %66 = OpINotEqual %65 %61 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %68 
                                              %67 = OpLabel 
                                                      OpKill
                                              %68 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %27 %70 %37 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %55 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %55 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %177 
                                              %82 = OpLabel 
                                 Uniform f32* %84 = OpAccessChain %27 %70 %47 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdEqual %85 %73 
                                                      OpStore %55 %86 
                                        f32_3 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 1 1 1 
                               Uniform f32_4* %94 = OpAccessChain %27 %92 %62 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFMul %91 %96 
                                                      OpStore %88 %97 
                               Uniform f32_4* %98 = OpAccessChain %27 %92 %61 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpLoad %89 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_3 %104 = OpLoad %88 
                                       f32_3 %105 = OpFAdd %103 %104 
                                                      OpStore %88 %105 
                              Uniform f32_4* %106 = OpAccessChain %27 %92 %70 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpLoad %89 
                                       f32_3 %110 = OpVectorShuffle %109 %109 2 2 2 
                                       f32_3 %111 = OpFMul %108 %110 
                                       f32_3 %112 = OpLoad %88 
                                       f32_3 %113 = OpFAdd %111 %112 
                                                      OpStore %88 %113 
                                       f32_3 %114 = OpLoad %88 
                              Uniform f32_4* %115 = OpAccessChain %27 %92 %92 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                                      OpStore %88 %118 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %125 
                                             %122 = OpLabel 
                                       f32_3 %124 = OpLoad %88 
                                                      OpStore %120 %124 
                                                      OpBranch %123 
                                             %125 = OpLabel 
                                       f32_3 %126 = OpLoad %89 
                                                      OpStore %120 %126 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_3 %127 = OpLoad %120 
                                       f32_4 %128 = OpLoad %20 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %20 %129 
                                       f32_4 %130 = OpLoad %20 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %27 %132 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFNegate %135 
                                       f32_3 %137 = OpFAdd %131 %136 
                                       f32_4 %138 = OpLoad %20 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %20 %139 
                                       f32_4 %140 = OpLoad %20 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %27 %142 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %141 %144 
                                       f32_4 %146 = OpLoad %20 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %20 %147 
                                Private f32* %148 = OpAccessChain %20 %47 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %88 %37 
                                                      OpStore %154 %153 
                                Uniform f32* %157 = OpAccessChain %27 %70 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                         f32 %161 = OpFAdd %160 %152 
                                                      OpStore %155 %161 
                                Private f32* %162 = OpAccessChain %88 %37 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpLoad %155 
                                         f32 %165 = OpExtInst %1 40 %163 %164 
                                Private f32* %166 = OpAccessChain %20 %37 
                                                      OpStore %166 %165 
                  read_only Texture3DSampled %171 = OpLoad %170 
                                       f32_4 %172 = OpLoad %20 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 2 3 
                                       f32_4 %174 = OpImageSampleImplicitLod %171 %173 
                                                      OpStore %20 %174 
                                       f32_4 %176 = OpLoad %20 
                                                      OpStore %175 %176 
                                                      OpBranch %83 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %175 %37 
                                                      OpStore %178 %73 
                                Private f32* %179 = OpAccessChain %175 %47 
                                                      OpStore %179 %73 
                                Private f32* %180 = OpAccessChain %175 %156 
                                                      OpStore %180 %73 
                                Private f32* %182 = OpAccessChain %175 %181 
                                                      OpStore %182 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %184 = OpLoad %175 
                              Uniform f32_4* %185 = OpAccessChain %27 %62 
                                       f32_4 %186 = OpLoad %185 
                                         f32 %187 = OpDot %184 %186 
                                Private f32* %188 = OpAccessChain %183 %37 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %183 %37 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpExtInst %1 43 %190 %58 %73 
                                Private f32* %192 = OpAccessChain %183 %37 
                                                      OpStore %192 %191 
                                       f32_3 %193 = OpLoad %183 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                              Uniform f32_4* %196 = OpAccessChain %27 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFMul %194 %198 
                                                      OpStore %183 %199 
                                       f32_3 %202 = OpLoad %201 
                              Uniform f32_4* %203 = OpAccessChain %27 %61 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                         f32 %206 = OpDot %202 %205 
                                                      OpStore %200 %206 
                                         f32 %207 = OpLoad %200 
                                         f32 %208 = OpExtInst %1 40 %207 %58 
                                                      OpStore %200 %208 
                                       f32_4 %209 = OpLoad %9 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpLoad %183 
                                       f32_3 %212 = OpFMul %210 %211 
                                                      OpStore %183 %212 
                                         f32 %215 = OpLoad %200 
                                       f32_3 %216 = OpCompositeConstruct %215 %215 %215 
                                       f32_3 %217 = OpLoad %183 
                                       f32_3 %218 = OpFMul %216 %217 
                                       f32_4 %219 = OpLoad %214 
                                       f32_4 %220 = OpVectorShuffle %219 %218 4 5 6 3 
                                                      OpStore %214 %220 
                                Private f32* %221 = OpAccessChain %9 %181 
                                         f32 %222 = OpLoad %221 
                                 Output f32* %224 = OpAccessChain %214 %181 
                                                      OpStore %224 %222 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "DUMMY" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec2 u_xlat8;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat15 = _PixelHeight * _Threshold;
    u_xlat15 = (-u_xlat15) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb15 = u_xlat15<0.0;
    if((int(u_xlatb15) * int(0xffffffffu))!=0){discard;}
    u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb15){
        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb15)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat15 = u_xlat3.y * 0.25 + 0.75;
        u_xlat8.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat15, u_xlat8.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat15 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlatb3 = 0.0<u_xlat2.z;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat8.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
    u_xlat10_4 = texture(_LightTexture0, u_xlat8.xy);
    u_xlat17 = u_xlat3.x * u_xlat10_4.w;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_3 = texture(_LightTextureB0, u_xlat2.xx);
    u_xlat2.x = u_xlat17 * u_xlat10_3.w;
    u_xlat15 = u_xlat15 * u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat15) * _LightColor0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat5.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SPOT" "DUMMY" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 150
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %133 %139 %142 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %142 Location 142 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                         u32 %109 = OpConstant 2 
                                             %110 = OpTypePointer Uniform %6 
                                         u32 %114 = OpConstant 0 
                                             %115 = OpTypePointer Private %6 
                                Private f32* %125 = OpVariable Private 
                               Output f32_3* %133 = OpVariable Output 
                               Output f32_4* %139 = OpVariable Output 
                                         f32 %140 = OpConstant 3.67402E-40 
                                       f32_4 %141 = OpConstantComposite %140 %140 %140 %140 
                               Output f32_3* %142 = OpVariable Output 
                                       f32_3 %143 = OpConstantComposite %140 %140 %140 
                                             %144 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %36 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %36 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %86 = OpAccessChain %21 %36 %46 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %44 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %23 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %100 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %46 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %97 %108 
                                Uniform f32* %111 = OpAccessChain %21 %24 %23 %109 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpFNegate %112 
                                Private f32* %116 = OpAccessChain %9 %114 
                                                      OpStore %116 %113 
                                Uniform f32* %117 = OpAccessChain %21 %24 %24 %109 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                Private f32* %120 = OpAccessChain %9 %81 
                                                      OpStore %120 %119 
                                Uniform f32* %121 = OpAccessChain %21 %24 %36 %109 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                Private f32* %124 = OpAccessChain %9 %109 
                                                      OpStore %124 %123 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                         f32 %130 = OpDot %127 %129 
                                                      OpStore %125 %130 
                                         f32 %131 = OpLoad %125 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %125 %132 
                                         f32 %134 = OpLoad %125 
                                       f32_3 %135 = OpCompositeConstruct %134 %134 %134 
                                       f32_4 %136 = OpLoad %9 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpFMul %135 %137 
                                                      OpStore %133 %138 
                                                      OpStore %139 %141 
                                                      OpStore %142 %143 
                                 Output f32* %145 = OpAccessChain %85 %23 %81 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFNegate %146 
                                 Output f32* %148 = OpAccessChain %85 %23 %81 
                                                      OpStore %148 %147 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 320
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %49 %64 %297 %308 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 Location 49 
                                                      OpDecorate %64 Location 64 
                                                      OpDecorate %123 SpecId 123 
                                                      OpDecorate %218 DescriptorSet 218 
                                                      OpDecorate %218 Binding 218 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %262 DescriptorSet 262 
                                                      OpDecorate %262 Binding 262 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %275 DescriptorSet 275 
                                                      OpDecorate %275 Binding 275 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 Location 297 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %308 Location 308 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_3* %11 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %14 %16 
                                              %18 = OpTypeArray %14 %16 
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %14 
                                              %29 = OpTypePointer Private %6 
                                 Private f32* %30 = OpVariable Private 
                                              %40 = OpTypePointer Private %14 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %43 = OpTypeSampledImage %42 
                                              %44 = OpTypePointer UniformConstant %43 
  UniformConstant read_only Texture2DSampled* %45 = OpVariable UniformConstant 
                                              %47 = OpTypeVector %6 2 
                                              %48 = OpTypePointer Input %47 
                                 Input f32_2* %49 = OpVariable Input 
                                          i32 %52 = OpConstant 9 
                                              %53 = OpTypePointer Uniform %6 
                                          i32 %56 = OpConstant 8 
                                          f32 %62 = OpConstant 3.67402E-40 
                                 Input f32_3* %64 = OpVariable Input 
                                          u32 %65 = OpConstant 1 
                                              %66 = OpTypePointer Input %6 
                                              %70 = OpTypeBool 
                                              %71 = OpTypePointer Private %70 
                                Private bool* %72 = OpVariable Private 
                                          f32 %74 = OpConstant 3.67402E-40 
                                          i32 %77 = OpConstant 1 
                                          i32 %79 = OpConstant -1 
                               Private f32_4* %85 = OpVariable Private 
                                          i32 %88 = OpConstant 7 
                                          i32 %99 = OpConstant 2 
                                         i32 %108 = OpConstant 3 
                                         u32 %112 = OpConstant 0 
                                         f32 %115 = OpConstant 3.67402E-40 
                                        bool %117 = OpConstantFalse 
                                        bool %123 = OpSpecConstantFalse 
                              Private f32_4* %129 = OpVariable Private 
                                             %168 = OpTypePointer Function %7 
                                         i32 %182 = OpConstant 5 
                                             %183 = OpTypePointer Uniform %7 
                                         i32 %192 = OpConstant 4 
                                         f32 %200 = OpConstant 3.67402E-40 
                                         f32 %202 = OpConstant 3.67402E-40 
                                Private f32* %204 = OpVariable Private 
                                         u32 %205 = OpConstant 2 
                                         f32 %208 = OpConstant 3.67402E-40 
                                             %215 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %216 = OpTypeSampledImage %215 
                                             %217 = OpTypePointer UniformConstant %216 
 UniformConstant read_only Texture3DSampled* %218 = OpVariable UniformConstant 
                              Private f32_4* %223 = OpVariable Private 
                                         u32 %229 = OpConstant 3 
                              Private f32_3* %231 = OpVariable Private 
                                Private f32* %244 = OpVariable Private 
                                             %245 = OpTypePointer Function %6 
                                             %252 = OpTypePointer Private %47 
                              Private f32_2* %253 = OpVariable Private 
                                       f32_2 %260 = OpConstantComposite %208 %208 
 UniformConstant read_only Texture2DSampled* %262 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %275 = OpVariable UniformConstant 
                                         i32 %291 = OpConstant 6 
                                Private f32* %296 = OpVariable Private 
                                Input f32_3* %297 = OpVariable Input 
                                             %307 = OpTypePointer Output %14 
                               Output f32_4* %308 = OpVariable Output 
                                             %317 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %169 = OpVariable Function 
                               Function f32* %246 = OpVariable Function 
                                        f32_3 %12 = OpLoad %11 
                                        f32_3 %13 = OpFNegate %12 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFAdd %13 %27 
                                                      OpStore %9 %28 
                                        f32_3 %31 = OpLoad %9 
                                        f32_3 %32 = OpLoad %9 
                                          f32 %33 = OpDot %31 %32 
                                                      OpStore %30 %33 
                                          f32 %34 = OpLoad %30 
                                          f32 %35 = OpExtInst %1 32 %34 
                                                      OpStore %30 %35 
                                          f32 %36 = OpLoad %30 
                                        f32_3 %37 = OpCompositeConstruct %36 %36 %36 
                                        f32_3 %38 = OpLoad %9 
                                        f32_3 %39 = OpFMul %37 %38 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %46 = OpLoad %45 
                                        f32_2 %50 = OpLoad %49 
                                        f32_4 %51 = OpImageSampleImplicitLod %46 %50 
                                                      OpStore %41 %51 
                                 Uniform f32* %54 = OpAccessChain %21 %52 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %57 = OpAccessChain %21 %56 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpFMul %55 %58 
                                                      OpStore %30 %59 
                                          f32 %60 = OpLoad %30 
                                          f32 %61 = OpFNegate %60 
                                          f32 %63 = OpFMul %61 %62 
                                   Input f32* %67 = OpAccessChain %64 %65 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpFAdd %63 %68 
                                                      OpStore %30 %69 
                                          f32 %73 = OpLoad %30 
                                         bool %75 = OpFOrdLessThan %73 %74 
                                                      OpStore %72 %75 
                                         bool %76 = OpLoad %72 
                                          i32 %78 = OpSelect %76 %77 %23 
                                          i32 %80 = OpIMul %78 %79 
                                         bool %81 = OpINotEqual %80 %23 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %83 
                                              %82 = OpLabel 
                                                      OpKill
                                              %83 = OpLabel 
                                        f32_3 %86 = OpLoad %11 
                                        f32_4 %87 = OpVectorShuffle %86 %86 1 1 1 1 
                               Uniform f32_4* %89 = OpAccessChain %21 %88 %77 
                                        f32_4 %90 = OpLoad %89 
                                        f32_4 %91 = OpFMul %87 %90 
                                                      OpStore %85 %91 
                               Uniform f32_4* %92 = OpAccessChain %21 %88 %23 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpLoad %11 
                                        f32_4 %95 = OpVectorShuffle %94 %94 0 0 0 0 
                                        f32_4 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %85 
                                        f32_4 %98 = OpFAdd %96 %97 
                                                      OpStore %85 %98 
                              Uniform f32_4* %100 = OpAccessChain %21 %88 %99 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpLoad %11 
                                       f32_4 %103 = OpVectorShuffle %102 %102 2 2 2 2 
                                       f32_4 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %85 
                                       f32_4 %106 = OpFAdd %104 %105 
                                                      OpStore %85 %106 
                                       f32_4 %107 = OpLoad %85 
                              Uniform f32_4* %109 = OpAccessChain %21 %88 %108 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpFAdd %107 %110 
                                                      OpStore %85 %111 
                                Uniform f32* %113 = OpAccessChain %21 %99 %112 
                                         f32 %114 = OpLoad %113 
                                        bool %116 = OpFOrdEqual %114 %115 
                                                      OpStore %72 %116 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                        bool %120 = OpLoad %72 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %122 
                                             %121 = OpLabel 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %123 %124 %225 
                                             %124 = OpLabel 
                                Uniform f32* %126 = OpAccessChain %21 %99 %65 
                                         f32 %127 = OpLoad %126 
                                        bool %128 = OpFOrdEqual %127 %115 
                                                      OpStore %72 %128 
                                       f32_3 %130 = OpLoad %11 
                                       f32_3 %131 = OpVectorShuffle %130 %130 1 1 1 
                              Uniform f32_4* %132 = OpAccessChain %21 %108 %77 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFMul %131 %134 
                                       f32_4 %136 = OpLoad %129 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                      OpStore %129 %137 
                              Uniform f32_4* %138 = OpAccessChain %21 %108 %23 
                                       f32_4 %139 = OpLoad %138 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpLoad %11 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 0 0 
                                       f32_3 %143 = OpFMul %140 %142 
                                       f32_4 %144 = OpLoad %129 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_3 %146 = OpFAdd %143 %145 
                                       f32_4 %147 = OpLoad %129 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %129 %148 
                              Uniform f32_4* %149 = OpAccessChain %21 %108 %99 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpLoad %11 
                                       f32_3 %153 = OpVectorShuffle %152 %152 2 2 2 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_4 %155 = OpLoad %129 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                       f32_3 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %129 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 6 3 
                                                      OpStore %129 %159 
                                       f32_4 %160 = OpLoad %129 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                              Uniform f32_4* %162 = OpAccessChain %21 %108 %108 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFAdd %161 %164 
                                       f32_4 %166 = OpLoad %129 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %129 %167 
                                        bool %170 = OpLoad %72 
                                                      OpSelectionMerge %172 None 
                                                      OpBranchConditional %170 %171 %175 
                                             %171 = OpLabel 
                                       f32_4 %173 = OpLoad %129 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                                      OpStore %169 %174 
                                                      OpBranch %172 
                                             %175 = OpLabel 
                                       f32_3 %176 = OpLoad %11 
                                                      OpStore %169 %176 
                                                      OpBranch %172 
                                             %172 = OpLabel 
                                       f32_3 %177 = OpLoad %169 
                                       f32_4 %178 = OpLoad %129 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 6 3 
                                                      OpStore %129 %179 
                                       f32_4 %180 = OpLoad %129 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                              Uniform f32_3* %184 = OpAccessChain %21 %182 
                                       f32_3 %185 = OpLoad %184 
                                       f32_3 %186 = OpFNegate %185 
                                       f32_3 %187 = OpFAdd %181 %186 
                                       f32_4 %188 = OpLoad %129 
                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
                                                      OpStore %129 %189 
                                       f32_4 %190 = OpLoad %129 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                              Uniform f32_3* %193 = OpAccessChain %21 %192 
                                       f32_3 %194 = OpLoad %193 
                                       f32_3 %195 = OpFMul %191 %194 
                                       f32_4 %196 = OpLoad %129 
                                       f32_4 %197 = OpVectorShuffle %196 %195 0 4 5 6 
                                                      OpStore %129 %197 
                                Private f32* %198 = OpAccessChain %129 %65 
                                         f32 %199 = OpLoad %198 
                                         f32 %201 = OpFMul %199 %200 
                                         f32 %203 = OpFAdd %201 %202 
                                                      OpStore %30 %203 
                                Uniform f32* %206 = OpAccessChain %21 %99 %205 
                                         f32 %207 = OpLoad %206 
                                         f32 %209 = OpFMul %207 %208 
                                         f32 %210 = OpFAdd %209 %202 
                                                      OpStore %204 %210 
                                         f32 %211 = OpLoad %30 
                                         f32 %212 = OpLoad %204 
                                         f32 %213 = OpExtInst %1 40 %211 %212 
                                Private f32* %214 = OpAccessChain %129 %112 
                                                      OpStore %214 %213 
                  read_only Texture3DSampled %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %129 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 2 3 
                                       f32_4 %222 = OpImageSampleImplicitLod %219 %221 
                                                      OpStore %129 %222 
                                       f32_4 %224 = OpLoad %129 
                                                      OpStore %223 %224 
                                                      OpBranch %125 
                                             %225 = OpLabel 
                                Private f32* %226 = OpAccessChain %223 %112 
                                                      OpStore %226 %115 
                                Private f32* %227 = OpAccessChain %223 %65 
                                                      OpStore %227 %115 
                                Private f32* %228 = OpAccessChain %223 %205 
                                                      OpStore %228 %115 
                                Private f32* %230 = OpAccessChain %223 %229 
                                                      OpStore %230 %115 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_4 %232 = OpLoad %223 
                              Uniform f32_4* %233 = OpAccessChain %21 %77 
                                       f32_4 %234 = OpLoad %233 
                                         f32 %235 = OpDot %232 %234 
                                Private f32* %236 = OpAccessChain %231 %112 
                                                      OpStore %236 %235 
                                Private f32* %237 = OpAccessChain %231 %112 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpExtInst %1 43 %238 %74 %115 
                                Private f32* %240 = OpAccessChain %231 %112 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %85 %205 
                                         f32 %242 = OpLoad %241 
                                        bool %243 = OpFOrdLessThan %74 %242 
                                                      OpStore %72 %243 
                                        bool %247 = OpLoad %72 
                                                      OpSelectionMerge %249 None 
                                                      OpBranchConditional %247 %248 %250 
                                             %248 = OpLabel 
                                                      OpStore %246 %115 
                                                      OpBranch %249 
                                             %250 = OpLabel 
                                                      OpStore %246 %74 
                                                      OpBranch %249 
                                             %249 = OpLabel 
                                         f32 %251 = OpLoad %246 
                                                      OpStore %244 %251 
                                       f32_4 %254 = OpLoad %85 
                                       f32_2 %255 = OpVectorShuffle %254 %254 0 1 
                                       f32_4 %256 = OpLoad %85 
                                       f32_2 %257 = OpVectorShuffle %256 %256 3 3 
                                       f32_2 %258 = OpFDiv %255 %257 
                                                      OpStore %253 %258 
                                       f32_2 %259 = OpLoad %253 
                                       f32_2 %261 = OpFAdd %259 %260 
                                                      OpStore %253 %261 
                  read_only Texture2DSampled %263 = OpLoad %262 
                                       f32_2 %264 = OpLoad %253 
                                       f32_4 %265 = OpImageSampleImplicitLod %263 %264 
                                         f32 %266 = OpCompositeExtract %265 3 
                                                      OpStore %30 %266 
                                         f32 %267 = OpLoad %30 
                                         f32 %268 = OpLoad %244 
                                         f32 %269 = OpFMul %267 %268 
                                                      OpStore %244 %269 
                                       f32_4 %270 = OpLoad %85 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                       f32_4 %272 = OpLoad %85 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                         f32 %274 = OpDot %271 %273 
                                                      OpStore %30 %274 
                  read_only Texture2DSampled %276 = OpLoad %275 
                                         f32 %277 = OpLoad %30 
                                       f32_2 %278 = OpCompositeConstruct %277 %277 
                                       f32_4 %279 = OpImageSampleImplicitLod %276 %278 
                                         f32 %280 = OpCompositeExtract %279 3 
                                                      OpStore %30 %280 
                                         f32 %281 = OpLoad %30 
                                         f32 %282 = OpLoad %244 
                                         f32 %283 = OpFMul %281 %282 
                                                      OpStore %244 %283 
                                Private f32* %284 = OpAccessChain %231 %112 
                                         f32 %285 = OpLoad %284 
                                         f32 %286 = OpLoad %244 
                                         f32 %287 = OpFMul %285 %286 
                                Private f32* %288 = OpAccessChain %231 %112 
                                                      OpStore %288 %287 
                                       f32_3 %289 = OpLoad %231 
                                       f32_3 %290 = OpVectorShuffle %289 %289 0 0 0 
                              Uniform f32_4* %292 = OpAccessChain %21 %291 
                                       f32_4 %293 = OpLoad %292 
                                       f32_3 %294 = OpVectorShuffle %293 %293 0 1 2 
                                       f32_3 %295 = OpFMul %290 %294 
                                                      OpStore %231 %295 
                                       f32_3 %298 = OpLoad %297 
                                       f32_3 %299 = OpLoad %9 
                                         f32 %300 = OpDot %298 %299 
                                                      OpStore %296 %300 
                                         f32 %301 = OpLoad %296 
                                         f32 %302 = OpExtInst %1 40 %301 %74 
                                                      OpStore %296 %302 
                                       f32_4 %303 = OpLoad %41 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 1 2 
                                       f32_3 %305 = OpLoad %231 
                                       f32_3 %306 = OpFMul %304 %305 
                                                      OpStore %231 %306 
                                         f32 %309 = OpLoad %296 
                                       f32_3 %310 = OpCompositeConstruct %309 %309 %309 
                                       f32_3 %311 = OpLoad %231 
                                       f32_3 %312 = OpFMul %310 %311 
                                       f32_4 %313 = OpLoad %308 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 5 6 3 
                                                      OpStore %308 %314 
                                Private f32* %315 = OpAccessChain %41 %229 
                                         f32 %316 = OpLoad %315 
                                 Output f32* %318 = OpAccessChain %308 %229 
                                                      OpStore %318 %316 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "DUMMY" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat16_2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
float u_xlat12;
bool u_xlatb12;
float u_xlat14;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat12 = _PixelHeight * _Threshold;
    u_xlat12 = (-u_xlat12) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb12 = u_xlat12<0.0;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb12)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat3.y * 0.25 + 0.75;
        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat12, u_xlat14);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat14));
    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xyz);
    u_xlat16_2 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat12 = u_xlat12 * u_xlat16_2;
    u_xlat2.xyz = vec3(u_xlat12) * _LightColor0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat4.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" "DUMMY" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 150
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %133 %139 %142 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %142 Location 142 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                         u32 %109 = OpConstant 2 
                                             %110 = OpTypePointer Uniform %6 
                                         u32 %114 = OpConstant 0 
                                             %115 = OpTypePointer Private %6 
                                Private f32* %125 = OpVariable Private 
                               Output f32_3* %133 = OpVariable Output 
                               Output f32_4* %139 = OpVariable Output 
                                         f32 %140 = OpConstant 3.67402E-40 
                                       f32_4 %141 = OpConstantComposite %140 %140 %140 %140 
                               Output f32_3* %142 = OpVariable Output 
                                       f32_3 %143 = OpConstantComposite %140 %140 %140 
                                             %144 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %36 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %36 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %86 = OpAccessChain %21 %36 %46 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %44 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %23 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %100 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %46 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %97 %108 
                                Uniform f32* %111 = OpAccessChain %21 %24 %23 %109 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpFNegate %112 
                                Private f32* %116 = OpAccessChain %9 %114 
                                                      OpStore %116 %113 
                                Uniform f32* %117 = OpAccessChain %21 %24 %24 %109 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                Private f32* %120 = OpAccessChain %9 %81 
                                                      OpStore %120 %119 
                                Uniform f32* %121 = OpAccessChain %21 %24 %36 %109 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                Private f32* %124 = OpAccessChain %9 %109 
                                                      OpStore %124 %123 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                         f32 %130 = OpDot %127 %129 
                                                      OpStore %125 %130 
                                         f32 %131 = OpLoad %125 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %125 %132 
                                         f32 %134 = OpLoad %125 
                                       f32_3 %135 = OpCompositeConstruct %134 %134 %134 
                                       f32_4 %136 = OpLoad %9 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpFMul %135 %137 
                                                      OpStore %133 %138 
                                                      OpStore %139 %141 
                                                      OpStore %142 %143 
                                 Output f32* %145 = OpAccessChain %85 %23 %81 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFNegate %146 
                                 Output f32* %148 = OpAccessChain %85 %23 %81 
                                                      OpStore %148 %147 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 302
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %49 %64 %279 %290 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 Location 49 
                                                      OpDecorate %64 Location 64 
                                                      OpDecorate %127 SpecId 127 
                                                      OpDecorate %222 DescriptorSet 222 
                                                      OpDecorate %222 Binding 222 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %248 DescriptorSet 248 
                                                      OpDecorate %248 Binding 248 
                                                      OpDecorate %257 DescriptorSet 257 
                                                      OpDecorate %257 Binding 257 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 Location 279 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %290 Location 290 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_3* %11 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %14 %16 
                                              %18 = OpTypeArray %14 %16 
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %14 
                                              %29 = OpTypePointer Private %6 
                                 Private f32* %30 = OpVariable Private 
                                              %40 = OpTypePointer Private %14 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %43 = OpTypeSampledImage %42 
                                              %44 = OpTypePointer UniformConstant %43 
  UniformConstant read_only Texture2DSampled* %45 = OpVariable UniformConstant 
                                              %47 = OpTypeVector %6 2 
                                              %48 = OpTypePointer Input %47 
                                 Input f32_2* %49 = OpVariable Input 
                                          i32 %52 = OpConstant 9 
                                              %53 = OpTypePointer Uniform %6 
                                          i32 %56 = OpConstant 8 
                                          f32 %62 = OpConstant 3.67402E-40 
                                 Input f32_3* %64 = OpVariable Input 
                                          u32 %65 = OpConstant 1 
                                              %66 = OpTypePointer Input %6 
                                              %70 = OpTypeBool 
                                              %71 = OpTypePointer Private %70 
                                Private bool* %72 = OpVariable Private 
                                          f32 %74 = OpConstant 3.67402E-40 
                                          i32 %77 = OpConstant 1 
                                          i32 %79 = OpConstant -1 
                               Private f32_3* %85 = OpVariable Private 
                                          i32 %88 = OpConstant 7 
                                         i32 %101 = OpConstant 2 
                                         i32 %111 = OpConstant 3 
                                         u32 %116 = OpConstant 0 
                                         f32 %119 = OpConstant 3.67402E-40 
                                        bool %121 = OpConstantFalse 
                                        bool %127 = OpSpecConstantFalse 
                              Private f32_4* %133 = OpVariable Private 
                                             %172 = OpTypePointer Function %7 
                                         i32 %186 = OpConstant 5 
                                             %187 = OpTypePointer Uniform %7 
                                         i32 %196 = OpConstant 4 
                                         f32 %204 = OpConstant 3.67402E-40 
                                         f32 %206 = OpConstant 3.67402E-40 
                                Private f32* %208 = OpVariable Private 
                                         u32 %209 = OpConstant 2 
                                         f32 %212 = OpConstant 3.67402E-40 
                                             %219 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %220 = OpTypeSampledImage %219 
                                             %221 = OpTypePointer UniformConstant %220 
 UniformConstant read_only Texture3DSampled* %222 = OpVariable UniformConstant 
                              Private f32_4* %227 = OpVariable Private 
                                         u32 %233 = OpConstant 3 
                              Private f32_3* %235 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %248 = OpVariable UniformConstant 
                                             %254 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %255 = OpTypeSampledImage %254 
                                             %256 = OpTypePointer UniformConstant %255 
UniformConstant read_only TextureCubeSampled* %257 = OpVariable UniformConstant 
                                         i32 %273 = OpConstant 6 
                                Private f32* %278 = OpVariable Private 
                                Input f32_3* %279 = OpVariable Input 
                                             %289 = OpTypePointer Output %14 
                               Output f32_4* %290 = OpVariable Output 
                                             %299 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %173 = OpVariable Function 
                                        f32_3 %12 = OpLoad %11 
                                        f32_3 %13 = OpFNegate %12 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFAdd %13 %27 
                                                      OpStore %9 %28 
                                        f32_3 %31 = OpLoad %9 
                                        f32_3 %32 = OpLoad %9 
                                          f32 %33 = OpDot %31 %32 
                                                      OpStore %30 %33 
                                          f32 %34 = OpLoad %30 
                                          f32 %35 = OpExtInst %1 32 %34 
                                                      OpStore %30 %35 
                                          f32 %36 = OpLoad %30 
                                        f32_3 %37 = OpCompositeConstruct %36 %36 %36 
                                        f32_3 %38 = OpLoad %9 
                                        f32_3 %39 = OpFMul %37 %38 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %46 = OpLoad %45 
                                        f32_2 %50 = OpLoad %49 
                                        f32_4 %51 = OpImageSampleImplicitLod %46 %50 
                                                      OpStore %41 %51 
                                 Uniform f32* %54 = OpAccessChain %21 %52 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %57 = OpAccessChain %21 %56 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpFMul %55 %58 
                                                      OpStore %30 %59 
                                          f32 %60 = OpLoad %30 
                                          f32 %61 = OpFNegate %60 
                                          f32 %63 = OpFMul %61 %62 
                                   Input f32* %67 = OpAccessChain %64 %65 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpFAdd %63 %68 
                                                      OpStore %30 %69 
                                          f32 %73 = OpLoad %30 
                                         bool %75 = OpFOrdLessThan %73 %74 
                                                      OpStore %72 %75 
                                         bool %76 = OpLoad %72 
                                          i32 %78 = OpSelect %76 %77 %23 
                                          i32 %80 = OpIMul %78 %79 
                                         bool %81 = OpINotEqual %80 %23 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %83 
                                              %82 = OpLabel 
                                                      OpKill
                                              %83 = OpLabel 
                                        f32_3 %86 = OpLoad %11 
                                        f32_3 %87 = OpVectorShuffle %86 %86 1 1 1 
                               Uniform f32_4* %89 = OpAccessChain %21 %88 %77 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_3 %92 = OpFMul %87 %91 
                                                      OpStore %85 %92 
                               Uniform f32_4* %93 = OpAccessChain %21 %88 %23 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpLoad %11 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 0 0 
                                        f32_3 %98 = OpFMul %95 %97 
                                        f32_3 %99 = OpLoad %85 
                                       f32_3 %100 = OpFAdd %98 %99 
                                                      OpStore %85 %100 
                              Uniform f32_4* %102 = OpAccessChain %21 %88 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpLoad %11 
                                       f32_3 %106 = OpVectorShuffle %105 %105 2 2 2 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_3 %108 = OpLoad %85 
                                       f32_3 %109 = OpFAdd %107 %108 
                                                      OpStore %85 %109 
                                       f32_3 %110 = OpLoad %85 
                              Uniform f32_4* %112 = OpAccessChain %21 %88 %111 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpFAdd %110 %114 
                                                      OpStore %85 %115 
                                Uniform f32* %117 = OpAccessChain %21 %101 %116 
                                         f32 %118 = OpLoad %117 
                                        bool %120 = OpFOrdEqual %118 %119 
                                                      OpStore %72 %120 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %123 
                                             %122 = OpLabel 
                                        bool %124 = OpLoad %72 
                                                      OpSelectionMerge %126 None 
                                                      OpBranchConditional %124 %125 %126 
                                             %125 = OpLabel 
                                                      OpBranch %126 
                                             %126 = OpLabel 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %229 
                                             %128 = OpLabel 
                                Uniform f32* %130 = OpAccessChain %21 %101 %65 
                                         f32 %131 = OpLoad %130 
                                        bool %132 = OpFOrdEqual %131 %119 
                                                      OpStore %72 %132 
                                       f32_3 %134 = OpLoad %11 
                                       f32_3 %135 = OpVectorShuffle %134 %134 1 1 1 
                              Uniform f32_4* %136 = OpAccessChain %21 %111 %77 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFMul %135 %138 
                                       f32_4 %140 = OpLoad %133 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
                                                      OpStore %133 %141 
                              Uniform f32_4* %142 = OpAccessChain %21 %111 %23 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpLoad %11 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 0 0 
                                       f32_3 %147 = OpFMul %144 %146 
                                       f32_4 %148 = OpLoad %133 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                       f32_3 %150 = OpFAdd %147 %149 
                                       f32_4 %151 = OpLoad %133 
                                       f32_4 %152 = OpVectorShuffle %151 %150 4 5 6 3 
                                                      OpStore %133 %152 
                              Uniform f32_4* %153 = OpAccessChain %21 %111 %101 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpLoad %11 
                                       f32_3 %157 = OpVectorShuffle %156 %156 2 2 2 
                                       f32_3 %158 = OpFMul %155 %157 
                                       f32_4 %159 = OpLoad %133 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_3 %161 = OpFAdd %158 %160 
                                       f32_4 %162 = OpLoad %133 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %133 %163 
                                       f32_4 %164 = OpLoad %133 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %21 %111 %111 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %133 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 6 3 
                                                      OpStore %133 %171 
                                        bool %174 = OpLoad %72 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %179 
                                             %175 = OpLabel 
                                       f32_4 %177 = OpLoad %133 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                                      OpStore %173 %178 
                                                      OpBranch %176 
                                             %179 = OpLabel 
                                       f32_3 %180 = OpLoad %11 
                                                      OpStore %173 %180 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_3 %181 = OpLoad %173 
                                       f32_4 %182 = OpLoad %133 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %133 %183 
                                       f32_4 %184 = OpLoad %133 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                              Uniform f32_3* %188 = OpAccessChain %21 %186 
                                       f32_3 %189 = OpLoad %188 
                                       f32_3 %190 = OpFNegate %189 
                                       f32_3 %191 = OpFAdd %185 %190 
                                       f32_4 %192 = OpLoad %133 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 6 3 
                                                      OpStore %133 %193 
                                       f32_4 %194 = OpLoad %133 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
                              Uniform f32_3* %197 = OpAccessChain %21 %196 
                                       f32_3 %198 = OpLoad %197 
                                       f32_3 %199 = OpFMul %195 %198 
                                       f32_4 %200 = OpLoad %133 
                                       f32_4 %201 = OpVectorShuffle %200 %199 0 4 5 6 
                                                      OpStore %133 %201 
                                Private f32* %202 = OpAccessChain %133 %65 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %207 = OpFAdd %205 %206 
                                                      OpStore %30 %207 
                                Uniform f32* %210 = OpAccessChain %21 %101 %209 
                                         f32 %211 = OpLoad %210 
                                         f32 %213 = OpFMul %211 %212 
                                         f32 %214 = OpFAdd %213 %206 
                                                      OpStore %208 %214 
                                         f32 %215 = OpLoad %30 
                                         f32 %216 = OpLoad %208 
                                         f32 %217 = OpExtInst %1 40 %215 %216 
                                Private f32* %218 = OpAccessChain %133 %116 
                                                      OpStore %218 %217 
                  read_only Texture3DSampled %223 = OpLoad %222 
                                       f32_4 %224 = OpLoad %133 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 2 3 
                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                                      OpStore %133 %226 
                                       f32_4 %228 = OpLoad %133 
                                                      OpStore %227 %228 
                                                      OpBranch %129 
                                             %229 = OpLabel 
                                Private f32* %230 = OpAccessChain %227 %116 
                                                      OpStore %230 %119 
                                Private f32* %231 = OpAccessChain %227 %65 
                                                      OpStore %231 %119 
                                Private f32* %232 = OpAccessChain %227 %209 
                                                      OpStore %232 %119 
                                Private f32* %234 = OpAccessChain %227 %233 
                                                      OpStore %234 %119 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                       f32_4 %236 = OpLoad %227 
                              Uniform f32_4* %237 = OpAccessChain %21 %77 
                                       f32_4 %238 = OpLoad %237 
                                         f32 %239 = OpDot %236 %238 
                                Private f32* %240 = OpAccessChain %235 %116 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %235 %116 
                                         f32 %242 = OpLoad %241 
                                         f32 %243 = OpExtInst %1 43 %242 %74 %119 
                                Private f32* %244 = OpAccessChain %235 %116 
                                                      OpStore %244 %243 
                                       f32_3 %245 = OpLoad %85 
                                       f32_3 %246 = OpLoad %85 
                                         f32 %247 = OpDot %245 %246 
                                                      OpStore %30 %247 
                  read_only Texture2DSampled %249 = OpLoad %248 
                                         f32 %250 = OpLoad %30 
                                       f32_2 %251 = OpCompositeConstruct %250 %250 
                                       f32_4 %252 = OpImageSampleImplicitLod %249 %251 
                                         f32 %253 = OpCompositeExtract %252 3 
                                                      OpStore %30 %253 
                read_only TextureCubeSampled %258 = OpLoad %257 
                                       f32_3 %259 = OpLoad %85 
                                       f32_4 %260 = OpImageSampleImplicitLod %258 %259 
                                         f32 %261 = OpCompositeExtract %260 3 
                                Private f32* %262 = OpAccessChain %85 %116 
                                                      OpStore %262 %261 
                                         f32 %263 = OpLoad %30 
                                Private f32* %264 = OpAccessChain %85 %116 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpFMul %263 %265 
                                                      OpStore %30 %266 
                                Private f32* %267 = OpAccessChain %235 %116 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpLoad %30 
                                         f32 %270 = OpFMul %268 %269 
                                                      OpStore %30 %270 
                                         f32 %271 = OpLoad %30 
                                       f32_3 %272 = OpCompositeConstruct %271 %271 %271 
                              Uniform f32_4* %274 = OpAccessChain %21 %273 
                                       f32_4 %275 = OpLoad %274 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 1 2 
                                       f32_3 %277 = OpFMul %272 %276 
                                                      OpStore %235 %277 
                                       f32_3 %280 = OpLoad %279 
                                       f32_3 %281 = OpLoad %9 
                                         f32 %282 = OpDot %280 %281 
                                                      OpStore %278 %282 
                                         f32 %283 = OpLoad %278 
                                         f32 %284 = OpExtInst %1 40 %283 %74 
                                                      OpStore %278 %284 
                                       f32_4 %285 = OpLoad %41 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_3 %287 = OpLoad %235 
                                       f32_3 %288 = OpFMul %286 %287 
                                                      OpStore %235 %288 
                                         f32 %291 = OpLoad %278 
                                       f32_3 %292 = OpCompositeConstruct %291 %291 %291 
                                       f32_3 %293 = OpLoad %235 
                                       f32_3 %294 = OpFMul %292 %293 
                                       f32_4 %295 = OpLoad %290 
                                       f32_4 %296 = OpVectorShuffle %295 %294 4 5 6 3 
                                                      OpStore %290 %296 
                                Private f32* %297 = OpAccessChain %41 %233 
                                         f32 %298 = OpLoad %297 
                                 Output f32* %300 = OpAccessChain %290 %233 
                                                      OpStore %300 %298 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "DUMMY" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = _PixelHeight * _Threshold;
    u_xlat1.x = (-u_xlat1.x) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb7 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb7){
        u_xlatb7 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb7)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat7 = u_xlat2.y * 0.25 + 0.75;
        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat10, u_xlat7);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat7 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat10_2 = texture(_LightTexture0, u_xlat1.xy);
    u_xlat1.x = u_xlat7 * u_xlat10_2.w;
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" "DUMMY" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 150
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %52 %85 %97 %98 %133 %139 %142 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %52 Location 52 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %133 Location 133 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %139 Location 139 
                                                      OpDecorate %142 Location 142 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Output %50 
                                Output f32_3* %52 = OpVariable Output 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                         u32 %109 = OpConstant 2 
                                             %110 = OpTypePointer Uniform %6 
                                         u32 %114 = OpConstant 0 
                                             %115 = OpTypePointer Private %6 
                                Private f32* %125 = OpVariable Private 
                               Output f32_3* %133 = OpVariable Output 
                               Output f32_4* %139 = OpVariable Output 
                                         f32 %140 = OpConstant 3.67402E-40 
                                       f32_4 %141 = OpConstantComposite %140 %140 %140 %140 
                               Output f32_3* %142 = OpVariable Output 
                                       f32_3 %143 = OpConstantComposite %140 %140 %140 
                                             %144 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %53 = OpAccessChain %21 %23 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %56 = OpLoad %11 
                                        f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                        f32_3 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %52 %61 
                                        f32_4 %62 = OpLoad %44 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %21 %36 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %63 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %21 %36 %23 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %44 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %36 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %44 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                               Uniform f32_4* %86 = OpAccessChain %21 %36 %46 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %44 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %23 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %100 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %46 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %97 %108 
                                Uniform f32* %111 = OpAccessChain %21 %24 %23 %109 
                                         f32 %112 = OpLoad %111 
                                         f32 %113 = OpFNegate %112 
                                Private f32* %116 = OpAccessChain %9 %114 
                                                      OpStore %116 %113 
                                Uniform f32* %117 = OpAccessChain %21 %24 %24 %109 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                Private f32* %120 = OpAccessChain %9 %81 
                                                      OpStore %120 %119 
                                Uniform f32* %121 = OpAccessChain %21 %24 %36 %109 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                Private f32* %124 = OpAccessChain %9 %109 
                                                      OpStore %124 %123 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                         f32 %130 = OpDot %127 %129 
                                                      OpStore %125 %130 
                                         f32 %131 = OpLoad %125 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %125 %132 
                                         f32 %134 = OpLoad %125 
                                       f32_3 %135 = OpCompositeConstruct %134 %134 %134 
                                       f32_4 %136 = OpLoad %9 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpFMul %135 %137 
                                                      OpStore %133 %138 
                                                      OpStore %139 %141 
                                                      OpStore %142 %143 
                                 Output f32* %145 = OpAccessChain %85 %23 %81 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFNegate %146 
                                 Output f32* %148 = OpAccessChain %85 %23 %81 
                                                      OpStore %148 %147 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 280
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %48 %72 %255 %268 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %26 ArrayStride 26 
                                                      OpMemberDecorate %27 0 RelaxedPrecision 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 RelaxedPrecision 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpMemberDecorate %27 6 RelaxedPrecision 
                                                      OpMemberDecorate %27 6 Offset 27 
                                                      OpMemberDecorate %27 7 Offset 27 
                                                      OpMemberDecorate %27 8 Offset 27 
                                                      OpMemberDecorate %27 9 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %48 Location 48 
                                                      OpDecorate %72 Location 72 
                                                      OpDecorate %115 SpecId 115 
                                                      OpDecorate %211 DescriptorSet 211 
                                                      OpDecorate %211 Binding 211 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %235 DescriptorSet 235 
                                                      OpDecorate %235 Binding 235 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 Location 255 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %268 Location 268 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                                              %20 = OpTypePointer Private %15 
                               Private f32_2* %21 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeVector %6 3 
                                              %26 = OpTypeArray %7 %23 
                                              %27 = OpTypeStruct %7 %7 %7 %24 %25 %25 %7 %26 %6 %6 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 9 
                                              %32 = OpTypePointer Uniform %6 
                                          i32 %35 = OpConstant 8 
                                          u32 %39 = OpConstant 0 
                                              %40 = OpTypePointer Private %6 
                                          f32 %45 = OpConstant 3.67402E-40 
                                              %47 = OpTypePointer Input %25 
                                 Input f32_3* %48 = OpVariable Input 
                                          u32 %49 = OpConstant 1 
                                              %50 = OpTypePointer Input %6 
                                              %55 = OpTypeBool 
                                              %56 = OpTypePointer Private %55 
                                Private bool* %57 = OpVariable Private 
                                          f32 %60 = OpConstant 3.67402E-40 
                                          i32 %63 = OpConstant 0 
                                          i32 %64 = OpConstant 1 
                                          i32 %66 = OpConstant -1 
                                 Input f32_3* %72 = OpVariable Input 
                                          i32 %75 = OpConstant 7 
                                              %76 = OpTypePointer Uniform %7 
                                          i32 %89 = OpConstant 2 
                                          i32 %99 = OpConstant 3 
                               Private bool* %104 = OpVariable Private 
                                         f32 %107 = OpConstant 3.67402E-40 
                                        bool %109 = OpConstantFalse 
                                        bool %115 = OpSpecConstantFalse 
                              Private f32_4* %121 = OpVariable Private 
                                             %160 = OpTypePointer Function %25 
                                         i32 %174 = OpConstant 5 
                                             %175 = OpTypePointer Uniform %25 
                                         i32 %184 = OpConstant 4 
                                Private f32* %190 = OpVariable Private 
                                         f32 %193 = OpConstant 3.67402E-40 
                                         f32 %195 = OpConstant 3.67402E-40 
                                Private f32* %197 = OpVariable Private 
                                         u32 %198 = OpConstant 2 
                                         f32 %201 = OpConstant 3.67402E-40 
                                             %208 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %209 = OpTypeSampledImage %208 
                                             %210 = OpTypePointer UniformConstant %209 
 UniformConstant read_only Texture3DSampled* %211 = OpVariable UniformConstant 
                              Private f32_4* %216 = OpVariable Private 
                                         u32 %222 = OpConstant 3 
                                             %224 = OpTypePointer Private %25 
                              Private f32_3* %225 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %235 = OpVariable UniformConstant 
                                         i32 %249 = OpConstant 6 
                                Private f32* %254 = OpVariable Private 
                                Input f32_3* %255 = OpVariable Input 
                                             %267 = OpTypePointer Output %7 
                               Output f32_4* %268 = OpVariable Output 
                                             %277 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %161 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %33 = OpAccessChain %29 %31 
                                          f32 %34 = OpLoad %33 
                                 Uniform f32* %36 = OpAccessChain %29 %35 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFMul %34 %37 
                                 Private f32* %41 = OpAccessChain %21 %39 
                                                      OpStore %41 %38 
                                 Private f32* %42 = OpAccessChain %21 %39 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %46 = OpFMul %44 %45 
                                   Input f32* %51 = OpAccessChain %48 %49 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFAdd %46 %52 
                                 Private f32* %54 = OpAccessChain %21 %39 
                                                      OpStore %54 %53 
                                 Private f32* %58 = OpAccessChain %21 %39 
                                          f32 %59 = OpLoad %58 
                                         bool %61 = OpFOrdLessThan %59 %60 
                                                      OpStore %57 %61 
                                         bool %62 = OpLoad %57 
                                          i32 %65 = OpSelect %62 %64 %63 
                                          i32 %67 = OpIMul %65 %66 
                                         bool %68 = OpINotEqual %67 %63 
                                                      OpSelectionMerge %70 None 
                                                      OpBranchConditional %68 %69 %70 
                                              %69 = OpLabel 
                                                      OpKill
                                              %70 = OpLabel 
                                        f32_3 %73 = OpLoad %72 
                                        f32_2 %74 = OpVectorShuffle %73 %73 1 1 
                               Uniform f32_4* %77 = OpAccessChain %29 %75 %64 
                                        f32_4 %78 = OpLoad %77 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                                        f32_2 %80 = OpFMul %74 %79 
                                                      OpStore %21 %80 
                               Uniform f32_4* %81 = OpAccessChain %29 %75 %63 
                                        f32_4 %82 = OpLoad %81 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_3 %84 = OpLoad %72 
                                        f32_2 %85 = OpVectorShuffle %84 %84 0 0 
                                        f32_2 %86 = OpFMul %83 %85 
                                        f32_2 %87 = OpLoad %21 
                                        f32_2 %88 = OpFAdd %86 %87 
                                                      OpStore %21 %88 
                               Uniform f32_4* %90 = OpAccessChain %29 %75 %89 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_3 %93 = OpLoad %72 
                                        f32_2 %94 = OpVectorShuffle %93 %93 2 2 
                                        f32_2 %95 = OpFMul %92 %94 
                                        f32_2 %96 = OpLoad %21 
                                        f32_2 %97 = OpFAdd %95 %96 
                                                      OpStore %21 %97 
                                        f32_2 %98 = OpLoad %21 
                              Uniform f32_4* %100 = OpAccessChain %29 %75 %99 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_2 %103 = OpFAdd %98 %102 
                                                      OpStore %21 %103 
                                Uniform f32* %105 = OpAccessChain %29 %89 %39 
                                         f32 %106 = OpLoad %105 
                                        bool %108 = OpFOrdEqual %106 %107 
                                                      OpStore %104 %108 
                                                      OpSelectionMerge %111 None 
                                                      OpBranchConditional %109 %110 %111 
                                             %110 = OpLabel 
                                        bool %112 = OpLoad %104 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %114 
                                             %113 = OpLabel 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                                      OpBranch %111 
                                             %111 = OpLabel 
                                                      OpSelectionMerge %117 None 
                                                      OpBranchConditional %115 %116 %218 
                                             %116 = OpLabel 
                                Uniform f32* %118 = OpAccessChain %29 %89 %49 
                                         f32 %119 = OpLoad %118 
                                        bool %120 = OpFOrdEqual %119 %107 
                                                      OpStore %104 %120 
                                       f32_3 %122 = OpLoad %72 
                                       f32_3 %123 = OpVectorShuffle %122 %122 1 1 1 
                              Uniform f32_4* %124 = OpAccessChain %29 %99 %64 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                       f32_3 %127 = OpFMul %123 %126 
                                       f32_4 %128 = OpLoad %121 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %121 %129 
                              Uniform f32_4* %130 = OpAccessChain %29 %99 %63 
                                       f32_4 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpLoad %72 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 0 0 
                                       f32_3 %135 = OpFMul %132 %134 
                                       f32_4 %136 = OpLoad %121 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpFAdd %135 %137 
                                       f32_4 %139 = OpLoad %121 
                                       f32_4 %140 = OpVectorShuffle %139 %138 4 5 6 3 
                                                      OpStore %121 %140 
                              Uniform f32_4* %141 = OpAccessChain %29 %99 %89 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpLoad %72 
                                       f32_3 %145 = OpVectorShuffle %144 %144 2 2 2 
                                       f32_3 %146 = OpFMul %143 %145 
                                       f32_4 %147 = OpLoad %121 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFAdd %146 %148 
                                       f32_4 %150 = OpLoad %121 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %121 %151 
                                       f32_4 %152 = OpLoad %121 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              Uniform f32_4* %154 = OpAccessChain %29 %99 %99 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                       f32_3 %157 = OpFAdd %153 %156 
                                       f32_4 %158 = OpLoad %121 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 6 3 
                                                      OpStore %121 %159 
                                        bool %162 = OpLoad %104 
                                                      OpSelectionMerge %164 None 
                                                      OpBranchConditional %162 %163 %167 
                                             %163 = OpLabel 
                                       f32_4 %165 = OpLoad %121 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                                      OpStore %161 %166 
                                                      OpBranch %164 
                                             %167 = OpLabel 
                                       f32_3 %168 = OpLoad %72 
                                                      OpStore %161 %168 
                                                      OpBranch %164 
                                             %164 = OpLabel 
                                       f32_3 %169 = OpLoad %161 
                                       f32_4 %170 = OpLoad %121 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 6 3 
                                                      OpStore %121 %171 
                                       f32_4 %172 = OpLoad %121 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                              Uniform f32_3* %176 = OpAccessChain %29 %174 
                                       f32_3 %177 = OpLoad %176 
                                       f32_3 %178 = OpFNegate %177 
                                       f32_3 %179 = OpFAdd %173 %178 
                                       f32_4 %180 = OpLoad %121 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %121 %181 
                                       f32_4 %182 = OpLoad %121 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                              Uniform f32_3* %185 = OpAccessChain %29 %184 
                                       f32_3 %186 = OpLoad %185 
                                       f32_3 %187 = OpFMul %183 %186 
                                       f32_4 %188 = OpLoad %121 
                                       f32_4 %189 = OpVectorShuffle %188 %187 0 4 5 6 
                                                      OpStore %121 %189 
                                Private f32* %191 = OpAccessChain %121 %49 
                                         f32 %192 = OpLoad %191 
                                         f32 %194 = OpFMul %192 %193 
                                         f32 %196 = OpFAdd %194 %195 
                                                      OpStore %190 %196 
                                Uniform f32* %199 = OpAccessChain %29 %89 %198 
                                         f32 %200 = OpLoad %199 
                                         f32 %202 = OpFMul %200 %201 
                                         f32 %203 = OpFAdd %202 %195 
                                                      OpStore %197 %203 
                                         f32 %204 = OpLoad %197 
                                         f32 %205 = OpLoad %190 
                                         f32 %206 = OpExtInst %1 40 %204 %205 
                                Private f32* %207 = OpAccessChain %121 %39 
                                                      OpStore %207 %206 
                  read_only Texture3DSampled %212 = OpLoad %211 
                                       f32_4 %213 = OpLoad %121 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 2 3 
                                       f32_4 %215 = OpImageSampleImplicitLod %212 %214 
                                                      OpStore %121 %215 
                                       f32_4 %217 = OpLoad %121 
                                                      OpStore %216 %217 
                                                      OpBranch %117 
                                             %218 = OpLabel 
                                Private f32* %219 = OpAccessChain %216 %39 
                                                      OpStore %219 %107 
                                Private f32* %220 = OpAccessChain %216 %49 
                                                      OpStore %220 %107 
                                Private f32* %221 = OpAccessChain %216 %198 
                                                      OpStore %221 %107 
                                Private f32* %223 = OpAccessChain %216 %222 
                                                      OpStore %223 %107 
                                                      OpBranch %117 
                                             %117 = OpLabel 
                                       f32_4 %226 = OpLoad %216 
                              Uniform f32_4* %227 = OpAccessChain %29 %64 
                                       f32_4 %228 = OpLoad %227 
                                         f32 %229 = OpDot %226 %228 
                                Private f32* %230 = OpAccessChain %225 %39 
                                                      OpStore %230 %229 
                                Private f32* %231 = OpAccessChain %225 %39 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpExtInst %1 43 %232 %60 %107 
                                Private f32* %234 = OpAccessChain %225 %39 
                                                      OpStore %234 %233 
                  read_only Texture2DSampled %236 = OpLoad %235 
                                       f32_2 %237 = OpLoad %21 
                                       f32_4 %238 = OpImageSampleImplicitLod %236 %237 
                                         f32 %239 = OpCompositeExtract %238 3 
                                Private f32* %240 = OpAccessChain %21 %39 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %225 %39 
                                         f32 %242 = OpLoad %241 
                                Private f32* %243 = OpAccessChain %21 %39 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpFMul %242 %244 
                                Private f32* %246 = OpAccessChain %21 %39 
                                                      OpStore %246 %245 
                                       f32_2 %247 = OpLoad %21 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 0 0 
                              Uniform f32_4* %250 = OpAccessChain %29 %249 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_3 %253 = OpFMul %248 %252 
                                                      OpStore %225 %253 
                                       f32_3 %256 = OpLoad %255 
                              Uniform f32_4* %257 = OpAccessChain %29 %63 
                                       f32_4 %258 = OpLoad %257 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                         f32 %260 = OpDot %256 %259 
                                                      OpStore %254 %260 
                                         f32 %261 = OpLoad %254 
                                         f32 %262 = OpExtInst %1 40 %261 %60 
                                                      OpStore %254 %262 
                                       f32_4 %263 = OpLoad %9 
                                       f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
                                       f32_3 %265 = OpLoad %225 
                                       f32_3 %266 = OpFMul %264 %265 
                                                      OpStore %225 %266 
                                         f32 %269 = OpLoad %254 
                                       f32_3 %270 = OpCompositeConstruct %269 %269 %269 
                                       f32_3 %271 = OpLoad %225 
                                       f32_3 %272 = OpFMul %270 %271 
                                       f32_4 %273 = OpLoad %268 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 6 3 
                                                      OpStore %268 %274 
                                Private f32* %275 = OpAccessChain %9 %222 
                                         f32 %276 = OpLoad %275 
                                 Output f32* %278 = OpAccessChain %268 %222 
                                                      OpStore %278 %276 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "POINT" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0.xy = in_POSITION0.xy / in_POSITION0.ww;
    u_xlat4.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat4.xy * u_xlat0.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xy;
    u_xlat0.xy = u_xlat0.xy * in_POSITION0.ww;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
bool u_xlatb12;
float u_xlat14;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat12 = _PixelHeight * _Threshold;
    u_xlat12 = (-u_xlat12) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb12 = u_xlat12<0.0;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb12)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat3.y * 0.25 + 0.75;
        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat12, u_xlat14);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xx);
    u_xlat12 = u_xlat12 * u_xlat10_2.w;
    u_xlat2.xyz = vec3(u_xlat12) * _LightColor0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat4.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT" "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 190
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %125 %136 %137 %173 %179 %182 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpDecorate %26 ArrayStride 26 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %92 Location 92 
                                                      OpMemberDecorate %123 0 BuiltIn 123 
                                                      OpMemberDecorate %123 1 BuiltIn 123 
                                                      OpMemberDecorate %123 2 BuiltIn 123 
                                                      OpDecorate %123 Block 
                                                      OpDecorate %136 Location 136 
                                                      OpDecorate %137 Location 137 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %182 Location 182 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %20 = OpTypePointer Private %12 
                               Private f32_2* %21 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeArray %7 %23 
                                              %26 = OpTypeArray %7 %23 
                                              %27 = OpTypeStruct %7 %24 %25 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Uniform %7 
                                          f32 %36 = OpConstant 3.67402E-40 
                                        f32_2 %37 = OpConstantComposite %36 %36 
                               Private f32_4* %63 = OpVariable Private 
                                          i32 %66 = OpConstant 1 
                                          i32 %77 = OpConstant 2 
                                          i32 %86 = OpConstant 3 
                                              %90 = OpTypeVector %6 3 
                                              %91 = OpTypePointer Output %90 
                                Output f32_3* %92 = OpVariable Output 
                                         u32 %121 = OpConstant 1 
                                             %122 = OpTypeArray %6 %121 
                                             %123 = OpTypeStruct %7 %6 %122 
                                             %124 = OpTypePointer Output %123 
        Output struct {f32_4; f32; f32[1];}* %125 = OpVariable Output 
                                             %133 = OpTypePointer Output %7 
                                             %135 = OpTypePointer Output %12 
                               Output f32_2* %136 = OpVariable Output 
                                Input f32_4* %137 = OpVariable Input 
                                         i32 %140 = OpConstant 4 
                                         u32 %149 = OpConstant 2 
                                             %150 = OpTypePointer Uniform %6 
                                         u32 %154 = OpConstant 0 
                                             %155 = OpTypePointer Private %6 
                                Private f32* %165 = OpVariable Private 
                               Output f32_3* %173 = OpVariable Output 
                               Output f32_4* %179 = OpVariable Output 
                                         f32 %180 = OpConstant 3.67402E-40 
                                       f32_4 %181 = OpConstantComposite %180 %180 %180 %180 
                               Output f32_3* %182 = OpVariable Output 
                                       f32_3 %183 = OpConstantComposite %180 %180 %180 
                                             %184 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_4 %15 = OpLoad %11 
                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                        f32_2 %17 = OpFDiv %14 %16 
                                        f32_4 %18 = OpLoad %9 
                                        f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                      OpStore %9 %19 
                               Uniform f32_4* %33 = OpAccessChain %29 %31 
                                        f32_4 %34 = OpLoad %33 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                                        f32_2 %38 = OpFMul %35 %37 
                                                      OpStore %21 %38 
                                        f32_2 %39 = OpLoad %21 
                                        f32_4 %40 = OpLoad %9 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpExtInst %1 2 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_4 %49 = OpVectorShuffle %48 %47 4 5 2 3 
                                                      OpStore %9 %49 
                                        f32_4 %50 = OpLoad %9 
                                        f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                        f32_2 %52 = OpLoad %21 
                                        f32_2 %53 = OpFDiv %51 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %9 %55 
                                        f32_4 %56 = OpLoad %9 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_4 %58 = OpLoad %11 
                                        f32_2 %59 = OpVectorShuffle %58 %58 3 3 
                                        f32_2 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_4 %62 = OpVectorShuffle %61 %60 4 5 2 3 
                                                      OpStore %9 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                               Uniform f32_4* %67 = OpAccessChain %29 %66 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpFMul %65 %68 
                                                      OpStore %63 %69 
                               Uniform f32_4* %70 = OpAccessChain %29 %66 %31 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 0 0 0 0 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %63 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %9 %76 
                               Uniform f32_4* %78 = OpAccessChain %29 %66 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %11 
                                        f32_4 %81 = OpVectorShuffle %80 %80 2 2 2 2 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %9 %84 
                                        f32_4 %85 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %29 %66 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %85 %88 
                                                      OpStore %63 %89 
                               Uniform f32_4* %93 = OpAccessChain %29 %66 %86 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_4 %96 = OpLoad %11 
                                        f32_3 %97 = OpVectorShuffle %96 %96 3 3 3 
                                        f32_3 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %9 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFAdd %98 %100 
                                                      OpStore %92 %101 
                                       f32_4 %102 = OpLoad %63 
                                       f32_4 %103 = OpVectorShuffle %102 %102 1 1 1 1 
                              Uniform f32_4* %104 = OpAccessChain %29 %86 %66 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpFMul %103 %105 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %29 %86 %31 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpLoad %63 
                                       f32_4 %110 = OpVectorShuffle %109 %109 0 0 0 0 
                                       f32_4 %111 = OpFMul %108 %110 
                                       f32_4 %112 = OpLoad %9 
                                       f32_4 %113 = OpFAdd %111 %112 
                                                      OpStore %9 %113 
                              Uniform f32_4* %114 = OpAccessChain %29 %86 %77 
                                       f32_4 %115 = OpLoad %114 
                                       f32_4 %116 = OpLoad %63 
                                       f32_4 %117 = OpVectorShuffle %116 %116 2 2 2 2 
                                       f32_4 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpFAdd %118 %119 
                                                      OpStore %9 %120 
                              Uniform f32_4* %126 = OpAccessChain %29 %86 %86 
                                       f32_4 %127 = OpLoad %126 
                                       f32_4 %128 = OpLoad %63 
                                       f32_4 %129 = OpVectorShuffle %128 %128 3 3 3 3 
                                       f32_4 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpFAdd %130 %131 
                               Output f32_4* %134 = OpAccessChain %125 %31 
                                                      OpStore %134 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
                              Uniform f32_4* %141 = OpAccessChain %29 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                                       f32_2 %144 = OpFMul %139 %143 
                              Uniform f32_4* %145 = OpAccessChain %29 %140 
                                       f32_4 %146 = OpLoad %145 
                                       f32_2 %147 = OpVectorShuffle %146 %146 2 3 
                                       f32_2 %148 = OpFAdd %144 %147 
                                                      OpStore %136 %148 
                                Uniform f32* %151 = OpAccessChain %29 %77 %31 %149 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFNegate %152 
                                Private f32* %156 = OpAccessChain %9 %154 
                                                      OpStore %156 %153 
                                Uniform f32* %157 = OpAccessChain %29 %77 %66 %149 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFNegate %158 
                                Private f32* %160 = OpAccessChain %9 %121 
                                                      OpStore %160 %159 
                                Uniform f32* %161 = OpAccessChain %29 %77 %77 %149 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                Private f32* %164 = OpAccessChain %9 %149 
                                                      OpStore %164 %163 
                                       f32_4 %166 = OpLoad %9 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                         f32 %170 = OpDot %167 %169 
                                                      OpStore %165 %170 
                                         f32 %171 = OpLoad %165 
                                         f32 %172 = OpExtInst %1 32 %171 
                                                      OpStore %165 %172 
                                         f32 %174 = OpLoad %165 
                                       f32_3 %175 = OpCompositeConstruct %174 %174 %174 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %178 = OpFMul %175 %177 
                                                      OpStore %173 %178 
                                                      OpStore %179 %181 
                                                      OpStore %182 %183 
                                 Output f32* %185 = OpAccessChain %125 %31 %121 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFNegate %186 
                                 Output f32* %188 = OpAccessChain %125 %31 %121 
                                                      OpStore %188 %187 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 289
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %49 %64 %266 %277 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 Location 49 
                                                      OpDecorate %64 Location 64 
                                                      OpDecorate %127 SpecId 127 
                                                      OpDecorate %222 DescriptorSet 222 
                                                      OpDecorate %222 Binding 222 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %248 DescriptorSet 248 
                                                      OpDecorate %248 Binding 248 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 Location 266 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %277 Location 277 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_3* %11 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %14 %16 
                                              %18 = OpTypeArray %14 %16 
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %14 
                                              %29 = OpTypePointer Private %6 
                                 Private f32* %30 = OpVariable Private 
                                              %40 = OpTypePointer Private %14 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %43 = OpTypeSampledImage %42 
                                              %44 = OpTypePointer UniformConstant %43 
  UniformConstant read_only Texture2DSampled* %45 = OpVariable UniformConstant 
                                              %47 = OpTypeVector %6 2 
                                              %48 = OpTypePointer Input %47 
                                 Input f32_2* %49 = OpVariable Input 
                                          i32 %52 = OpConstant 9 
                                              %53 = OpTypePointer Uniform %6 
                                          i32 %56 = OpConstant 8 
                                          f32 %62 = OpConstant 3.67402E-40 
                                 Input f32_3* %64 = OpVariable Input 
                                          u32 %65 = OpConstant 1 
                                              %66 = OpTypePointer Input %6 
                                              %70 = OpTypeBool 
                                              %71 = OpTypePointer Private %70 
                                Private bool* %72 = OpVariable Private 
                                          f32 %74 = OpConstant 3.67402E-40 
                                          i32 %77 = OpConstant 1 
                                          i32 %79 = OpConstant -1 
                               Private f32_3* %85 = OpVariable Private 
                                          i32 %88 = OpConstant 7 
                                         i32 %101 = OpConstant 2 
                                         i32 %111 = OpConstant 3 
                                         u32 %116 = OpConstant 0 
                                         f32 %119 = OpConstant 3.67402E-40 
                                        bool %121 = OpConstantFalse 
                                        bool %127 = OpSpecConstantFalse 
                              Private f32_4* %133 = OpVariable Private 
                                             %172 = OpTypePointer Function %7 
                                         i32 %186 = OpConstant 5 
                                             %187 = OpTypePointer Uniform %7 
                                         i32 %196 = OpConstant 4 
                                         f32 %204 = OpConstant 3.67402E-40 
                                         f32 %206 = OpConstant 3.67402E-40 
                                Private f32* %208 = OpVariable Private 
                                         u32 %209 = OpConstant 2 
                                         f32 %212 = OpConstant 3.67402E-40 
                                             %219 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %220 = OpTypeSampledImage %219 
                                             %221 = OpTypePointer UniformConstant %220 
 UniformConstant read_only Texture3DSampled* %222 = OpVariable UniformConstant 
                              Private f32_4* %227 = OpVariable Private 
                                         u32 %233 = OpConstant 3 
                              Private f32_3* %235 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %248 = OpVariable UniformConstant 
                                         i32 %260 = OpConstant 6 
                                Private f32* %265 = OpVariable Private 
                                Input f32_3* %266 = OpVariable Input 
                                             %276 = OpTypePointer Output %14 
                               Output f32_4* %277 = OpVariable Output 
                                             %286 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %173 = OpVariable Function 
                                        f32_3 %12 = OpLoad %11 
                                        f32_3 %13 = OpFNegate %12 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFAdd %13 %27 
                                                      OpStore %9 %28 
                                        f32_3 %31 = OpLoad %9 
                                        f32_3 %32 = OpLoad %9 
                                          f32 %33 = OpDot %31 %32 
                                                      OpStore %30 %33 
                                          f32 %34 = OpLoad %30 
                                          f32 %35 = OpExtInst %1 32 %34 
                                                      OpStore %30 %35 
                                          f32 %36 = OpLoad %30 
                                        f32_3 %37 = OpCompositeConstruct %36 %36 %36 
                                        f32_3 %38 = OpLoad %9 
                                        f32_3 %39 = OpFMul %37 %38 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %46 = OpLoad %45 
                                        f32_2 %50 = OpLoad %49 
                                        f32_4 %51 = OpImageSampleImplicitLod %46 %50 
                                                      OpStore %41 %51 
                                 Uniform f32* %54 = OpAccessChain %21 %52 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %57 = OpAccessChain %21 %56 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpFMul %55 %58 
                                                      OpStore %30 %59 
                                          f32 %60 = OpLoad %30 
                                          f32 %61 = OpFNegate %60 
                                          f32 %63 = OpFMul %61 %62 
                                   Input f32* %67 = OpAccessChain %64 %65 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpFAdd %63 %68 
                                                      OpStore %30 %69 
                                          f32 %73 = OpLoad %30 
                                         bool %75 = OpFOrdLessThan %73 %74 
                                                      OpStore %72 %75 
                                         bool %76 = OpLoad %72 
                                          i32 %78 = OpSelect %76 %77 %23 
                                          i32 %80 = OpIMul %78 %79 
                                         bool %81 = OpINotEqual %80 %23 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %83 
                                              %82 = OpLabel 
                                                      OpKill
                                              %83 = OpLabel 
                                        f32_3 %86 = OpLoad %11 
                                        f32_3 %87 = OpVectorShuffle %86 %86 1 1 1 
                               Uniform f32_4* %89 = OpAccessChain %21 %88 %77 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_3 %92 = OpFMul %87 %91 
                                                      OpStore %85 %92 
                               Uniform f32_4* %93 = OpAccessChain %21 %88 %23 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpLoad %11 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 0 0 
                                        f32_3 %98 = OpFMul %95 %97 
                                        f32_3 %99 = OpLoad %85 
                                       f32_3 %100 = OpFAdd %98 %99 
                                                      OpStore %85 %100 
                              Uniform f32_4* %102 = OpAccessChain %21 %88 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpLoad %11 
                                       f32_3 %106 = OpVectorShuffle %105 %105 2 2 2 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_3 %108 = OpLoad %85 
                                       f32_3 %109 = OpFAdd %107 %108 
                                                      OpStore %85 %109 
                                       f32_3 %110 = OpLoad %85 
                              Uniform f32_4* %112 = OpAccessChain %21 %88 %111 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpFAdd %110 %114 
                                                      OpStore %85 %115 
                                Uniform f32* %117 = OpAccessChain %21 %101 %116 
                                         f32 %118 = OpLoad %117 
                                        bool %120 = OpFOrdEqual %118 %119 
                                                      OpStore %72 %120 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %123 
                                             %122 = OpLabel 
                                        bool %124 = OpLoad %72 
                                                      OpSelectionMerge %126 None 
                                                      OpBranchConditional %124 %125 %126 
                                             %125 = OpLabel 
                                                      OpBranch %126 
                                             %126 = OpLabel 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %229 
                                             %128 = OpLabel 
                                Uniform f32* %130 = OpAccessChain %21 %101 %65 
                                         f32 %131 = OpLoad %130 
                                        bool %132 = OpFOrdEqual %131 %119 
                                                      OpStore %72 %132 
                                       f32_3 %134 = OpLoad %11 
                                       f32_3 %135 = OpVectorShuffle %134 %134 1 1 1 
                              Uniform f32_4* %136 = OpAccessChain %21 %111 %77 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFMul %135 %138 
                                       f32_4 %140 = OpLoad %133 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
                                                      OpStore %133 %141 
                              Uniform f32_4* %142 = OpAccessChain %21 %111 %23 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpLoad %11 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 0 0 
                                       f32_3 %147 = OpFMul %144 %146 
                                       f32_4 %148 = OpLoad %133 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                       f32_3 %150 = OpFAdd %147 %149 
                                       f32_4 %151 = OpLoad %133 
                                       f32_4 %152 = OpVectorShuffle %151 %150 4 5 6 3 
                                                      OpStore %133 %152 
                              Uniform f32_4* %153 = OpAccessChain %21 %111 %101 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpLoad %11 
                                       f32_3 %157 = OpVectorShuffle %156 %156 2 2 2 
                                       f32_3 %158 = OpFMul %155 %157 
                                       f32_4 %159 = OpLoad %133 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_3 %161 = OpFAdd %158 %160 
                                       f32_4 %162 = OpLoad %133 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %133 %163 
                                       f32_4 %164 = OpLoad %133 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %21 %111 %111 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %133 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 6 3 
                                                      OpStore %133 %171 
                                        bool %174 = OpLoad %72 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %179 
                                             %175 = OpLabel 
                                       f32_4 %177 = OpLoad %133 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                                      OpStore %173 %178 
                                                      OpBranch %176 
                                             %179 = OpLabel 
                                       f32_3 %180 = OpLoad %11 
                                                      OpStore %173 %180 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_3 %181 = OpLoad %173 
                                       f32_4 %182 = OpLoad %133 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %133 %183 
                                       f32_4 %184 = OpLoad %133 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                              Uniform f32_3* %188 = OpAccessChain %21 %186 
                                       f32_3 %189 = OpLoad %188 
                                       f32_3 %190 = OpFNegate %189 
                                       f32_3 %191 = OpFAdd %185 %190 
                                       f32_4 %192 = OpLoad %133 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 6 3 
                                                      OpStore %133 %193 
                                       f32_4 %194 = OpLoad %133 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
                              Uniform f32_3* %197 = OpAccessChain %21 %196 
                                       f32_3 %198 = OpLoad %197 
                                       f32_3 %199 = OpFMul %195 %198 
                                       f32_4 %200 = OpLoad %133 
                                       f32_4 %201 = OpVectorShuffle %200 %199 0 4 5 6 
                                                      OpStore %133 %201 
                                Private f32* %202 = OpAccessChain %133 %65 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %207 = OpFAdd %205 %206 
                                                      OpStore %30 %207 
                                Uniform f32* %210 = OpAccessChain %21 %101 %209 
                                         f32 %211 = OpLoad %210 
                                         f32 %213 = OpFMul %211 %212 
                                         f32 %214 = OpFAdd %213 %206 
                                                      OpStore %208 %214 
                                         f32 %215 = OpLoad %30 
                                         f32 %216 = OpLoad %208 
                                         f32 %217 = OpExtInst %1 40 %215 %216 
                                Private f32* %218 = OpAccessChain %133 %116 
                                                      OpStore %218 %217 
                  read_only Texture3DSampled %223 = OpLoad %222 
                                       f32_4 %224 = OpLoad %133 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 2 3 
                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                                      OpStore %133 %226 
                                       f32_4 %228 = OpLoad %133 
                                                      OpStore %227 %228 
                                                      OpBranch %129 
                                             %229 = OpLabel 
                                Private f32* %230 = OpAccessChain %227 %116 
                                                      OpStore %230 %119 
                                Private f32* %231 = OpAccessChain %227 %65 
                                                      OpStore %231 %119 
                                Private f32* %232 = OpAccessChain %227 %209 
                                                      OpStore %232 %119 
                                Private f32* %234 = OpAccessChain %227 %233 
                                                      OpStore %234 %119 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                       f32_4 %236 = OpLoad %227 
                              Uniform f32_4* %237 = OpAccessChain %21 %77 
                                       f32_4 %238 = OpLoad %237 
                                         f32 %239 = OpDot %236 %238 
                                Private f32* %240 = OpAccessChain %235 %116 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %235 %116 
                                         f32 %242 = OpLoad %241 
                                         f32 %243 = OpExtInst %1 43 %242 %74 %119 
                                Private f32* %244 = OpAccessChain %235 %116 
                                                      OpStore %244 %243 
                                       f32_3 %245 = OpLoad %85 
                                       f32_3 %246 = OpLoad %85 
                                         f32 %247 = OpDot %245 %246 
                                                      OpStore %30 %247 
                  read_only Texture2DSampled %249 = OpLoad %248 
                                         f32 %250 = OpLoad %30 
                                       f32_2 %251 = OpCompositeConstruct %250 %250 
                                       f32_4 %252 = OpImageSampleImplicitLod %249 %251 
                                         f32 %253 = OpCompositeExtract %252 3 
                                                      OpStore %30 %253 
                                Private f32* %254 = OpAccessChain %235 %116 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpLoad %30 
                                         f32 %257 = OpFMul %255 %256 
                                                      OpStore %30 %257 
                                         f32 %258 = OpLoad %30 
                                       f32_3 %259 = OpCompositeConstruct %258 %258 %258 
                              Uniform f32_4* %261 = OpAccessChain %21 %260 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpFMul %259 %263 
                                                      OpStore %235 %264 
                                       f32_3 %267 = OpLoad %266 
                                       f32_3 %268 = OpLoad %9 
                                         f32 %269 = OpDot %267 %268 
                                                      OpStore %265 %269 
                                         f32 %270 = OpLoad %265 
                                         f32 %271 = OpExtInst %1 40 %270 %74 
                                                      OpStore %265 %271 
                                       f32_4 %272 = OpLoad %41 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %274 = OpLoad %235 
                                       f32_3 %275 = OpFMul %273 %274 
                                                      OpStore %235 %275 
                                         f32 %278 = OpLoad %265 
                                       f32_3 %279 = OpCompositeConstruct %278 %278 %278 
                                       f32_3 %280 = OpLoad %235 
                                       f32_3 %281 = OpFMul %279 %280 
                                       f32_4 %282 = OpLoad %277 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 6 3 
                                                      OpStore %277 %283 
                                Private f32* %284 = OpAccessChain %41 %233 
                                         f32 %285 = OpLoad %284 
                                 Output f32* %287 = OpAccessChain %277 %233 
                                                      OpStore %287 %285 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0.xy = in_POSITION0.xy / in_POSITION0.ww;
    u_xlat4.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat4.xy * u_xlat0.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xy;
    u_xlat0.xy = u_xlat0.xy * in_POSITION0.ww;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = _PixelHeight * _Threshold;
    u_xlat1.x = (-u_xlat1.x) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 190
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %125 %136 %137 %173 %179 %182 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpDecorate %26 ArrayStride 26 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %92 Location 92 
                                                      OpMemberDecorate %123 0 BuiltIn 123 
                                                      OpMemberDecorate %123 1 BuiltIn 123 
                                                      OpMemberDecorate %123 2 BuiltIn 123 
                                                      OpDecorate %123 Block 
                                                      OpDecorate %136 Location 136 
                                                      OpDecorate %137 Location 137 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %182 Location 182 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %20 = OpTypePointer Private %12 
                               Private f32_2* %21 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeArray %7 %23 
                                              %26 = OpTypeArray %7 %23 
                                              %27 = OpTypeStruct %7 %24 %25 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Uniform %7 
                                          f32 %36 = OpConstant 3.67402E-40 
                                        f32_2 %37 = OpConstantComposite %36 %36 
                               Private f32_4* %63 = OpVariable Private 
                                          i32 %66 = OpConstant 1 
                                          i32 %77 = OpConstant 2 
                                          i32 %86 = OpConstant 3 
                                              %90 = OpTypeVector %6 3 
                                              %91 = OpTypePointer Output %90 
                                Output f32_3* %92 = OpVariable Output 
                                         u32 %121 = OpConstant 1 
                                             %122 = OpTypeArray %6 %121 
                                             %123 = OpTypeStruct %7 %6 %122 
                                             %124 = OpTypePointer Output %123 
        Output struct {f32_4; f32; f32[1];}* %125 = OpVariable Output 
                                             %133 = OpTypePointer Output %7 
                                             %135 = OpTypePointer Output %12 
                               Output f32_2* %136 = OpVariable Output 
                                Input f32_4* %137 = OpVariable Input 
                                         i32 %140 = OpConstant 4 
                                         u32 %149 = OpConstant 2 
                                             %150 = OpTypePointer Uniform %6 
                                         u32 %154 = OpConstant 0 
                                             %155 = OpTypePointer Private %6 
                                Private f32* %165 = OpVariable Private 
                               Output f32_3* %173 = OpVariable Output 
                               Output f32_4* %179 = OpVariable Output 
                                         f32 %180 = OpConstant 3.67402E-40 
                                       f32_4 %181 = OpConstantComposite %180 %180 %180 %180 
                               Output f32_3* %182 = OpVariable Output 
                                       f32_3 %183 = OpConstantComposite %180 %180 %180 
                                             %184 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_4 %15 = OpLoad %11 
                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                        f32_2 %17 = OpFDiv %14 %16 
                                        f32_4 %18 = OpLoad %9 
                                        f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                      OpStore %9 %19 
                               Uniform f32_4* %33 = OpAccessChain %29 %31 
                                        f32_4 %34 = OpLoad %33 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                                        f32_2 %38 = OpFMul %35 %37 
                                                      OpStore %21 %38 
                                        f32_2 %39 = OpLoad %21 
                                        f32_4 %40 = OpLoad %9 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpExtInst %1 2 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_4 %49 = OpVectorShuffle %48 %47 4 5 2 3 
                                                      OpStore %9 %49 
                                        f32_4 %50 = OpLoad %9 
                                        f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                        f32_2 %52 = OpLoad %21 
                                        f32_2 %53 = OpFDiv %51 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %9 %55 
                                        f32_4 %56 = OpLoad %9 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_4 %58 = OpLoad %11 
                                        f32_2 %59 = OpVectorShuffle %58 %58 3 3 
                                        f32_2 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_4 %62 = OpVectorShuffle %61 %60 4 5 2 3 
                                                      OpStore %9 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                               Uniform f32_4* %67 = OpAccessChain %29 %66 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpFMul %65 %68 
                                                      OpStore %63 %69 
                               Uniform f32_4* %70 = OpAccessChain %29 %66 %31 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 0 0 0 0 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %63 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %9 %76 
                               Uniform f32_4* %78 = OpAccessChain %29 %66 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %11 
                                        f32_4 %81 = OpVectorShuffle %80 %80 2 2 2 2 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %9 %84 
                                        f32_4 %85 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %29 %66 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %85 %88 
                                                      OpStore %63 %89 
                               Uniform f32_4* %93 = OpAccessChain %29 %66 %86 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_4 %96 = OpLoad %11 
                                        f32_3 %97 = OpVectorShuffle %96 %96 3 3 3 
                                        f32_3 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %9 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFAdd %98 %100 
                                                      OpStore %92 %101 
                                       f32_4 %102 = OpLoad %63 
                                       f32_4 %103 = OpVectorShuffle %102 %102 1 1 1 1 
                              Uniform f32_4* %104 = OpAccessChain %29 %86 %66 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpFMul %103 %105 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %29 %86 %31 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpLoad %63 
                                       f32_4 %110 = OpVectorShuffle %109 %109 0 0 0 0 
                                       f32_4 %111 = OpFMul %108 %110 
                                       f32_4 %112 = OpLoad %9 
                                       f32_4 %113 = OpFAdd %111 %112 
                                                      OpStore %9 %113 
                              Uniform f32_4* %114 = OpAccessChain %29 %86 %77 
                                       f32_4 %115 = OpLoad %114 
                                       f32_4 %116 = OpLoad %63 
                                       f32_4 %117 = OpVectorShuffle %116 %116 2 2 2 2 
                                       f32_4 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpFAdd %118 %119 
                                                      OpStore %9 %120 
                              Uniform f32_4* %126 = OpAccessChain %29 %86 %86 
                                       f32_4 %127 = OpLoad %126 
                                       f32_4 %128 = OpLoad %63 
                                       f32_4 %129 = OpVectorShuffle %128 %128 3 3 3 3 
                                       f32_4 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpFAdd %130 %131 
                               Output f32_4* %134 = OpAccessChain %125 %31 
                                                      OpStore %134 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
                              Uniform f32_4* %141 = OpAccessChain %29 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                                       f32_2 %144 = OpFMul %139 %143 
                              Uniform f32_4* %145 = OpAccessChain %29 %140 
                                       f32_4 %146 = OpLoad %145 
                                       f32_2 %147 = OpVectorShuffle %146 %146 2 3 
                                       f32_2 %148 = OpFAdd %144 %147 
                                                      OpStore %136 %148 
                                Uniform f32* %151 = OpAccessChain %29 %77 %31 %149 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFNegate %152 
                                Private f32* %156 = OpAccessChain %9 %154 
                                                      OpStore %156 %153 
                                Uniform f32* %157 = OpAccessChain %29 %77 %66 %149 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFNegate %158 
                                Private f32* %160 = OpAccessChain %9 %121 
                                                      OpStore %160 %159 
                                Uniform f32* %161 = OpAccessChain %29 %77 %77 %149 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                Private f32* %164 = OpAccessChain %9 %149 
                                                      OpStore %164 %163 
                                       f32_4 %166 = OpLoad %9 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                         f32 %170 = OpDot %167 %169 
                                                      OpStore %165 %170 
                                         f32 %171 = OpLoad %165 
                                         f32 %172 = OpExtInst %1 32 %171 
                                                      OpStore %165 %172 
                                         f32 %174 = OpLoad %165 
                                       f32_3 %175 = OpCompositeConstruct %174 %174 %174 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %178 = OpFMul %175 %177 
                                                      OpStore %173 %178 
                                                      OpStore %179 %181 
                                                      OpStore %182 %183 
                                 Output f32* %185 = OpAccessChain %125 %31 %121 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFNegate %186 
                                 Output f32* %188 = OpAccessChain %125 %31 %121 
                                                      OpStore %188 %187 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 226
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %46 %89 %201 %214 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 ArrayStride 23 
                                                      OpMemberDecorate %25 0 RelaxedPrecision 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpMemberDecorate %25 1 RelaxedPrecision 
                                                      OpMemberDecorate %25 1 Offset 25 
                                                      OpMemberDecorate %25 2 Offset 25 
                                                      OpMemberDecorate %25 3 Offset 25 
                                                      OpMemberDecorate %25 4 Offset 25 
                                                      OpMemberDecorate %25 5 Offset 25 
                                                      OpMemberDecorate %25 6 RelaxedPrecision 
                                                      OpMemberDecorate %25 6 Offset 25 
                                                      OpMemberDecorate %25 7 Offset 25 
                                                      OpMemberDecorate %25 8 Offset 25 
                                                      OpDecorate %25 Block 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %170 DescriptorSet 170 
                                                      OpDecorate %170 Binding 170 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 Location 201 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %214 Location 214 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeInt 32 0 
                                          u32 %22 = OpConstant 4 
                                              %23 = OpTypeArray %7 %22 
                                              %24 = OpTypeVector %6 3 
                                              %25 = OpTypeStruct %7 %7 %7 %23 %24 %24 %7 %6 %6 
                                              %26 = OpTypePointer Uniform %25 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 8 
                                              %30 = OpTypePointer Uniform %6 
                                          i32 %33 = OpConstant 7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %24 
                                 Input f32_3* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %58 = OpConstant 3.67402E-40 
                                          i32 %61 = OpConstant 0 
                                          i32 %62 = OpConstant 1 
                                          i32 %64 = OpConstant -1 
                                          i32 %70 = OpConstant 2 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                              %87 = OpTypePointer Private %24 
                               Private f32_3* %88 = OpVariable Private 
                                 Input f32_3* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 3 
                                              %93 = OpTypePointer Uniform %7 
                                             %119 = OpTypePointer Function %24 
                                         i32 %132 = OpConstant 5 
                                             %133 = OpTypePointer Uniform %24 
                                         i32 %142 = OpConstant 4 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                Private f32* %155 = OpVariable Private 
                                         u32 %156 = OpConstant 2 
                                         f32 %159 = OpConstant 3.67402E-40 
                                             %167 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %168 = OpTypeSampledImage %167 
                                             %169 = OpTypePointer UniformConstant %168 
 UniformConstant read_only Texture3DSampled* %170 = OpVariable UniformConstant 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %181 = OpConstant 3 
                              Private f32_3* %183 = OpVariable Private 
                                         i32 %195 = OpConstant 6 
                                Private f32* %200 = OpVariable Private 
                                Input f32_3* %201 = OpVariable Input 
                                             %213 = OpTypePointer Output %7 
                               Output f32_4* %214 = OpVariable Output 
                                             %223 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %120 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %31 = OpAccessChain %27 %29 
                                          f32 %32 = OpLoad %31 
                                 Uniform f32* %34 = OpAccessChain %27 %33 
                                          f32 %35 = OpLoad %34 
                                          f32 %36 = OpFMul %32 %35 
                                 Private f32* %39 = OpAccessChain %20 %37 
                                                      OpStore %39 %36 
                                 Private f32* %40 = OpAccessChain %20 %37 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFMul %42 %43 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %44 %50 
                                 Private f32* %52 = OpAccessChain %20 %37 
                                                      OpStore %52 %51 
                                 Private f32* %56 = OpAccessChain %20 %37 
                                          f32 %57 = OpLoad %56 
                                         bool %59 = OpFOrdLessThan %57 %58 
                                                      OpStore %55 %59 
                                         bool %60 = OpLoad %55 
                                          i32 %63 = OpSelect %60 %62 %61 
                                          i32 %65 = OpIMul %63 %64 
                                         bool %66 = OpINotEqual %65 %61 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %68 
                                              %67 = OpLabel 
                                                      OpKill
                                              %68 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %27 %70 %37 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %55 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %55 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %177 
                                              %82 = OpLabel 
                                 Uniform f32* %84 = OpAccessChain %27 %70 %47 
                                          f32 %85 = OpLoad %84 
                                         bool %86 = OpFOrdEqual %85 %73 
                                                      OpStore %55 %86 
                                        f32_3 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 1 1 1 
                               Uniform f32_4* %94 = OpAccessChain %27 %92 %62 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFMul %91 %96 
                                                      OpStore %88 %97 
                               Uniform f32_4* %98 = OpAccessChain %27 %92 %61 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpLoad %89 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_3 %104 = OpLoad %88 
                                       f32_3 %105 = OpFAdd %103 %104 
                                                      OpStore %88 %105 
                              Uniform f32_4* %106 = OpAccessChain %27 %92 %70 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpLoad %89 
                                       f32_3 %110 = OpVectorShuffle %109 %109 2 2 2 
                                       f32_3 %111 = OpFMul %108 %110 
                                       f32_3 %112 = OpLoad %88 
                                       f32_3 %113 = OpFAdd %111 %112 
                                                      OpStore %88 %113 
                                       f32_3 %114 = OpLoad %88 
                              Uniform f32_4* %115 = OpAccessChain %27 %92 %92 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                                      OpStore %88 %118 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %125 
                                             %122 = OpLabel 
                                       f32_3 %124 = OpLoad %88 
                                                      OpStore %120 %124 
                                                      OpBranch %123 
                                             %125 = OpLabel 
                                       f32_3 %126 = OpLoad %89 
                                                      OpStore %120 %126 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_3 %127 = OpLoad %120 
                                       f32_4 %128 = OpLoad %20 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %20 %129 
                                       f32_4 %130 = OpLoad %20 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %27 %132 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFNegate %135 
                                       f32_3 %137 = OpFAdd %131 %136 
                                       f32_4 %138 = OpLoad %20 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %20 %139 
                                       f32_4 %140 = OpLoad %20 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %27 %142 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFMul %141 %144 
                                       f32_4 %146 = OpLoad %20 
                                       f32_4 %147 = OpVectorShuffle %146 %145 0 4 5 6 
                                                      OpStore %20 %147 
                                Private f32* %148 = OpAccessChain %20 %47 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %153 = OpFAdd %151 %152 
                                Private f32* %154 = OpAccessChain %88 %37 
                                                      OpStore %154 %153 
                                Uniform f32* %157 = OpAccessChain %27 %70 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                         f32 %161 = OpFAdd %160 %152 
                                                      OpStore %155 %161 
                                Private f32* %162 = OpAccessChain %88 %37 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpLoad %155 
                                         f32 %165 = OpExtInst %1 40 %163 %164 
                                Private f32* %166 = OpAccessChain %20 %37 
                                                      OpStore %166 %165 
                  read_only Texture3DSampled %171 = OpLoad %170 
                                       f32_4 %172 = OpLoad %20 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 2 3 
                                       f32_4 %174 = OpImageSampleImplicitLod %171 %173 
                                                      OpStore %20 %174 
                                       f32_4 %176 = OpLoad %20 
                                                      OpStore %175 %176 
                                                      OpBranch %83 
                                             %177 = OpLabel 
                                Private f32* %178 = OpAccessChain %175 %37 
                                                      OpStore %178 %73 
                                Private f32* %179 = OpAccessChain %175 %47 
                                                      OpStore %179 %73 
                                Private f32* %180 = OpAccessChain %175 %156 
                                                      OpStore %180 %73 
                                Private f32* %182 = OpAccessChain %175 %181 
                                                      OpStore %182 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %184 = OpLoad %175 
                              Uniform f32_4* %185 = OpAccessChain %27 %62 
                                       f32_4 %186 = OpLoad %185 
                                         f32 %187 = OpDot %184 %186 
                                Private f32* %188 = OpAccessChain %183 %37 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %183 %37 
                                         f32 %190 = OpLoad %189 
                                         f32 %191 = OpExtInst %1 43 %190 %58 %73 
                                Private f32* %192 = OpAccessChain %183 %37 
                                                      OpStore %192 %191 
                                       f32_3 %193 = OpLoad %183 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 0 0 
                              Uniform f32_4* %196 = OpAccessChain %27 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFMul %194 %198 
                                                      OpStore %183 %199 
                                       f32_3 %202 = OpLoad %201 
                              Uniform f32_4* %203 = OpAccessChain %27 %61 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                         f32 %206 = OpDot %202 %205 
                                                      OpStore %200 %206 
                                         f32 %207 = OpLoad %200 
                                         f32 %208 = OpExtInst %1 40 %207 %58 
                                                      OpStore %200 %208 
                                       f32_4 %209 = OpLoad %9 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                                       f32_3 %211 = OpLoad %183 
                                       f32_3 %212 = OpFMul %210 %211 
                                                      OpStore %183 %212 
                                         f32 %215 = OpLoad %200 
                                       f32_3 %216 = OpCompositeConstruct %215 %215 %215 
                                       f32_3 %217 = OpLoad %183 
                                       f32_3 %218 = OpFMul %216 %217 
                                       f32_4 %219 = OpLoad %214 
                                       f32_4 %220 = OpVectorShuffle %219 %218 4 5 6 3 
                                                      OpStore %214 %220 
                                Private f32* %221 = OpAccessChain %9 %181 
                                         f32 %222 = OpLoad %221 
                                 Output f32* %224 = OpAccessChain %214 %181 
                                                      OpStore %224 %222 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0.xy = in_POSITION0.xy / in_POSITION0.ww;
    u_xlat4.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat4.xy * u_xlat0.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xy;
    u_xlat0.xy = u_xlat0.xy * in_POSITION0.ww;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec2 u_xlat8;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat15 = _PixelHeight * _Threshold;
    u_xlat15 = (-u_xlat15) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb15 = u_xlat15<0.0;
    if((int(u_xlatb15) * int(0xffffffffu))!=0){discard;}
    u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb15){
        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb15)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat15 = u_xlat3.y * 0.25 + 0.75;
        u_xlat8.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat15, u_xlat8.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat15 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlatb3 = 0.0<u_xlat2.z;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat8.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
    u_xlat10_4 = texture(_LightTexture0, u_xlat8.xy);
    u_xlat17 = u_xlat3.x * u_xlat10_4.w;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_3 = texture(_LightTextureB0, u_xlat2.xx);
    u_xlat2.x = u_xlat17 * u_xlat10_3.w;
    u_xlat15 = u_xlat15 * u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat15) * _LightColor0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat5.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SPOT" "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 190
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %125 %136 %137 %173 %179 %182 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpDecorate %26 ArrayStride 26 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %92 Location 92 
                                                      OpMemberDecorate %123 0 BuiltIn 123 
                                                      OpMemberDecorate %123 1 BuiltIn 123 
                                                      OpMemberDecorate %123 2 BuiltIn 123 
                                                      OpDecorate %123 Block 
                                                      OpDecorate %136 Location 136 
                                                      OpDecorate %137 Location 137 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %182 Location 182 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %20 = OpTypePointer Private %12 
                               Private f32_2* %21 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeArray %7 %23 
                                              %26 = OpTypeArray %7 %23 
                                              %27 = OpTypeStruct %7 %24 %25 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Uniform %7 
                                          f32 %36 = OpConstant 3.67402E-40 
                                        f32_2 %37 = OpConstantComposite %36 %36 
                               Private f32_4* %63 = OpVariable Private 
                                          i32 %66 = OpConstant 1 
                                          i32 %77 = OpConstant 2 
                                          i32 %86 = OpConstant 3 
                                              %90 = OpTypeVector %6 3 
                                              %91 = OpTypePointer Output %90 
                                Output f32_3* %92 = OpVariable Output 
                                         u32 %121 = OpConstant 1 
                                             %122 = OpTypeArray %6 %121 
                                             %123 = OpTypeStruct %7 %6 %122 
                                             %124 = OpTypePointer Output %123 
        Output struct {f32_4; f32; f32[1];}* %125 = OpVariable Output 
                                             %133 = OpTypePointer Output %7 
                                             %135 = OpTypePointer Output %12 
                               Output f32_2* %136 = OpVariable Output 
                                Input f32_4* %137 = OpVariable Input 
                                         i32 %140 = OpConstant 4 
                                         u32 %149 = OpConstant 2 
                                             %150 = OpTypePointer Uniform %6 
                                         u32 %154 = OpConstant 0 
                                             %155 = OpTypePointer Private %6 
                                Private f32* %165 = OpVariable Private 
                               Output f32_3* %173 = OpVariable Output 
                               Output f32_4* %179 = OpVariable Output 
                                         f32 %180 = OpConstant 3.67402E-40 
                                       f32_4 %181 = OpConstantComposite %180 %180 %180 %180 
                               Output f32_3* %182 = OpVariable Output 
                                       f32_3 %183 = OpConstantComposite %180 %180 %180 
                                             %184 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_4 %15 = OpLoad %11 
                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                        f32_2 %17 = OpFDiv %14 %16 
                                        f32_4 %18 = OpLoad %9 
                                        f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                      OpStore %9 %19 
                               Uniform f32_4* %33 = OpAccessChain %29 %31 
                                        f32_4 %34 = OpLoad %33 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                                        f32_2 %38 = OpFMul %35 %37 
                                                      OpStore %21 %38 
                                        f32_2 %39 = OpLoad %21 
                                        f32_4 %40 = OpLoad %9 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpExtInst %1 2 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_4 %49 = OpVectorShuffle %48 %47 4 5 2 3 
                                                      OpStore %9 %49 
                                        f32_4 %50 = OpLoad %9 
                                        f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                        f32_2 %52 = OpLoad %21 
                                        f32_2 %53 = OpFDiv %51 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %9 %55 
                                        f32_4 %56 = OpLoad %9 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_4 %58 = OpLoad %11 
                                        f32_2 %59 = OpVectorShuffle %58 %58 3 3 
                                        f32_2 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_4 %62 = OpVectorShuffle %61 %60 4 5 2 3 
                                                      OpStore %9 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                               Uniform f32_4* %67 = OpAccessChain %29 %66 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpFMul %65 %68 
                                                      OpStore %63 %69 
                               Uniform f32_4* %70 = OpAccessChain %29 %66 %31 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 0 0 0 0 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %63 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %9 %76 
                               Uniform f32_4* %78 = OpAccessChain %29 %66 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %11 
                                        f32_4 %81 = OpVectorShuffle %80 %80 2 2 2 2 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %9 %84 
                                        f32_4 %85 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %29 %66 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %85 %88 
                                                      OpStore %63 %89 
                               Uniform f32_4* %93 = OpAccessChain %29 %66 %86 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_4 %96 = OpLoad %11 
                                        f32_3 %97 = OpVectorShuffle %96 %96 3 3 3 
                                        f32_3 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %9 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFAdd %98 %100 
                                                      OpStore %92 %101 
                                       f32_4 %102 = OpLoad %63 
                                       f32_4 %103 = OpVectorShuffle %102 %102 1 1 1 1 
                              Uniform f32_4* %104 = OpAccessChain %29 %86 %66 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpFMul %103 %105 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %29 %86 %31 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpLoad %63 
                                       f32_4 %110 = OpVectorShuffle %109 %109 0 0 0 0 
                                       f32_4 %111 = OpFMul %108 %110 
                                       f32_4 %112 = OpLoad %9 
                                       f32_4 %113 = OpFAdd %111 %112 
                                                      OpStore %9 %113 
                              Uniform f32_4* %114 = OpAccessChain %29 %86 %77 
                                       f32_4 %115 = OpLoad %114 
                                       f32_4 %116 = OpLoad %63 
                                       f32_4 %117 = OpVectorShuffle %116 %116 2 2 2 2 
                                       f32_4 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpFAdd %118 %119 
                                                      OpStore %9 %120 
                              Uniform f32_4* %126 = OpAccessChain %29 %86 %86 
                                       f32_4 %127 = OpLoad %126 
                                       f32_4 %128 = OpLoad %63 
                                       f32_4 %129 = OpVectorShuffle %128 %128 3 3 3 3 
                                       f32_4 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpFAdd %130 %131 
                               Output f32_4* %134 = OpAccessChain %125 %31 
                                                      OpStore %134 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
                              Uniform f32_4* %141 = OpAccessChain %29 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                                       f32_2 %144 = OpFMul %139 %143 
                              Uniform f32_4* %145 = OpAccessChain %29 %140 
                                       f32_4 %146 = OpLoad %145 
                                       f32_2 %147 = OpVectorShuffle %146 %146 2 3 
                                       f32_2 %148 = OpFAdd %144 %147 
                                                      OpStore %136 %148 
                                Uniform f32* %151 = OpAccessChain %29 %77 %31 %149 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFNegate %152 
                                Private f32* %156 = OpAccessChain %9 %154 
                                                      OpStore %156 %153 
                                Uniform f32* %157 = OpAccessChain %29 %77 %66 %149 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFNegate %158 
                                Private f32* %160 = OpAccessChain %9 %121 
                                                      OpStore %160 %159 
                                Uniform f32* %161 = OpAccessChain %29 %77 %77 %149 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                Private f32* %164 = OpAccessChain %9 %149 
                                                      OpStore %164 %163 
                                       f32_4 %166 = OpLoad %9 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                         f32 %170 = OpDot %167 %169 
                                                      OpStore %165 %170 
                                         f32 %171 = OpLoad %165 
                                         f32 %172 = OpExtInst %1 32 %171 
                                                      OpStore %165 %172 
                                         f32 %174 = OpLoad %165 
                                       f32_3 %175 = OpCompositeConstruct %174 %174 %174 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %178 = OpFMul %175 %177 
                                                      OpStore %173 %178 
                                                      OpStore %179 %181 
                                                      OpStore %182 %183 
                                 Output f32* %185 = OpAccessChain %125 %31 %121 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFNegate %186 
                                 Output f32* %188 = OpAccessChain %125 %31 %121 
                                                      OpStore %188 %187 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 320
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %49 %64 %297 %308 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 Location 49 
                                                      OpDecorate %64 Location 64 
                                                      OpDecorate %123 SpecId 123 
                                                      OpDecorate %218 DescriptorSet 218 
                                                      OpDecorate %218 Binding 218 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %262 DescriptorSet 262 
                                                      OpDecorate %262 Binding 262 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %275 DescriptorSet 275 
                                                      OpDecorate %275 Binding 275 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 Location 297 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %308 Location 308 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_3* %11 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %14 %16 
                                              %18 = OpTypeArray %14 %16 
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %14 
                                              %29 = OpTypePointer Private %6 
                                 Private f32* %30 = OpVariable Private 
                                              %40 = OpTypePointer Private %14 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %43 = OpTypeSampledImage %42 
                                              %44 = OpTypePointer UniformConstant %43 
  UniformConstant read_only Texture2DSampled* %45 = OpVariable UniformConstant 
                                              %47 = OpTypeVector %6 2 
                                              %48 = OpTypePointer Input %47 
                                 Input f32_2* %49 = OpVariable Input 
                                          i32 %52 = OpConstant 9 
                                              %53 = OpTypePointer Uniform %6 
                                          i32 %56 = OpConstant 8 
                                          f32 %62 = OpConstant 3.67402E-40 
                                 Input f32_3* %64 = OpVariable Input 
                                          u32 %65 = OpConstant 1 
                                              %66 = OpTypePointer Input %6 
                                              %70 = OpTypeBool 
                                              %71 = OpTypePointer Private %70 
                                Private bool* %72 = OpVariable Private 
                                          f32 %74 = OpConstant 3.67402E-40 
                                          i32 %77 = OpConstant 1 
                                          i32 %79 = OpConstant -1 
                               Private f32_4* %85 = OpVariable Private 
                                          i32 %88 = OpConstant 7 
                                          i32 %99 = OpConstant 2 
                                         i32 %108 = OpConstant 3 
                                         u32 %112 = OpConstant 0 
                                         f32 %115 = OpConstant 3.67402E-40 
                                        bool %117 = OpConstantFalse 
                                        bool %123 = OpSpecConstantFalse 
                              Private f32_4* %129 = OpVariable Private 
                                             %168 = OpTypePointer Function %7 
                                         i32 %182 = OpConstant 5 
                                             %183 = OpTypePointer Uniform %7 
                                         i32 %192 = OpConstant 4 
                                         f32 %200 = OpConstant 3.67402E-40 
                                         f32 %202 = OpConstant 3.67402E-40 
                                Private f32* %204 = OpVariable Private 
                                         u32 %205 = OpConstant 2 
                                         f32 %208 = OpConstant 3.67402E-40 
                                             %215 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %216 = OpTypeSampledImage %215 
                                             %217 = OpTypePointer UniformConstant %216 
 UniformConstant read_only Texture3DSampled* %218 = OpVariable UniformConstant 
                              Private f32_4* %223 = OpVariable Private 
                                         u32 %229 = OpConstant 3 
                              Private f32_3* %231 = OpVariable Private 
                                Private f32* %244 = OpVariable Private 
                                             %245 = OpTypePointer Function %6 
                                             %252 = OpTypePointer Private %47 
                              Private f32_2* %253 = OpVariable Private 
                                       f32_2 %260 = OpConstantComposite %208 %208 
 UniformConstant read_only Texture2DSampled* %262 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %275 = OpVariable UniformConstant 
                                         i32 %291 = OpConstant 6 
                                Private f32* %296 = OpVariable Private 
                                Input f32_3* %297 = OpVariable Input 
                                             %307 = OpTypePointer Output %14 
                               Output f32_4* %308 = OpVariable Output 
                                             %317 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %169 = OpVariable Function 
                               Function f32* %246 = OpVariable Function 
                                        f32_3 %12 = OpLoad %11 
                                        f32_3 %13 = OpFNegate %12 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFAdd %13 %27 
                                                      OpStore %9 %28 
                                        f32_3 %31 = OpLoad %9 
                                        f32_3 %32 = OpLoad %9 
                                          f32 %33 = OpDot %31 %32 
                                                      OpStore %30 %33 
                                          f32 %34 = OpLoad %30 
                                          f32 %35 = OpExtInst %1 32 %34 
                                                      OpStore %30 %35 
                                          f32 %36 = OpLoad %30 
                                        f32_3 %37 = OpCompositeConstruct %36 %36 %36 
                                        f32_3 %38 = OpLoad %9 
                                        f32_3 %39 = OpFMul %37 %38 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %46 = OpLoad %45 
                                        f32_2 %50 = OpLoad %49 
                                        f32_4 %51 = OpImageSampleImplicitLod %46 %50 
                                                      OpStore %41 %51 
                                 Uniform f32* %54 = OpAccessChain %21 %52 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %57 = OpAccessChain %21 %56 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpFMul %55 %58 
                                                      OpStore %30 %59 
                                          f32 %60 = OpLoad %30 
                                          f32 %61 = OpFNegate %60 
                                          f32 %63 = OpFMul %61 %62 
                                   Input f32* %67 = OpAccessChain %64 %65 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpFAdd %63 %68 
                                                      OpStore %30 %69 
                                          f32 %73 = OpLoad %30 
                                         bool %75 = OpFOrdLessThan %73 %74 
                                                      OpStore %72 %75 
                                         bool %76 = OpLoad %72 
                                          i32 %78 = OpSelect %76 %77 %23 
                                          i32 %80 = OpIMul %78 %79 
                                         bool %81 = OpINotEqual %80 %23 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %83 
                                              %82 = OpLabel 
                                                      OpKill
                                              %83 = OpLabel 
                                        f32_3 %86 = OpLoad %11 
                                        f32_4 %87 = OpVectorShuffle %86 %86 1 1 1 1 
                               Uniform f32_4* %89 = OpAccessChain %21 %88 %77 
                                        f32_4 %90 = OpLoad %89 
                                        f32_4 %91 = OpFMul %87 %90 
                                                      OpStore %85 %91 
                               Uniform f32_4* %92 = OpAccessChain %21 %88 %23 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpLoad %11 
                                        f32_4 %95 = OpVectorShuffle %94 %94 0 0 0 0 
                                        f32_4 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %85 
                                        f32_4 %98 = OpFAdd %96 %97 
                                                      OpStore %85 %98 
                              Uniform f32_4* %100 = OpAccessChain %21 %88 %99 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpLoad %11 
                                       f32_4 %103 = OpVectorShuffle %102 %102 2 2 2 2 
                                       f32_4 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %85 
                                       f32_4 %106 = OpFAdd %104 %105 
                                                      OpStore %85 %106 
                                       f32_4 %107 = OpLoad %85 
                              Uniform f32_4* %109 = OpAccessChain %21 %88 %108 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpFAdd %107 %110 
                                                      OpStore %85 %111 
                                Uniform f32* %113 = OpAccessChain %21 %99 %112 
                                         f32 %114 = OpLoad %113 
                                        bool %116 = OpFOrdEqual %114 %115 
                                                      OpStore %72 %116 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                        bool %120 = OpLoad %72 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %122 
                                             %121 = OpLabel 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                                      OpBranch %119 
                                             %119 = OpLabel 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %123 %124 %225 
                                             %124 = OpLabel 
                                Uniform f32* %126 = OpAccessChain %21 %99 %65 
                                         f32 %127 = OpLoad %126 
                                        bool %128 = OpFOrdEqual %127 %115 
                                                      OpStore %72 %128 
                                       f32_3 %130 = OpLoad %11 
                                       f32_3 %131 = OpVectorShuffle %130 %130 1 1 1 
                              Uniform f32_4* %132 = OpAccessChain %21 %108 %77 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFMul %131 %134 
                                       f32_4 %136 = OpLoad %129 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                      OpStore %129 %137 
                              Uniform f32_4* %138 = OpAccessChain %21 %108 %23 
                                       f32_4 %139 = OpLoad %138 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpLoad %11 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 0 0 
                                       f32_3 %143 = OpFMul %140 %142 
                                       f32_4 %144 = OpLoad %129 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_3 %146 = OpFAdd %143 %145 
                                       f32_4 %147 = OpLoad %129 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %129 %148 
                              Uniform f32_4* %149 = OpAccessChain %21 %108 %99 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpLoad %11 
                                       f32_3 %153 = OpVectorShuffle %152 %152 2 2 2 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_4 %155 = OpLoad %129 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                       f32_3 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %129 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 6 3 
                                                      OpStore %129 %159 
                                       f32_4 %160 = OpLoad %129 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                              Uniform f32_4* %162 = OpAccessChain %21 %108 %108 
                                       f32_4 %163 = OpLoad %162 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFAdd %161 %164 
                                       f32_4 %166 = OpLoad %129 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %129 %167 
                                        bool %170 = OpLoad %72 
                                                      OpSelectionMerge %172 None 
                                                      OpBranchConditional %170 %171 %175 
                                             %171 = OpLabel 
                                       f32_4 %173 = OpLoad %129 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                                      OpStore %169 %174 
                                                      OpBranch %172 
                                             %175 = OpLabel 
                                       f32_3 %176 = OpLoad %11 
                                                      OpStore %169 %176 
                                                      OpBranch %172 
                                             %172 = OpLabel 
                                       f32_3 %177 = OpLoad %169 
                                       f32_4 %178 = OpLoad %129 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 6 3 
                                                      OpStore %129 %179 
                                       f32_4 %180 = OpLoad %129 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                              Uniform f32_3* %184 = OpAccessChain %21 %182 
                                       f32_3 %185 = OpLoad %184 
                                       f32_3 %186 = OpFNegate %185 
                                       f32_3 %187 = OpFAdd %181 %186 
                                       f32_4 %188 = OpLoad %129 
                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
                                                      OpStore %129 %189 
                                       f32_4 %190 = OpLoad %129 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                              Uniform f32_3* %193 = OpAccessChain %21 %192 
                                       f32_3 %194 = OpLoad %193 
                                       f32_3 %195 = OpFMul %191 %194 
                                       f32_4 %196 = OpLoad %129 
                                       f32_4 %197 = OpVectorShuffle %196 %195 0 4 5 6 
                                                      OpStore %129 %197 
                                Private f32* %198 = OpAccessChain %129 %65 
                                         f32 %199 = OpLoad %198 
                                         f32 %201 = OpFMul %199 %200 
                                         f32 %203 = OpFAdd %201 %202 
                                                      OpStore %30 %203 
                                Uniform f32* %206 = OpAccessChain %21 %99 %205 
                                         f32 %207 = OpLoad %206 
                                         f32 %209 = OpFMul %207 %208 
                                         f32 %210 = OpFAdd %209 %202 
                                                      OpStore %204 %210 
                                         f32 %211 = OpLoad %30 
                                         f32 %212 = OpLoad %204 
                                         f32 %213 = OpExtInst %1 40 %211 %212 
                                Private f32* %214 = OpAccessChain %129 %112 
                                                      OpStore %214 %213 
                  read_only Texture3DSampled %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %129 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 2 3 
                                       f32_4 %222 = OpImageSampleImplicitLod %219 %221 
                                                      OpStore %129 %222 
                                       f32_4 %224 = OpLoad %129 
                                                      OpStore %223 %224 
                                                      OpBranch %125 
                                             %225 = OpLabel 
                                Private f32* %226 = OpAccessChain %223 %112 
                                                      OpStore %226 %115 
                                Private f32* %227 = OpAccessChain %223 %65 
                                                      OpStore %227 %115 
                                Private f32* %228 = OpAccessChain %223 %205 
                                                      OpStore %228 %115 
                                Private f32* %230 = OpAccessChain %223 %229 
                                                      OpStore %230 %115 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_4 %232 = OpLoad %223 
                              Uniform f32_4* %233 = OpAccessChain %21 %77 
                                       f32_4 %234 = OpLoad %233 
                                         f32 %235 = OpDot %232 %234 
                                Private f32* %236 = OpAccessChain %231 %112 
                                                      OpStore %236 %235 
                                Private f32* %237 = OpAccessChain %231 %112 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpExtInst %1 43 %238 %74 %115 
                                Private f32* %240 = OpAccessChain %231 %112 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %85 %205 
                                         f32 %242 = OpLoad %241 
                                        bool %243 = OpFOrdLessThan %74 %242 
                                                      OpStore %72 %243 
                                        bool %247 = OpLoad %72 
                                                      OpSelectionMerge %249 None 
                                                      OpBranchConditional %247 %248 %250 
                                             %248 = OpLabel 
                                                      OpStore %246 %115 
                                                      OpBranch %249 
                                             %250 = OpLabel 
                                                      OpStore %246 %74 
                                                      OpBranch %249 
                                             %249 = OpLabel 
                                         f32 %251 = OpLoad %246 
                                                      OpStore %244 %251 
                                       f32_4 %254 = OpLoad %85 
                                       f32_2 %255 = OpVectorShuffle %254 %254 0 1 
                                       f32_4 %256 = OpLoad %85 
                                       f32_2 %257 = OpVectorShuffle %256 %256 3 3 
                                       f32_2 %258 = OpFDiv %255 %257 
                                                      OpStore %253 %258 
                                       f32_2 %259 = OpLoad %253 
                                       f32_2 %261 = OpFAdd %259 %260 
                                                      OpStore %253 %261 
                  read_only Texture2DSampled %263 = OpLoad %262 
                                       f32_2 %264 = OpLoad %253 
                                       f32_4 %265 = OpImageSampleImplicitLod %263 %264 
                                         f32 %266 = OpCompositeExtract %265 3 
                                                      OpStore %30 %266 
                                         f32 %267 = OpLoad %30 
                                         f32 %268 = OpLoad %244 
                                         f32 %269 = OpFMul %267 %268 
                                                      OpStore %244 %269 
                                       f32_4 %270 = OpLoad %85 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                       f32_4 %272 = OpLoad %85 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                         f32 %274 = OpDot %271 %273 
                                                      OpStore %30 %274 
                  read_only Texture2DSampled %276 = OpLoad %275 
                                         f32 %277 = OpLoad %30 
                                       f32_2 %278 = OpCompositeConstruct %277 %277 
                                       f32_4 %279 = OpImageSampleImplicitLod %276 %278 
                                         f32 %280 = OpCompositeExtract %279 3 
                                                      OpStore %30 %280 
                                         f32 %281 = OpLoad %30 
                                         f32 %282 = OpLoad %244 
                                         f32 %283 = OpFMul %281 %282 
                                                      OpStore %244 %283 
                                Private f32* %284 = OpAccessChain %231 %112 
                                         f32 %285 = OpLoad %284 
                                         f32 %286 = OpLoad %244 
                                         f32 %287 = OpFMul %285 %286 
                                Private f32* %288 = OpAccessChain %231 %112 
                                                      OpStore %288 %287 
                                       f32_3 %289 = OpLoad %231 
                                       f32_3 %290 = OpVectorShuffle %289 %289 0 0 0 
                              Uniform f32_4* %292 = OpAccessChain %21 %291 
                                       f32_4 %293 = OpLoad %292 
                                       f32_3 %294 = OpVectorShuffle %293 %293 0 1 2 
                                       f32_3 %295 = OpFMul %290 %294 
                                                      OpStore %231 %295 
                                       f32_3 %298 = OpLoad %297 
                                       f32_3 %299 = OpLoad %9 
                                         f32 %300 = OpDot %298 %299 
                                                      OpStore %296 %300 
                                         f32 %301 = OpLoad %296 
                                         f32 %302 = OpExtInst %1 40 %301 %74 
                                                      OpStore %296 %302 
                                       f32_4 %303 = OpLoad %41 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 1 2 
                                       f32_3 %305 = OpLoad %231 
                                       f32_3 %306 = OpFMul %304 %305 
                                                      OpStore %231 %306 
                                         f32 %309 = OpLoad %296 
                                       f32_3 %310 = OpCompositeConstruct %309 %309 %309 
                                       f32_3 %311 = OpLoad %231 
                                       f32_3 %312 = OpFMul %310 %311 
                                       f32_4 %313 = OpLoad %308 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 5 6 3 
                                                      OpStore %308 %314 
                                Private f32* %315 = OpAccessChain %41 %229 
                                         f32 %316 = OpLoad %315 
                                 Output f32* %318 = OpAccessChain %308 %229 
                                                      OpStore %318 %316 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0.xy = in_POSITION0.xy / in_POSITION0.ww;
    u_xlat4.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat4.xy * u_xlat0.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xy;
    u_xlat0.xy = u_xlat0.xy * in_POSITION0.ww;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat16_2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
float u_xlat12;
bool u_xlatb12;
float u_xlat14;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat12 = _PixelHeight * _Threshold;
    u_xlat12 = (-u_xlat12) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb12 = u_xlat12<0.0;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb12)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat3.y * 0.25 + 0.75;
        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat12, u_xlat14);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat14));
    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xyz);
    u_xlat16_2 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat12 = u_xlat12 * u_xlat16_2;
    u_xlat2.xyz = vec3(u_xlat12) * _LightColor0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat4.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 190
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %125 %136 %137 %173 %179 %182 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpDecorate %26 ArrayStride 26 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %92 Location 92 
                                                      OpMemberDecorate %123 0 BuiltIn 123 
                                                      OpMemberDecorate %123 1 BuiltIn 123 
                                                      OpMemberDecorate %123 2 BuiltIn 123 
                                                      OpDecorate %123 Block 
                                                      OpDecorate %136 Location 136 
                                                      OpDecorate %137 Location 137 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %182 Location 182 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %20 = OpTypePointer Private %12 
                               Private f32_2* %21 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeArray %7 %23 
                                              %26 = OpTypeArray %7 %23 
                                              %27 = OpTypeStruct %7 %24 %25 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Uniform %7 
                                          f32 %36 = OpConstant 3.67402E-40 
                                        f32_2 %37 = OpConstantComposite %36 %36 
                               Private f32_4* %63 = OpVariable Private 
                                          i32 %66 = OpConstant 1 
                                          i32 %77 = OpConstant 2 
                                          i32 %86 = OpConstant 3 
                                              %90 = OpTypeVector %6 3 
                                              %91 = OpTypePointer Output %90 
                                Output f32_3* %92 = OpVariable Output 
                                         u32 %121 = OpConstant 1 
                                             %122 = OpTypeArray %6 %121 
                                             %123 = OpTypeStruct %7 %6 %122 
                                             %124 = OpTypePointer Output %123 
        Output struct {f32_4; f32; f32[1];}* %125 = OpVariable Output 
                                             %133 = OpTypePointer Output %7 
                                             %135 = OpTypePointer Output %12 
                               Output f32_2* %136 = OpVariable Output 
                                Input f32_4* %137 = OpVariable Input 
                                         i32 %140 = OpConstant 4 
                                         u32 %149 = OpConstant 2 
                                             %150 = OpTypePointer Uniform %6 
                                         u32 %154 = OpConstant 0 
                                             %155 = OpTypePointer Private %6 
                                Private f32* %165 = OpVariable Private 
                               Output f32_3* %173 = OpVariable Output 
                               Output f32_4* %179 = OpVariable Output 
                                         f32 %180 = OpConstant 3.67402E-40 
                                       f32_4 %181 = OpConstantComposite %180 %180 %180 %180 
                               Output f32_3* %182 = OpVariable Output 
                                       f32_3 %183 = OpConstantComposite %180 %180 %180 
                                             %184 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_4 %15 = OpLoad %11 
                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                        f32_2 %17 = OpFDiv %14 %16 
                                        f32_4 %18 = OpLoad %9 
                                        f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                      OpStore %9 %19 
                               Uniform f32_4* %33 = OpAccessChain %29 %31 
                                        f32_4 %34 = OpLoad %33 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                                        f32_2 %38 = OpFMul %35 %37 
                                                      OpStore %21 %38 
                                        f32_2 %39 = OpLoad %21 
                                        f32_4 %40 = OpLoad %9 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpExtInst %1 2 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_4 %49 = OpVectorShuffle %48 %47 4 5 2 3 
                                                      OpStore %9 %49 
                                        f32_4 %50 = OpLoad %9 
                                        f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                        f32_2 %52 = OpLoad %21 
                                        f32_2 %53 = OpFDiv %51 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %9 %55 
                                        f32_4 %56 = OpLoad %9 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_4 %58 = OpLoad %11 
                                        f32_2 %59 = OpVectorShuffle %58 %58 3 3 
                                        f32_2 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_4 %62 = OpVectorShuffle %61 %60 4 5 2 3 
                                                      OpStore %9 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                               Uniform f32_4* %67 = OpAccessChain %29 %66 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpFMul %65 %68 
                                                      OpStore %63 %69 
                               Uniform f32_4* %70 = OpAccessChain %29 %66 %31 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 0 0 0 0 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %63 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %9 %76 
                               Uniform f32_4* %78 = OpAccessChain %29 %66 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %11 
                                        f32_4 %81 = OpVectorShuffle %80 %80 2 2 2 2 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %9 %84 
                                        f32_4 %85 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %29 %66 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %85 %88 
                                                      OpStore %63 %89 
                               Uniform f32_4* %93 = OpAccessChain %29 %66 %86 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_4 %96 = OpLoad %11 
                                        f32_3 %97 = OpVectorShuffle %96 %96 3 3 3 
                                        f32_3 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %9 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFAdd %98 %100 
                                                      OpStore %92 %101 
                                       f32_4 %102 = OpLoad %63 
                                       f32_4 %103 = OpVectorShuffle %102 %102 1 1 1 1 
                              Uniform f32_4* %104 = OpAccessChain %29 %86 %66 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpFMul %103 %105 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %29 %86 %31 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpLoad %63 
                                       f32_4 %110 = OpVectorShuffle %109 %109 0 0 0 0 
                                       f32_4 %111 = OpFMul %108 %110 
                                       f32_4 %112 = OpLoad %9 
                                       f32_4 %113 = OpFAdd %111 %112 
                                                      OpStore %9 %113 
                              Uniform f32_4* %114 = OpAccessChain %29 %86 %77 
                                       f32_4 %115 = OpLoad %114 
                                       f32_4 %116 = OpLoad %63 
                                       f32_4 %117 = OpVectorShuffle %116 %116 2 2 2 2 
                                       f32_4 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpFAdd %118 %119 
                                                      OpStore %9 %120 
                              Uniform f32_4* %126 = OpAccessChain %29 %86 %86 
                                       f32_4 %127 = OpLoad %126 
                                       f32_4 %128 = OpLoad %63 
                                       f32_4 %129 = OpVectorShuffle %128 %128 3 3 3 3 
                                       f32_4 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpFAdd %130 %131 
                               Output f32_4* %134 = OpAccessChain %125 %31 
                                                      OpStore %134 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
                              Uniform f32_4* %141 = OpAccessChain %29 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                                       f32_2 %144 = OpFMul %139 %143 
                              Uniform f32_4* %145 = OpAccessChain %29 %140 
                                       f32_4 %146 = OpLoad %145 
                                       f32_2 %147 = OpVectorShuffle %146 %146 2 3 
                                       f32_2 %148 = OpFAdd %144 %147 
                                                      OpStore %136 %148 
                                Uniform f32* %151 = OpAccessChain %29 %77 %31 %149 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFNegate %152 
                                Private f32* %156 = OpAccessChain %9 %154 
                                                      OpStore %156 %153 
                                Uniform f32* %157 = OpAccessChain %29 %77 %66 %149 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFNegate %158 
                                Private f32* %160 = OpAccessChain %9 %121 
                                                      OpStore %160 %159 
                                Uniform f32* %161 = OpAccessChain %29 %77 %77 %149 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                Private f32* %164 = OpAccessChain %9 %149 
                                                      OpStore %164 %163 
                                       f32_4 %166 = OpLoad %9 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                         f32 %170 = OpDot %167 %169 
                                                      OpStore %165 %170 
                                         f32 %171 = OpLoad %165 
                                         f32 %172 = OpExtInst %1 32 %171 
                                                      OpStore %165 %172 
                                         f32 %174 = OpLoad %165 
                                       f32_3 %175 = OpCompositeConstruct %174 %174 %174 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %178 = OpFMul %175 %177 
                                                      OpStore %173 %178 
                                                      OpStore %179 %181 
                                                      OpStore %182 %183 
                                 Output f32* %185 = OpAccessChain %125 %31 %121 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFNegate %186 
                                 Output f32* %188 = OpAccessChain %125 %31 %121 
                                                      OpStore %188 %187 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 302
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %49 %64 %279 %290 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 Location 49 
                                                      OpDecorate %64 Location 64 
                                                      OpDecorate %127 SpecId 127 
                                                      OpDecorate %222 DescriptorSet 222 
                                                      OpDecorate %222 Binding 222 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %248 DescriptorSet 248 
                                                      OpDecorate %248 Binding 248 
                                                      OpDecorate %257 DescriptorSet 257 
                                                      OpDecorate %257 Binding 257 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 Location 279 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %290 Location 290 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_3* %11 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %14 %16 
                                              %18 = OpTypeArray %14 %16 
                                              %19 = OpTypeStruct %14 %14 %14 %17 %7 %7 %14 %18 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Uniform %14 
                                              %29 = OpTypePointer Private %6 
                                 Private f32* %30 = OpVariable Private 
                                              %40 = OpTypePointer Private %14 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %43 = OpTypeSampledImage %42 
                                              %44 = OpTypePointer UniformConstant %43 
  UniformConstant read_only Texture2DSampled* %45 = OpVariable UniformConstant 
                                              %47 = OpTypeVector %6 2 
                                              %48 = OpTypePointer Input %47 
                                 Input f32_2* %49 = OpVariable Input 
                                          i32 %52 = OpConstant 9 
                                              %53 = OpTypePointer Uniform %6 
                                          i32 %56 = OpConstant 8 
                                          f32 %62 = OpConstant 3.67402E-40 
                                 Input f32_3* %64 = OpVariable Input 
                                          u32 %65 = OpConstant 1 
                                              %66 = OpTypePointer Input %6 
                                              %70 = OpTypeBool 
                                              %71 = OpTypePointer Private %70 
                                Private bool* %72 = OpVariable Private 
                                          f32 %74 = OpConstant 3.67402E-40 
                                          i32 %77 = OpConstant 1 
                                          i32 %79 = OpConstant -1 
                               Private f32_3* %85 = OpVariable Private 
                                          i32 %88 = OpConstant 7 
                                         i32 %101 = OpConstant 2 
                                         i32 %111 = OpConstant 3 
                                         u32 %116 = OpConstant 0 
                                         f32 %119 = OpConstant 3.67402E-40 
                                        bool %121 = OpConstantFalse 
                                        bool %127 = OpSpecConstantFalse 
                              Private f32_4* %133 = OpVariable Private 
                                             %172 = OpTypePointer Function %7 
                                         i32 %186 = OpConstant 5 
                                             %187 = OpTypePointer Uniform %7 
                                         i32 %196 = OpConstant 4 
                                         f32 %204 = OpConstant 3.67402E-40 
                                         f32 %206 = OpConstant 3.67402E-40 
                                Private f32* %208 = OpVariable Private 
                                         u32 %209 = OpConstant 2 
                                         f32 %212 = OpConstant 3.67402E-40 
                                             %219 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %220 = OpTypeSampledImage %219 
                                             %221 = OpTypePointer UniformConstant %220 
 UniformConstant read_only Texture3DSampled* %222 = OpVariable UniformConstant 
                              Private f32_4* %227 = OpVariable Private 
                                         u32 %233 = OpConstant 3 
                              Private f32_3* %235 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %248 = OpVariable UniformConstant 
                                             %254 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %255 = OpTypeSampledImage %254 
                                             %256 = OpTypePointer UniformConstant %255 
UniformConstant read_only TextureCubeSampled* %257 = OpVariable UniformConstant 
                                         i32 %273 = OpConstant 6 
                                Private f32* %278 = OpVariable Private 
                                Input f32_3* %279 = OpVariable Input 
                                             %289 = OpTypePointer Output %14 
                               Output f32_4* %290 = OpVariable Output 
                                             %299 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %173 = OpVariable Function 
                                        f32_3 %12 = OpLoad %11 
                                        f32_3 %13 = OpFNegate %12 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFAdd %13 %27 
                                                      OpStore %9 %28 
                                        f32_3 %31 = OpLoad %9 
                                        f32_3 %32 = OpLoad %9 
                                          f32 %33 = OpDot %31 %32 
                                                      OpStore %30 %33 
                                          f32 %34 = OpLoad %30 
                                          f32 %35 = OpExtInst %1 32 %34 
                                                      OpStore %30 %35 
                                          f32 %36 = OpLoad %30 
                                        f32_3 %37 = OpCompositeConstruct %36 %36 %36 
                                        f32_3 %38 = OpLoad %9 
                                        f32_3 %39 = OpFMul %37 %38 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %46 = OpLoad %45 
                                        f32_2 %50 = OpLoad %49 
                                        f32_4 %51 = OpImageSampleImplicitLod %46 %50 
                                                      OpStore %41 %51 
                                 Uniform f32* %54 = OpAccessChain %21 %52 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %57 = OpAccessChain %21 %56 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpFMul %55 %58 
                                                      OpStore %30 %59 
                                          f32 %60 = OpLoad %30 
                                          f32 %61 = OpFNegate %60 
                                          f32 %63 = OpFMul %61 %62 
                                   Input f32* %67 = OpAccessChain %64 %65 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpFAdd %63 %68 
                                                      OpStore %30 %69 
                                          f32 %73 = OpLoad %30 
                                         bool %75 = OpFOrdLessThan %73 %74 
                                                      OpStore %72 %75 
                                         bool %76 = OpLoad %72 
                                          i32 %78 = OpSelect %76 %77 %23 
                                          i32 %80 = OpIMul %78 %79 
                                         bool %81 = OpINotEqual %80 %23 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %83 
                                              %82 = OpLabel 
                                                      OpKill
                                              %83 = OpLabel 
                                        f32_3 %86 = OpLoad %11 
                                        f32_3 %87 = OpVectorShuffle %86 %86 1 1 1 
                               Uniform f32_4* %89 = OpAccessChain %21 %88 %77 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_3 %92 = OpFMul %87 %91 
                                                      OpStore %85 %92 
                               Uniform f32_4* %93 = OpAccessChain %21 %88 %23 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpLoad %11 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 0 0 
                                        f32_3 %98 = OpFMul %95 %97 
                                        f32_3 %99 = OpLoad %85 
                                       f32_3 %100 = OpFAdd %98 %99 
                                                      OpStore %85 %100 
                              Uniform f32_4* %102 = OpAccessChain %21 %88 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpLoad %11 
                                       f32_3 %106 = OpVectorShuffle %105 %105 2 2 2 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_3 %108 = OpLoad %85 
                                       f32_3 %109 = OpFAdd %107 %108 
                                                      OpStore %85 %109 
                                       f32_3 %110 = OpLoad %85 
                              Uniform f32_4* %112 = OpAccessChain %21 %88 %111 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpFAdd %110 %114 
                                                      OpStore %85 %115 
                                Uniform f32* %117 = OpAccessChain %21 %101 %116 
                                         f32 %118 = OpLoad %117 
                                        bool %120 = OpFOrdEqual %118 %119 
                                                      OpStore %72 %120 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %123 
                                             %122 = OpLabel 
                                        bool %124 = OpLoad %72 
                                                      OpSelectionMerge %126 None 
                                                      OpBranchConditional %124 %125 %126 
                                             %125 = OpLabel 
                                                      OpBranch %126 
                                             %126 = OpLabel 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %229 
                                             %128 = OpLabel 
                                Uniform f32* %130 = OpAccessChain %21 %101 %65 
                                         f32 %131 = OpLoad %130 
                                        bool %132 = OpFOrdEqual %131 %119 
                                                      OpStore %72 %132 
                                       f32_3 %134 = OpLoad %11 
                                       f32_3 %135 = OpVectorShuffle %134 %134 1 1 1 
                              Uniform f32_4* %136 = OpAccessChain %21 %111 %77 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFMul %135 %138 
                                       f32_4 %140 = OpLoad %133 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
                                                      OpStore %133 %141 
                              Uniform f32_4* %142 = OpAccessChain %21 %111 %23 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpLoad %11 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 0 0 
                                       f32_3 %147 = OpFMul %144 %146 
                                       f32_4 %148 = OpLoad %133 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                       f32_3 %150 = OpFAdd %147 %149 
                                       f32_4 %151 = OpLoad %133 
                                       f32_4 %152 = OpVectorShuffle %151 %150 4 5 6 3 
                                                      OpStore %133 %152 
                              Uniform f32_4* %153 = OpAccessChain %21 %111 %101 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpLoad %11 
                                       f32_3 %157 = OpVectorShuffle %156 %156 2 2 2 
                                       f32_3 %158 = OpFMul %155 %157 
                                       f32_4 %159 = OpLoad %133 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_3 %161 = OpFAdd %158 %160 
                                       f32_4 %162 = OpLoad %133 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %133 %163 
                                       f32_4 %164 = OpLoad %133 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %21 %111 %111 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %133 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 6 3 
                                                      OpStore %133 %171 
                                        bool %174 = OpLoad %72 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %179 
                                             %175 = OpLabel 
                                       f32_4 %177 = OpLoad %133 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                                      OpStore %173 %178 
                                                      OpBranch %176 
                                             %179 = OpLabel 
                                       f32_3 %180 = OpLoad %11 
                                                      OpStore %173 %180 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_3 %181 = OpLoad %173 
                                       f32_4 %182 = OpLoad %133 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %133 %183 
                                       f32_4 %184 = OpLoad %133 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                              Uniform f32_3* %188 = OpAccessChain %21 %186 
                                       f32_3 %189 = OpLoad %188 
                                       f32_3 %190 = OpFNegate %189 
                                       f32_3 %191 = OpFAdd %185 %190 
                                       f32_4 %192 = OpLoad %133 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 6 3 
                                                      OpStore %133 %193 
                                       f32_4 %194 = OpLoad %133 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
                              Uniform f32_3* %197 = OpAccessChain %21 %196 
                                       f32_3 %198 = OpLoad %197 
                                       f32_3 %199 = OpFMul %195 %198 
                                       f32_4 %200 = OpLoad %133 
                                       f32_4 %201 = OpVectorShuffle %200 %199 0 4 5 6 
                                                      OpStore %133 %201 
                                Private f32* %202 = OpAccessChain %133 %65 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %207 = OpFAdd %205 %206 
                                                      OpStore %30 %207 
                                Uniform f32* %210 = OpAccessChain %21 %101 %209 
                                         f32 %211 = OpLoad %210 
                                         f32 %213 = OpFMul %211 %212 
                                         f32 %214 = OpFAdd %213 %206 
                                                      OpStore %208 %214 
                                         f32 %215 = OpLoad %30 
                                         f32 %216 = OpLoad %208 
                                         f32 %217 = OpExtInst %1 40 %215 %216 
                                Private f32* %218 = OpAccessChain %133 %116 
                                                      OpStore %218 %217 
                  read_only Texture3DSampled %223 = OpLoad %222 
                                       f32_4 %224 = OpLoad %133 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 2 3 
                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                                      OpStore %133 %226 
                                       f32_4 %228 = OpLoad %133 
                                                      OpStore %227 %228 
                                                      OpBranch %129 
                                             %229 = OpLabel 
                                Private f32* %230 = OpAccessChain %227 %116 
                                                      OpStore %230 %119 
                                Private f32* %231 = OpAccessChain %227 %65 
                                                      OpStore %231 %119 
                                Private f32* %232 = OpAccessChain %227 %209 
                                                      OpStore %232 %119 
                                Private f32* %234 = OpAccessChain %227 %233 
                                                      OpStore %234 %119 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                       f32_4 %236 = OpLoad %227 
                              Uniform f32_4* %237 = OpAccessChain %21 %77 
                                       f32_4 %238 = OpLoad %237 
                                         f32 %239 = OpDot %236 %238 
                                Private f32* %240 = OpAccessChain %235 %116 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %235 %116 
                                         f32 %242 = OpLoad %241 
                                         f32 %243 = OpExtInst %1 43 %242 %74 %119 
                                Private f32* %244 = OpAccessChain %235 %116 
                                                      OpStore %244 %243 
                                       f32_3 %245 = OpLoad %85 
                                       f32_3 %246 = OpLoad %85 
                                         f32 %247 = OpDot %245 %246 
                                                      OpStore %30 %247 
                  read_only Texture2DSampled %249 = OpLoad %248 
                                         f32 %250 = OpLoad %30 
                                       f32_2 %251 = OpCompositeConstruct %250 %250 
                                       f32_4 %252 = OpImageSampleImplicitLod %249 %251 
                                         f32 %253 = OpCompositeExtract %252 3 
                                                      OpStore %30 %253 
                read_only TextureCubeSampled %258 = OpLoad %257 
                                       f32_3 %259 = OpLoad %85 
                                       f32_4 %260 = OpImageSampleImplicitLod %258 %259 
                                         f32 %261 = OpCompositeExtract %260 3 
                                Private f32* %262 = OpAccessChain %85 %116 
                                                      OpStore %262 %261 
                                         f32 %263 = OpLoad %30 
                                Private f32* %264 = OpAccessChain %85 %116 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpFMul %263 %265 
                                                      OpStore %30 %266 
                                Private f32* %267 = OpAccessChain %235 %116 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpLoad %30 
                                         f32 %270 = OpFMul %268 %269 
                                                      OpStore %30 %270 
                                         f32 %271 = OpLoad %30 
                                       f32_3 %272 = OpCompositeConstruct %271 %271 %271 
                              Uniform f32_4* %274 = OpAccessChain %21 %273 
                                       f32_4 %275 = OpLoad %274 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 1 2 
                                       f32_3 %277 = OpFMul %272 %276 
                                                      OpStore %235 %277 
                                       f32_3 %280 = OpLoad %279 
                                       f32_3 %281 = OpLoad %9 
                                         f32 %282 = OpDot %280 %281 
                                                      OpStore %278 %282 
                                         f32 %283 = OpLoad %278 
                                         f32 %284 = OpExtInst %1 40 %283 %74 
                                                      OpStore %278 %284 
                                       f32_4 %285 = OpLoad %41 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_3 %287 = OpLoad %235 
                                       f32_3 %288 = OpFMul %286 %287 
                                                      OpStore %235 %288 
                                         f32 %291 = OpLoad %278 
                                       f32_3 %292 = OpCompositeConstruct %291 %291 %291 
                                       f32_3 %293 = OpLoad %235 
                                       f32_3 %294 = OpFMul %292 %293 
                                       f32_4 %295 = OpLoad %290 
                                       f32_4 %296 = OpVectorShuffle %295 %294 4 5 6 3 
                                                      OpStore %290 %296 
                                Private f32* %297 = OpAccessChain %41 %233 
                                         f32 %298 = OpLoad %297 
                                 Output f32* %300 = OpAccessChain %290 %233 
                                                      OpStore %300 %298 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0.xy = in_POSITION0.xy / in_POSITION0.ww;
    u_xlat4.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat4.xy * u_xlat0.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xy;
    u_xlat0.xy = u_xlat0.xy * in_POSITION0.ww;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = (-hlslcc_mtx4x4unity_WorldToObject[0].z);
    u_xlat0.y = (-hlslcc_mtx4x4unity_WorldToObject[1].z);
    u_xlat0.z = (-hlslcc_mtx4x4unity_WorldToObject[2].z);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = _PixelHeight * _Threshold;
    u_xlat1.x = (-u_xlat1.x) * 0.0625 + vs_TEXCOORD4.y;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb7 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb7){
        u_xlatb7 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb7)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat7 = u_xlat2.y * 0.25 + 0.75;
        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat10, u_xlat7);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat7 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat10_2 = texture(_LightTexture0, u_xlat1.xy);
    u_xlat1.x = u_xlat7 * u_xlat10_2.w;
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat10 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 190
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %125 %136 %137 %173 %179 %182 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpDecorate %26 ArrayStride 26 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %92 Location 92 
                                                      OpMemberDecorate %123 0 BuiltIn 123 
                                                      OpMemberDecorate %123 1 BuiltIn 123 
                                                      OpMemberDecorate %123 2 BuiltIn 123 
                                                      OpDecorate %123 Block 
                                                      OpDecorate %136 Location 136 
                                                      OpDecorate %137 Location 137 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %182 Location 182 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %20 = OpTypePointer Private %12 
                               Private f32_2* %21 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeArray %7 %23 
                                              %26 = OpTypeArray %7 %23 
                                              %27 = OpTypeStruct %7 %24 %25 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Uniform %7 
                                          f32 %36 = OpConstant 3.67402E-40 
                                        f32_2 %37 = OpConstantComposite %36 %36 
                               Private f32_4* %63 = OpVariable Private 
                                          i32 %66 = OpConstant 1 
                                          i32 %77 = OpConstant 2 
                                          i32 %86 = OpConstant 3 
                                              %90 = OpTypeVector %6 3 
                                              %91 = OpTypePointer Output %90 
                                Output f32_3* %92 = OpVariable Output 
                                         u32 %121 = OpConstant 1 
                                             %122 = OpTypeArray %6 %121 
                                             %123 = OpTypeStruct %7 %6 %122 
                                             %124 = OpTypePointer Output %123 
        Output struct {f32_4; f32; f32[1];}* %125 = OpVariable Output 
                                             %133 = OpTypePointer Output %7 
                                             %135 = OpTypePointer Output %12 
                               Output f32_2* %136 = OpVariable Output 
                                Input f32_4* %137 = OpVariable Input 
                                         i32 %140 = OpConstant 4 
                                         u32 %149 = OpConstant 2 
                                             %150 = OpTypePointer Uniform %6 
                                         u32 %154 = OpConstant 0 
                                             %155 = OpTypePointer Private %6 
                                Private f32* %165 = OpVariable Private 
                               Output f32_3* %173 = OpVariable Output 
                               Output f32_4* %179 = OpVariable Output 
                                         f32 %180 = OpConstant 3.67402E-40 
                                       f32_4 %181 = OpConstantComposite %180 %180 %180 %180 
                               Output f32_3* %182 = OpVariable Output 
                                       f32_3 %183 = OpConstantComposite %180 %180 %180 
                                             %184 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_4 %15 = OpLoad %11 
                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                        f32_2 %17 = OpFDiv %14 %16 
                                        f32_4 %18 = OpLoad %9 
                                        f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                      OpStore %9 %19 
                               Uniform f32_4* %33 = OpAccessChain %29 %31 
                                        f32_4 %34 = OpLoad %33 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                                        f32_2 %38 = OpFMul %35 %37 
                                                      OpStore %21 %38 
                                        f32_2 %39 = OpLoad %21 
                                        f32_4 %40 = OpLoad %9 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                        f32_2 %47 = OpExtInst %1 2 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_4 %49 = OpVectorShuffle %48 %47 4 5 2 3 
                                                      OpStore %9 %49 
                                        f32_4 %50 = OpLoad %9 
                                        f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                        f32_2 %52 = OpLoad %21 
                                        f32_2 %53 = OpFDiv %51 %52 
                                        f32_4 %54 = OpLoad %9 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %9 %55 
                                        f32_4 %56 = OpLoad %9 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_4 %58 = OpLoad %11 
                                        f32_2 %59 = OpVectorShuffle %58 %58 3 3 
                                        f32_2 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_4 %62 = OpVectorShuffle %61 %60 4 5 2 3 
                                                      OpStore %9 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                               Uniform f32_4* %67 = OpAccessChain %29 %66 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpFMul %65 %68 
                                                      OpStore %63 %69 
                               Uniform f32_4* %70 = OpAccessChain %29 %66 %31 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 0 0 0 0 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %63 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %9 %76 
                               Uniform f32_4* %78 = OpAccessChain %29 %66 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %11 
                                        f32_4 %81 = OpVectorShuffle %80 %80 2 2 2 2 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %9 %84 
                                        f32_4 %85 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %29 %66 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %85 %88 
                                                      OpStore %63 %89 
                               Uniform f32_4* %93 = OpAccessChain %29 %66 %86 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_4 %96 = OpLoad %11 
                                        f32_3 %97 = OpVectorShuffle %96 %96 3 3 3 
                                        f32_3 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %9 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFAdd %98 %100 
                                                      OpStore %92 %101 
                                       f32_4 %102 = OpLoad %63 
                                       f32_4 %103 = OpVectorShuffle %102 %102 1 1 1 1 
                              Uniform f32_4* %104 = OpAccessChain %29 %86 %66 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpFMul %103 %105 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %29 %86 %31 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpLoad %63 
                                       f32_4 %110 = OpVectorShuffle %109 %109 0 0 0 0 
                                       f32_4 %111 = OpFMul %108 %110 
                                       f32_4 %112 = OpLoad %9 
                                       f32_4 %113 = OpFAdd %111 %112 
                                                      OpStore %9 %113 
                              Uniform f32_4* %114 = OpAccessChain %29 %86 %77 
                                       f32_4 %115 = OpLoad %114 
                                       f32_4 %116 = OpLoad %63 
                                       f32_4 %117 = OpVectorShuffle %116 %116 2 2 2 2 
                                       f32_4 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpFAdd %118 %119 
                                                      OpStore %9 %120 
                              Uniform f32_4* %126 = OpAccessChain %29 %86 %86 
                                       f32_4 %127 = OpLoad %126 
                                       f32_4 %128 = OpLoad %63 
                                       f32_4 %129 = OpVectorShuffle %128 %128 3 3 3 3 
                                       f32_4 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpFAdd %130 %131 
                               Output f32_4* %134 = OpAccessChain %125 %31 
                                                      OpStore %134 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
                              Uniform f32_4* %141 = OpAccessChain %29 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                                       f32_2 %144 = OpFMul %139 %143 
                              Uniform f32_4* %145 = OpAccessChain %29 %140 
                                       f32_4 %146 = OpLoad %145 
                                       f32_2 %147 = OpVectorShuffle %146 %146 2 3 
                                       f32_2 %148 = OpFAdd %144 %147 
                                                      OpStore %136 %148 
                                Uniform f32* %151 = OpAccessChain %29 %77 %31 %149 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFNegate %152 
                                Private f32* %156 = OpAccessChain %9 %154 
                                                      OpStore %156 %153 
                                Uniform f32* %157 = OpAccessChain %29 %77 %66 %149 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFNegate %158 
                                Private f32* %160 = OpAccessChain %9 %121 
                                                      OpStore %160 %159 
                                Uniform f32* %161 = OpAccessChain %29 %77 %77 %149 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                Private f32* %164 = OpAccessChain %9 %149 
                                                      OpStore %164 %163 
                                       f32_4 %166 = OpLoad %9 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                         f32 %170 = OpDot %167 %169 
                                                      OpStore %165 %170 
                                         f32 %171 = OpLoad %165 
                                         f32 %172 = OpExtInst %1 32 %171 
                                                      OpStore %165 %172 
                                         f32 %174 = OpLoad %165 
                                       f32_3 %175 = OpCompositeConstruct %174 %174 %174 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %178 = OpFMul %175 %177 
                                                      OpStore %173 %178 
                                                      OpStore %179 %181 
                                                      OpStore %182 %183 
                                 Output f32* %185 = OpAccessChain %125 %31 %121 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFNegate %186 
                                 Output f32* %188 = OpAccessChain %125 %31 %121 
                                                      OpStore %188 %187 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 280
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %48 %72 %255 %268 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpDecorate %26 ArrayStride 26 
                                                      OpMemberDecorate %27 0 RelaxedPrecision 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 RelaxedPrecision 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpMemberDecorate %27 6 RelaxedPrecision 
                                                      OpMemberDecorate %27 6 Offset 27 
                                                      OpMemberDecorate %27 7 Offset 27 
                                                      OpMemberDecorate %27 8 Offset 27 
                                                      OpMemberDecorate %27 9 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %48 Location 48 
                                                      OpDecorate %72 Location 72 
                                                      OpDecorate %115 SpecId 115 
                                                      OpDecorate %211 DescriptorSet 211 
                                                      OpDecorate %211 Binding 211 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %235 DescriptorSet 235 
                                                      OpDecorate %235 Binding 235 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 Location 255 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %268 Location 268 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                                              %20 = OpTypePointer Private %15 
                               Private f32_2* %21 = OpVariable Private 
                                              %22 = OpTypeInt 32 0 
                                          u32 %23 = OpConstant 4 
                                              %24 = OpTypeArray %7 %23 
                                              %25 = OpTypeVector %6 3 
                                              %26 = OpTypeArray %7 %23 
                                              %27 = OpTypeStruct %7 %7 %7 %24 %25 %25 %7 %26 %6 %6 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 9 
                                              %32 = OpTypePointer Uniform %6 
                                          i32 %35 = OpConstant 8 
                                          u32 %39 = OpConstant 0 
                                              %40 = OpTypePointer Private %6 
                                          f32 %45 = OpConstant 3.67402E-40 
                                              %47 = OpTypePointer Input %25 
                                 Input f32_3* %48 = OpVariable Input 
                                          u32 %49 = OpConstant 1 
                                              %50 = OpTypePointer Input %6 
                                              %55 = OpTypeBool 
                                              %56 = OpTypePointer Private %55 
                                Private bool* %57 = OpVariable Private 
                                          f32 %60 = OpConstant 3.67402E-40 
                                          i32 %63 = OpConstant 0 
                                          i32 %64 = OpConstant 1 
                                          i32 %66 = OpConstant -1 
                                 Input f32_3* %72 = OpVariable Input 
                                          i32 %75 = OpConstant 7 
                                              %76 = OpTypePointer Uniform %7 
                                          i32 %89 = OpConstant 2 
                                          i32 %99 = OpConstant 3 
                               Private bool* %104 = OpVariable Private 
                                         f32 %107 = OpConstant 3.67402E-40 
                                        bool %109 = OpConstantFalse 
                                        bool %115 = OpSpecConstantFalse 
                              Private f32_4* %121 = OpVariable Private 
                                             %160 = OpTypePointer Function %25 
                                         i32 %174 = OpConstant 5 
                                             %175 = OpTypePointer Uniform %25 
                                         i32 %184 = OpConstant 4 
                                Private f32* %190 = OpVariable Private 
                                         f32 %193 = OpConstant 3.67402E-40 
                                         f32 %195 = OpConstant 3.67402E-40 
                                Private f32* %197 = OpVariable Private 
                                         u32 %198 = OpConstant 2 
                                         f32 %201 = OpConstant 3.67402E-40 
                                             %208 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %209 = OpTypeSampledImage %208 
                                             %210 = OpTypePointer UniformConstant %209 
 UniformConstant read_only Texture3DSampled* %211 = OpVariable UniformConstant 
                              Private f32_4* %216 = OpVariable Private 
                                         u32 %222 = OpConstant 3 
                                             %224 = OpTypePointer Private %25 
                              Private f32_3* %225 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %235 = OpVariable UniformConstant 
                                         i32 %249 = OpConstant 6 
                                Private f32* %254 = OpVariable Private 
                                Input f32_3* %255 = OpVariable Input 
                                             %267 = OpTypePointer Output %7 
                               Output f32_4* %268 = OpVariable Output 
                                             %277 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %161 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %33 = OpAccessChain %29 %31 
                                          f32 %34 = OpLoad %33 
                                 Uniform f32* %36 = OpAccessChain %29 %35 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFMul %34 %37 
                                 Private f32* %41 = OpAccessChain %21 %39 
                                                      OpStore %41 %38 
                                 Private f32* %42 = OpAccessChain %21 %39 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %46 = OpFMul %44 %45 
                                   Input f32* %51 = OpAccessChain %48 %49 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFAdd %46 %52 
                                 Private f32* %54 = OpAccessChain %21 %39 
                                                      OpStore %54 %53 
                                 Private f32* %58 = OpAccessChain %21 %39 
                                          f32 %59 = OpLoad %58 
                                         bool %61 = OpFOrdLessThan %59 %60 
                                                      OpStore %57 %61 
                                         bool %62 = OpLoad %57 
                                          i32 %65 = OpSelect %62 %64 %63 
                                          i32 %67 = OpIMul %65 %66 
                                         bool %68 = OpINotEqual %67 %63 
                                                      OpSelectionMerge %70 None 
                                                      OpBranchConditional %68 %69 %70 
                                              %69 = OpLabel 
                                                      OpKill
                                              %70 = OpLabel 
                                        f32_3 %73 = OpLoad %72 
                                        f32_2 %74 = OpVectorShuffle %73 %73 1 1 
                               Uniform f32_4* %77 = OpAccessChain %29 %75 %64 
                                        f32_4 %78 = OpLoad %77 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                                        f32_2 %80 = OpFMul %74 %79 
                                                      OpStore %21 %80 
                               Uniform f32_4* %81 = OpAccessChain %29 %75 %63 
                                        f32_4 %82 = OpLoad %81 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_3 %84 = OpLoad %72 
                                        f32_2 %85 = OpVectorShuffle %84 %84 0 0 
                                        f32_2 %86 = OpFMul %83 %85 
                                        f32_2 %87 = OpLoad %21 
                                        f32_2 %88 = OpFAdd %86 %87 
                                                      OpStore %21 %88 
                               Uniform f32_4* %90 = OpAccessChain %29 %75 %89 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_3 %93 = OpLoad %72 
                                        f32_2 %94 = OpVectorShuffle %93 %93 2 2 
                                        f32_2 %95 = OpFMul %92 %94 
                                        f32_2 %96 = OpLoad %21 
                                        f32_2 %97 = OpFAdd %95 %96 
                                                      OpStore %21 %97 
                                        f32_2 %98 = OpLoad %21 
                              Uniform f32_4* %100 = OpAccessChain %29 %75 %99 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_2 %103 = OpFAdd %98 %102 
                                                      OpStore %21 %103 
                                Uniform f32* %105 = OpAccessChain %29 %89 %39 
                                         f32 %106 = OpLoad %105 
                                        bool %108 = OpFOrdEqual %106 %107 
                                                      OpStore %104 %108 
                                                      OpSelectionMerge %111 None 
                                                      OpBranchConditional %109 %110 %111 
                                             %110 = OpLabel 
                                        bool %112 = OpLoad %104 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %114 
                                             %113 = OpLabel 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                                      OpBranch %111 
                                             %111 = OpLabel 
                                                      OpSelectionMerge %117 None 
                                                      OpBranchConditional %115 %116 %218 
                                             %116 = OpLabel 
                                Uniform f32* %118 = OpAccessChain %29 %89 %49 
                                         f32 %119 = OpLoad %118 
                                        bool %120 = OpFOrdEqual %119 %107 
                                                      OpStore %104 %120 
                                       f32_3 %122 = OpLoad %72 
                                       f32_3 %123 = OpVectorShuffle %122 %122 1 1 1 
                              Uniform f32_4* %124 = OpAccessChain %29 %99 %64 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                       f32_3 %127 = OpFMul %123 %126 
                                       f32_4 %128 = OpLoad %121 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %121 %129 
                              Uniform f32_4* %130 = OpAccessChain %29 %99 %63 
                                       f32_4 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpLoad %72 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 0 0 
                                       f32_3 %135 = OpFMul %132 %134 
                                       f32_4 %136 = OpLoad %121 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpFAdd %135 %137 
                                       f32_4 %139 = OpLoad %121 
                                       f32_4 %140 = OpVectorShuffle %139 %138 4 5 6 3 
                                                      OpStore %121 %140 
                              Uniform f32_4* %141 = OpAccessChain %29 %99 %89 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpLoad %72 
                                       f32_3 %145 = OpVectorShuffle %144 %144 2 2 2 
                                       f32_3 %146 = OpFMul %143 %145 
                                       f32_4 %147 = OpLoad %121 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFAdd %146 %148 
                                       f32_4 %150 = OpLoad %121 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %121 %151 
                                       f32_4 %152 = OpLoad %121 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              Uniform f32_4* %154 = OpAccessChain %29 %99 %99 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                       f32_3 %157 = OpFAdd %153 %156 
                                       f32_4 %158 = OpLoad %121 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 5 6 3 
                                                      OpStore %121 %159 
                                        bool %162 = OpLoad %104 
                                                      OpSelectionMerge %164 None 
                                                      OpBranchConditional %162 %163 %167 
                                             %163 = OpLabel 
                                       f32_4 %165 = OpLoad %121 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                                      OpStore %161 %166 
                                                      OpBranch %164 
                                             %167 = OpLabel 
                                       f32_3 %168 = OpLoad %72 
                                                      OpStore %161 %168 
                                                      OpBranch %164 
                                             %164 = OpLabel 
                                       f32_3 %169 = OpLoad %161 
                                       f32_4 %170 = OpLoad %121 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 6 3 
                                                      OpStore %121 %171 
                                       f32_4 %172 = OpLoad %121 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                              Uniform f32_3* %176 = OpAccessChain %29 %174 
                                       f32_3 %177 = OpLoad %176 
                                       f32_3 %178 = OpFNegate %177 
                                       f32_3 %179 = OpFAdd %173 %178 
                                       f32_4 %180 = OpLoad %121 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %121 %181 
                                       f32_4 %182 = OpLoad %121 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                              Uniform f32_3* %185 = OpAccessChain %29 %184 
                                       f32_3 %186 = OpLoad %185 
                                       f32_3 %187 = OpFMul %183 %186 
                                       f32_4 %188 = OpLoad %121 
                                       f32_4 %189 = OpVectorShuffle %188 %187 0 4 5 6 
                                                      OpStore %121 %189 
                                Private f32* %191 = OpAccessChain %121 %49 
                                         f32 %192 = OpLoad %191 
                                         f32 %194 = OpFMul %192 %193 
                                         f32 %196 = OpFAdd %194 %195 
                                                      OpStore %190 %196 
                                Uniform f32* %199 = OpAccessChain %29 %89 %198 
                                         f32 %200 = OpLoad %199 
                                         f32 %202 = OpFMul %200 %201 
                                         f32 %203 = OpFAdd %202 %195 
                                                      OpStore %197 %203 
                                         f32 %204 = OpLoad %197 
                                         f32 %205 = OpLoad %190 
                                         f32 %206 = OpExtInst %1 40 %204 %205 
                                Private f32* %207 = OpAccessChain %121 %39 
                                                      OpStore %207 %206 
                  read_only Texture3DSampled %212 = OpLoad %211 
                                       f32_4 %213 = OpLoad %121 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 2 3 
                                       f32_4 %215 = OpImageSampleImplicitLod %212 %214 
                                                      OpStore %121 %215 
                                       f32_4 %217 = OpLoad %121 
                                                      OpStore %216 %217 
                                                      OpBranch %117 
                                             %218 = OpLabel 
                                Private f32* %219 = OpAccessChain %216 %39 
                                                      OpStore %219 %107 
                                Private f32* %220 = OpAccessChain %216 %49 
                                                      OpStore %220 %107 
                                Private f32* %221 = OpAccessChain %216 %198 
                                                      OpStore %221 %107 
                                Private f32* %223 = OpAccessChain %216 %222 
                                                      OpStore %223 %107 
                                                      OpBranch %117 
                                             %117 = OpLabel 
                                       f32_4 %226 = OpLoad %216 
                              Uniform f32_4* %227 = OpAccessChain %29 %64 
                                       f32_4 %228 = OpLoad %227 
                                         f32 %229 = OpDot %226 %228 
                                Private f32* %230 = OpAccessChain %225 %39 
                                                      OpStore %230 %229 
                                Private f32* %231 = OpAccessChain %225 %39 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpExtInst %1 43 %232 %60 %107 
                                Private f32* %234 = OpAccessChain %225 %39 
                                                      OpStore %234 %233 
                  read_only Texture2DSampled %236 = OpLoad %235 
                                       f32_2 %237 = OpLoad %21 
                                       f32_4 %238 = OpImageSampleImplicitLod %236 %237 
                                         f32 %239 = OpCompositeExtract %238 3 
                                Private f32* %240 = OpAccessChain %21 %39 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %225 %39 
                                         f32 %242 = OpLoad %241 
                                Private f32* %243 = OpAccessChain %21 %39 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpFMul %242 %244 
                                Private f32* %246 = OpAccessChain %21 %39 
                                                      OpStore %246 %245 
                                       f32_2 %247 = OpLoad %21 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 0 0 
                              Uniform f32_4* %250 = OpAccessChain %29 %249 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_3 %253 = OpFMul %248 %252 
                                                      OpStore %225 %253 
                                       f32_3 %256 = OpLoad %255 
                              Uniform f32_4* %257 = OpAccessChain %29 %63 
                                       f32_4 %258 = OpLoad %257 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                         f32 %260 = OpDot %256 %259 
                                                      OpStore %254 %260 
                                         f32 %261 = OpLoad %254 
                                         f32 %262 = OpExtInst %1 40 %261 %60 
                                                      OpStore %254 %262 
                                       f32_4 %263 = OpLoad %9 
                                       f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
                                       f32_3 %265 = OpLoad %225 
                                       f32_3 %266 = OpFMul %264 %265 
                                                      OpStore %225 %266 
                                         f32 %269 = OpLoad %254 
                                       f32_3 %270 = OpCompositeConstruct %269 %269 %269 
                                       f32_3 %271 = OpLoad %225 
                                       f32_3 %272 = OpFMul %270 %271 
                                       f32_4 %273 = OpLoad %268 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 6 3 
                                                      OpStore %268 %274 
                                Private f32* %275 = OpAccessChain %9 %222 
                                         f32 %276 = OpLoad %275 
                                 Output f32* %278 = OpAccessChain %268 %222 
                                                      OpStore %278 %276 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "POINT" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "DUMMY" }
""
}
SubProgram "vulkan " {
Keywords { "POINT" "DUMMY" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "DUMMY" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "DUMMY" }
""
}
SubProgram "d3d11 " {
Keywords { "SPOT" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "DUMMY" }
""
}
SubProgram "vulkan " {
Keywords { "SPOT" "DUMMY" }
""
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "DUMMY" }
""
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" "DUMMY" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "DUMMY" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" "DUMMY" }
""
}
SubProgram "d3d11 " {
Keywords { "POINT" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "PIXELSNAP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "POINT" "PIXELSNAP_ON" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "PIXELSNAP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "PIXELSNAP_ON" }
""
}
SubProgram "d3d11 " {
Keywords { "SPOT" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "PIXELSNAP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "SPOT" "PIXELSNAP_ON" }
""
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "PIXELSNAP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" "PIXELSNAP_ON" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "PIXELSNAP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" "PIXELSNAP_ON" }
""
}
}
}
 Pass {
  Name "META"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 160198
Program "vp" {
SubProgram "d3d11 " {
Keywords { "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DUMMY" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	bvec4 unity_MetaVertexControl;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
in  vec4 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb6;
void main()
{
    u_xlatb0 = 0.0<in_POSITION0.z;
    u_xlat0.z = u_xlatb0 ? 9.99999975e-005 : float(0.0);
    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlatb6 = 0.0<u_xlat0.z;
    u_xlat1.z = u_xlatb6 ? 9.99999975e-005 : float(0.0);
    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat16_0;
vec4 u_xlat10_0;
bool u_xlatb0;
float u_xlat3;
void main()
{
    u_xlat0.x = _PixelHeight * _Threshold;
    u_xlat0.x = (-u_xlat0.x) * 0.0625 + vs_TEXCOORD3.y;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = log2(u_xlat10_0.xyz);
    u_xlat3 = unity_OneOverOutputBoost;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat3);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
    u_xlat0.w = 1.0;
    u_xlat0 = (unity_MetaFragmentControl.x) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    SV_Target0 = (unity_MetaFragmentControl.y) ? vec4(0.0, 0.0, 0.0, 1.0) : u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DUMMY" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 241
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %32 %89 %166 %177 %178 %221 %231 %233 
                                                      OpDecorate %13 Location 13 
                                                      OpDecorate %32 Location 32 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %89 Location 89 
                                                      OpMemberDecorate %164 0 BuiltIn 164 
                                                      OpMemberDecorate %164 1 BuiltIn 164 
                                                      OpMemberDecorate %164 2 BuiltIn 164 
                                                      OpDecorate %164 Block 
                                                      OpDecorate %177 Location 177 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %221 Location 221 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %231 Location 231 
                                                      OpDecorate %233 Location 233 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                               %7 = OpTypePointer Private %6 
                                 Private bool* %8 = OpVariable Private 
                                               %9 = OpTypeFloat 32 
                                          f32 %10 = OpConstant 3.67402E-40 
                                              %11 = OpTypeVector %9 4 
                                              %12 = OpTypePointer Input %11 
                                 Input f32_4* %13 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 2 
                                              %16 = OpTypePointer Input %9 
                                              %20 = OpTypePointer Private %11 
                               Private f32_4* %21 = OpVariable Private 
                                              %22 = OpTypePointer Function %9 
                                          f32 %27 = OpConstant 3.67402E-40 
                                              %30 = OpTypePointer Private %9 
                                 Input f32_4* %32 = OpVariable Input 
                                              %33 = OpTypeVector %9 2 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %11 %36 
                                              %38 = OpTypeArray %11 %36 
                                              %39 = OpTypeVector %14 4 
                                              %40 = OpTypeStruct %37 %38 %11 %11 %39 %11 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; u32_4; f32_4;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 2 
                                              %45 = OpTypePointer Uniform %11 
                                              %56 = OpTypeVector %9 3 
                                              %57 = OpTypePointer Function %56 
                                          i32 %59 = OpConstant 4 
                                              %60 = OpTypeVector %6 4 
                                              %61 = OpTypePointer Uniform %39 
                                          u32 %65 = OpConstant 0 
                                Private bool* %77 = OpVariable Private 
                               Private f32_4* %81 = OpVariable Private 
                                 Input f32_4* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 3 
                                         i32 %120 = OpConstant 0 
                                         i32 %121 = OpConstant 1 
                                         u32 %162 = OpConstant 1 
                                             %163 = OpTypeArray %9 %162 
                                             %164 = OpTypeStruct %11 %9 %163 
                                             %165 = OpTypePointer Output %164 
        Output struct {f32_4; f32; f32[1];}* %166 = OpVariable Output 
                                             %174 = OpTypePointer Output %11 
                                             %176 = OpTypePointer Output %33 
                               Output f32_2* %177 = OpVariable Output 
                                Input f32_4* %178 = OpVariable Input 
                                         i32 %181 = OpConstant 5 
                                             %220 = OpTypePointer Output %56 
                               Output f32_3* %221 = OpVariable Output 
                               Output f32_4* %231 = OpVariable Output 
                                       f32_4 %232 = OpConstantComposite %10 %10 %10 %10 
                               Output f32_3* %233 = OpVariable Output 
                                       f32_3 %234 = OpConstantComposite %10 %10 %10 
                                             %235 = OpTypePointer Output %9 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %23 = OpVariable Function 
                              Function f32_3* %58 = OpVariable Function 
                                Function f32* %82 = OpVariable Function 
                             Function f32_3* %103 = OpVariable Function 
                                   Input f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                         bool %19 = OpFOrdLessThan %10 %18 
                                                      OpStore %8 %19 
                                         bool %24 = OpLoad %8 
                                                      OpSelectionMerge %26 None 
                                                      OpBranchConditional %24 %25 %28 
                                              %25 = OpLabel 
                                                      OpStore %23 %27 
                                                      OpBranch %26 
                                              %28 = OpLabel 
                                                      OpStore %23 %10 
                                                      OpBranch %26 
                                              %26 = OpLabel 
                                          f32 %29 = OpLoad %23 
                                 Private f32* %31 = OpAccessChain %21 %15 
                                                      OpStore %31 %29 
                                        f32_4 %34 = OpLoad %32 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                        f32_2 %49 = OpFMul %35 %48 
                               Uniform f32_4* %50 = OpAccessChain %42 %44 
                                        f32_4 %51 = OpLoad %50 
                                        f32_2 %52 = OpVectorShuffle %51 %51 2 3 
                                        f32_2 %53 = OpFAdd %49 %52 
                                        f32_4 %54 = OpLoad %21 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %21 %55 
                               Uniform u32_4* %62 = OpAccessChain %42 %59 
                                        u32_4 %63 = OpLoad %62 
                                          u32 %64 = OpCompositeExtract %63 0 
                                         bool %66 = OpINotEqual %64 %65 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %71 
                                              %67 = OpLabel 
                                        f32_4 %69 = OpLoad %21 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                                      OpStore %58 %70 
                                                      OpBranch %68 
                                              %71 = OpLabel 
                                        f32_4 %72 = OpLoad %13 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                                      OpStore %58 %73 
                                                      OpBranch %68 
                                              %68 = OpLabel 
                                        f32_3 %74 = OpLoad %58 
                                        f32_4 %75 = OpLoad %21 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %21 %76 
                                 Private f32* %78 = OpAccessChain %21 %15 
                                          f32 %79 = OpLoad %78 
                                         bool %80 = OpFOrdLessThan %10 %79 
                                                      OpStore %77 %80 
                                         bool %83 = OpLoad %77 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %83 %84 %86 
                                              %84 = OpLabel 
                                                      OpStore %82 %27 
                                                      OpBranch %85 
                                              %86 = OpLabel 
                                                      OpStore %82 %10 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                          f32 %87 = OpLoad %82 
                                 Private f32* %88 = OpAccessChain %81 %15 
                                                      OpStore %88 %87 
                                        f32_4 %90 = OpLoad %89 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                               Uniform f32_4* %93 = OpAccessChain %42 %92 
                                        f32_4 %94 = OpLoad %93 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %91 %95 
                               Uniform f32_4* %97 = OpAccessChain %42 %92 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 2 3 
                                       f32_2 %100 = OpFAdd %96 %99 
                                       f32_4 %101 = OpLoad %81 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                      OpStore %81 %102 
                              Uniform u32_4* %104 = OpAccessChain %42 %59 
                                       u32_4 %105 = OpLoad %104 
                                         u32 %106 = OpCompositeExtract %105 1 
                                        bool %107 = OpINotEqual %106 %65 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %112 
                                             %108 = OpLabel 
                                       f32_4 %110 = OpLoad %81 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                                      OpStore %103 %111 
                                                      OpBranch %109 
                                             %112 = OpLabel 
                                       f32_4 %113 = OpLoad %21 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                                      OpStore %103 %114 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                       f32_3 %115 = OpLoad %103 
                                       f32_4 %116 = OpLoad %21 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %21 %117 
                                       f32_4 %118 = OpLoad %21 
                                       f32_4 %119 = OpVectorShuffle %118 %118 1 1 1 1 
                              Uniform f32_4* %122 = OpAccessChain %42 %120 %121 
                                       f32_4 %123 = OpLoad %122 
                                       f32_4 %124 = OpFMul %119 %123 
                                                      OpStore %81 %124 
                              Uniform f32_4* %125 = OpAccessChain %42 %120 %120 
                                       f32_4 %126 = OpLoad %125 
                                       f32_4 %127 = OpLoad %21 
                                       f32_4 %128 = OpVectorShuffle %127 %127 0 0 0 0 
                                       f32_4 %129 = OpFMul %126 %128 
                                       f32_4 %130 = OpLoad %81 
                                       f32_4 %131 = OpFAdd %129 %130 
                                                      OpStore %81 %131 
                              Uniform f32_4* %132 = OpAccessChain %42 %120 %44 
                                       f32_4 %133 = OpLoad %132 
                                       f32_4 %134 = OpLoad %21 
                                       f32_4 %135 = OpVectorShuffle %134 %134 2 2 2 2 
                                       f32_4 %136 = OpFMul %133 %135 
                                       f32_4 %137 = OpLoad %81 
                                       f32_4 %138 = OpFAdd %136 %137 
                                                      OpStore %21 %138 
                                       f32_4 %139 = OpLoad %21 
                              Uniform f32_4* %140 = OpAccessChain %42 %120 %92 
                                       f32_4 %141 = OpLoad %140 
                                       f32_4 %142 = OpFAdd %139 %141 
                                                      OpStore %21 %142 
                                       f32_4 %143 = OpLoad %21 
                                       f32_4 %144 = OpVectorShuffle %143 %143 1 1 1 1 
                              Uniform f32_4* %145 = OpAccessChain %42 %121 %121 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpFMul %144 %146 
                                                      OpStore %81 %147 
                              Uniform f32_4* %148 = OpAccessChain %42 %121 %120 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %21 
                                       f32_4 %151 = OpVectorShuffle %150 %150 0 0 0 0 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %81 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %81 %154 
                              Uniform f32_4* %155 = OpAccessChain %42 %121 %44 
                                       f32_4 %156 = OpLoad %155 
                                       f32_4 %157 = OpLoad %21 
                                       f32_4 %158 = OpVectorShuffle %157 %157 2 2 2 2 
                                       f32_4 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %81 
                                       f32_4 %161 = OpFAdd %159 %160 
                                                      OpStore %81 %161 
                              Uniform f32_4* %167 = OpAccessChain %42 %121 %92 
                                       f32_4 %168 = OpLoad %167 
                                       f32_4 %169 = OpLoad %21 
                                       f32_4 %170 = OpVectorShuffle %169 %169 3 3 3 3 
                                       f32_4 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %81 
                                       f32_4 %173 = OpFAdd %171 %172 
                               Output f32_4* %175 = OpAccessChain %166 %120 
                                                      OpStore %175 %173 
                                       f32_4 %179 = OpLoad %178 
                                       f32_2 %180 = OpVectorShuffle %179 %179 0 1 
                              Uniform f32_4* %182 = OpAccessChain %42 %181 
                                       f32_4 %183 = OpLoad %182 
                                       f32_2 %184 = OpVectorShuffle %183 %183 0 1 
                                       f32_2 %185 = OpFMul %180 %184 
                              Uniform f32_4* %186 = OpAccessChain %42 %181 
                                       f32_4 %187 = OpLoad %186 
                                       f32_2 %188 = OpVectorShuffle %187 %187 2 3 
                                       f32_2 %189 = OpFAdd %185 %188 
                                                      OpStore %177 %189 
                                       f32_4 %190 = OpLoad %13 
                                       f32_3 %191 = OpVectorShuffle %190 %190 1 1 1 
                              Uniform f32_4* %192 = OpAccessChain %42 %120 %121 
                                       f32_4 %193 = OpLoad %192 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                                       f32_3 %195 = OpFMul %191 %194 
                                       f32_4 %196 = OpLoad %21 
                                       f32_4 %197 = OpVectorShuffle %196 %195 4 5 6 3 
                                                      OpStore %21 %197 
                              Uniform f32_4* %198 = OpAccessChain %42 %120 %120 
                                       f32_4 %199 = OpLoad %198 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                                       f32_4 %201 = OpLoad %13 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 0 0 
                                       f32_3 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %21 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpFAdd %203 %205 
                                       f32_4 %207 = OpLoad %21 
                                       f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
                                                      OpStore %21 %208 
                              Uniform f32_4* %209 = OpAccessChain %42 %120 %44 
                                       f32_4 %210 = OpLoad %209 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                                       f32_4 %212 = OpLoad %13 
                                       f32_3 %213 = OpVectorShuffle %212 %212 2 2 2 
                                       f32_3 %214 = OpFMul %211 %213 
                                       f32_4 %215 = OpLoad %21 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                                       f32_3 %217 = OpFAdd %214 %216 
                                       f32_4 %218 = OpLoad %21 
                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 6 3 
                                                      OpStore %21 %219 
                              Uniform f32_4* %222 = OpAccessChain %42 %120 %92 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                       f32_4 %225 = OpLoad %13 
                                       f32_3 %226 = OpVectorShuffle %225 %225 3 3 3 
                                       f32_3 %227 = OpFMul %224 %226 
                                       f32_4 %228 = OpLoad %21 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                       f32_3 %230 = OpFAdd %227 %229 
                                                      OpStore %221 %230 
                                                      OpStore %231 %232 
                                                      OpStore %233 %234 
                                 Output f32* %236 = OpAccessChain %166 %120 %162 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFNegate %237 
                                 Output f32* %239 = OpAccessChain %166 %120 %162 
                                                      OpStore %239 %238 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 146
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %33 %63 %132 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpMemberDecorate %12 0 Offset 12 
                                                     OpMemberDecorate %12 1 Offset 12 
                                                     OpMemberDecorate %12 2 Offset 12 
                                                     OpMemberDecorate %12 3 Offset 12 
                                                     OpMemberDecorate %12 4 Offset 12 
                                                     OpDecorate %12 Block 
                                                     OpDecorate %14 DescriptorSet 14 
                                                     OpDecorate %14 Binding 14 
                                                     OpDecorate %33 Location 33 
                                                     OpDecorate %55 RelaxedPrecision 
                                                     OpDecorate %59 RelaxedPrecision 
                                                     OpDecorate %59 DescriptorSet 59 
                                                     OpDecorate %59 Binding 59 
                                                     OpDecorate %60 RelaxedPrecision 
                                                     OpDecorate %63 Location 63 
                                                     OpDecorate %67 RelaxedPrecision 
                                                     OpDecorate %69 RelaxedPrecision 
                                                     OpDecorate %70 RelaxedPrecision 
                                                     OpDecorate %71 RelaxedPrecision 
                                                     OpDecorate %81 RelaxedPrecision 
                                                     OpDecorate %82 RelaxedPrecision 
                                                     OpDecorate %84 RelaxedPrecision 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %128 RelaxedPrecision 
                                                     OpDecorate %132 RelaxedPrecision 
                                                     OpDecorate %132 Location 132 
                                                     OpDecorate %143 RelaxedPrecision 
                                                     OpDecorate %144 RelaxedPrecision 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 3 
                                              %8 = OpTypePointer Private %7 
                               Private f32_3* %9 = OpVariable Private 
                                             %10 = OpTypeInt 32 0 
                                             %11 = OpTypeVector %10 4 
                                             %12 = OpTypeStruct %6 %6 %11 %6 %6 
                                             %13 = OpTypePointer Uniform %12 
Uniform struct {f32; f32; u32_4; f32; f32;}* %14 = OpVariable Uniform 
                                             %15 = OpTypeInt 32 1 
                                         i32 %16 = OpConstant 1 
                                             %17 = OpTypePointer Uniform %6 
                                         i32 %20 = OpConstant 0 
                                         u32 %24 = OpConstant 0 
                                             %25 = OpTypePointer Private %6 
                                         f32 %30 = OpConstant 3.67402E-40 
                                             %32 = OpTypePointer Input %7 
                                Input f32_3* %33 = OpVariable Input 
                                         u32 %34 = OpConstant 1 
                                             %35 = OpTypePointer Input %6 
                                             %40 = OpTypeBool 
                                             %41 = OpTypePointer Private %40 
                               Private bool* %42 = OpVariable Private 
                                         f32 %45 = OpConstant 3.67402E-40 
                                         i32 %49 = OpConstant -1 
                              Private f32_3* %55 = OpVariable Private 
                                             %56 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %57 = OpTypeSampledImage %56 
                                             %58 = OpTypePointer UniformConstant %57 
 UniformConstant read_only Texture2DSampled* %59 = OpVariable UniformConstant 
                                             %61 = OpTypeVector %6 2 
                                             %62 = OpTypePointer Input %61 
                                Input f32_2* %63 = OpVariable Input 
                                             %65 = OpTypeVector %6 4 
                                             %68 = OpTypePointer Private %65 
                              Private f32_4* %69 = OpVariable Private 
                                Private f32* %74 = OpVariable Private 
                                         i32 %75 = OpConstant 3 
                                         f32 %79 = OpConstant 3.67402E-40 
                                         i32 %89 = OpConstant 4 
                                            %102 = OpTypePointer Function %7 
                                        i32 %104 = OpConstant 2 
                                            %105 = OpTypeVector %40 4 
                                            %106 = OpTypePointer Uniform %11 
                                      f32_3 %115 = OpConstantComposite %45 %45 %45 
                                            %119 = OpTypePointer Function %6 
                                        u32 %129 = OpConstant 3 
                                            %131 = OpTypePointer Output %65 
                              Output f32_4* %132 = OpVariable Output 
                                            %133 = OpTypePointer Function %65 
                                      f32_4 %141 = OpConstantComposite %45 %45 %45 %79 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                            Function f32_3* %103 = OpVariable Function 
                              Function f32* %120 = OpVariable Function 
                            Function f32_4* %134 = OpVariable Function 
                                Uniform f32* %18 = OpAccessChain %14 %16 
                                         f32 %19 = OpLoad %18 
                                Uniform f32* %21 = OpAccessChain %14 %20 
                                         f32 %22 = OpLoad %21 
                                         f32 %23 = OpFMul %19 %22 
                                Private f32* %26 = OpAccessChain %9 %24 
                                                     OpStore %26 %23 
                                Private f32* %27 = OpAccessChain %9 %24 
                                         f32 %28 = OpLoad %27 
                                         f32 %29 = OpFNegate %28 
                                         f32 %31 = OpFMul %29 %30 
                                  Input f32* %36 = OpAccessChain %33 %34 
                                         f32 %37 = OpLoad %36 
                                         f32 %38 = OpFAdd %31 %37 
                                Private f32* %39 = OpAccessChain %9 %24 
                                                     OpStore %39 %38 
                                Private f32* %43 = OpAccessChain %9 %24 
                                         f32 %44 = OpLoad %43 
                                        bool %46 = OpFOrdLessThan %44 %45 
                                                     OpStore %42 %46 
                                        bool %47 = OpLoad %42 
                                         i32 %48 = OpSelect %47 %16 %20 
                                         i32 %50 = OpIMul %48 %49 
                                        bool %51 = OpINotEqual %50 %20 
                                                     OpSelectionMerge %53 None 
                                                     OpBranchConditional %51 %52 %53 
                                             %52 = OpLabel 
                                                     OpKill
                                             %53 = OpLabel 
                  read_only Texture2DSampled %60 = OpLoad %59 
                                       f32_2 %64 = OpLoad %63 
                                       f32_4 %66 = OpImageSampleImplicitLod %60 %64 
                                       f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                                     OpStore %55 %67 
                                       f32_3 %70 = OpLoad %55 
                                       f32_3 %71 = OpExtInst %1 30 %70 
                                       f32_4 %72 = OpLoad %69 
                                       f32_4 %73 = OpVectorShuffle %72 %71 4 5 6 3 
                                                     OpStore %69 %73 
                                Uniform f32* %76 = OpAccessChain %14 %75 
                                         f32 %77 = OpLoad %76 
                                                     OpStore %74 %77 
                                         f32 %78 = OpLoad %74 
                                         f32 %80 = OpExtInst %1 43 %78 %45 %79 
                                                     OpStore %74 %80 
                                       f32_4 %81 = OpLoad %69 
                                       f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                         f32 %83 = OpLoad %74 
                                       f32_3 %84 = OpCompositeConstruct %83 %83 %83 
                                       f32_3 %85 = OpFMul %82 %84 
                                                     OpStore %9 %85 
                                       f32_3 %86 = OpLoad %9 
                                       f32_3 %87 = OpExtInst %1 29 %86 
                                                     OpStore %9 %87 
                                       f32_3 %88 = OpLoad %9 
                                Uniform f32* %90 = OpAccessChain %14 %89 
                                         f32 %91 = OpLoad %90 
                                Uniform f32* %92 = OpAccessChain %14 %89 
                                         f32 %93 = OpLoad %92 
                                Uniform f32* %94 = OpAccessChain %14 %89 
                                         f32 %95 = OpLoad %94 
                                       f32_3 %96 = OpCompositeConstruct %91 %93 %95 
                                         f32 %97 = OpCompositeExtract %96 0 
                                         f32 %98 = OpCompositeExtract %96 1 
                                         f32 %99 = OpCompositeExtract %96 2 
                                      f32_3 %100 = OpCompositeConstruct %97 %98 %99 
                                      f32_3 %101 = OpExtInst %1 37 %88 %100 
                                                     OpStore %9 %101 
                             Uniform u32_4* %107 = OpAccessChain %14 %104 
                                      u32_4 %108 = OpLoad %107 
                                        u32 %109 = OpCompositeExtract %108 0 
                                       bool %110 = OpINotEqual %109 %24 
                                                     OpSelectionMerge %112 None 
                                                     OpBranchConditional %110 %111 %114 
                                            %111 = OpLabel 
                                      f32_3 %113 = OpLoad %9 
                                                     OpStore %103 %113 
                                                     OpBranch %112 
                                            %114 = OpLabel 
                                                     OpStore %103 %115 
                                                     OpBranch %112 
                                            %112 = OpLabel 
                                      f32_3 %116 = OpLoad %103 
                                      f32_4 %117 = OpLoad %69 
                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                                     OpStore %69 %118 
                             Uniform u32_4* %121 = OpAccessChain %14 %104 
                                      u32_4 %122 = OpLoad %121 
                                        u32 %123 = OpCompositeExtract %122 0 
                                       bool %124 = OpINotEqual %123 %24 
                                                     OpSelectionMerge %126 None 
                                                     OpBranchConditional %124 %125 %127 
                                            %125 = OpLabel 
                                                     OpStore %120 %79 
                                                     OpBranch %126 
                                            %127 = OpLabel 
                                                     OpStore %120 %45 
                                                     OpBranch %126 
                                            %126 = OpLabel 
                                        f32 %128 = OpLoad %120 
                               Private f32* %130 = OpAccessChain %69 %129 
                                                     OpStore %130 %128 
                             Uniform u32_4* %135 = OpAccessChain %14 %104 
                                      u32_4 %136 = OpLoad %135 
                                        u32 %137 = OpCompositeExtract %136 1 
                                       bool %138 = OpINotEqual %137 %24 
                                                     OpSelectionMerge %140 None 
                                                     OpBranchConditional %138 %139 %142 
                                            %139 = OpLabel 
                                                     OpStore %134 %141 
                                                     OpBranch %140 
                                            %142 = OpLabel 
                                      f32_4 %143 = OpLoad %69 
                                                     OpStore %134 %143 
                                                     OpBranch %140 
                                            %140 = OpLabel 
                                      f32_4 %144 = OpLoad %134 
                                                     OpStore %132 %144 
                                                     OpReturn
                                                     OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "PIXELSNAP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	bvec4 unity_MetaVertexControl;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
in  vec4 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
bool u_xlatb9;
void main()
{
    u_xlatb0 = 0.0<in_POSITION0.z;
    u_xlat0.z = u_xlatb0 ? 9.99999975e-005 : float(0.0);
    u_xlat1.xy = in_POSITION0.xy / in_POSITION0.ww;
    u_xlat7.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat7.xy * u_xlat1.xy;
    u_xlat1.xy = roundEven(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy / u_xlat7.xy;
    u_xlat1.xy = u_xlat1.xy * in_POSITION0.ww;
    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat1.z = in_POSITION0.z;
    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlatb9 = 0.0<u_xlat0.z;
    u_xlat2.z = u_xlatb9 ? 9.99999975e-005 : float(0.0);
    u_xlat2.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _Threshold;
uniform 	float _PixelHeight;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat16_0;
vec4 u_xlat10_0;
bool u_xlatb0;
float u_xlat3;
void main()
{
    u_xlat0.x = _PixelHeight * _Threshold;
    u_xlat0.x = (-u_xlat0.x) * 0.0625 + vs_TEXCOORD3.y;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = log2(u_xlat10_0.xyz);
    u_xlat3 = unity_OneOverOutputBoost;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat3);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
    u_xlat0.w = 1.0;
    u_xlat0 = (unity_MetaFragmentControl.x) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    SV_Target0 = (unity_MetaFragmentControl.y) ? vec4(0.0, 0.0, 0.0, 1.0) : u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 285
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %85 %133 %210 %221 %222 %265 %275 %277 
                                                      OpDecorate %13 Location 13 
                                                      OpDecorate %46 ArrayStride 46 
                                                      OpDecorate %47 ArrayStride 47 
                                                      OpMemberDecorate %49 0 Offset 49 
                                                      OpMemberDecorate %49 1 Offset 49 
                                                      OpMemberDecorate %49 2 Offset 49 
                                                      OpMemberDecorate %49 3 Offset 49 
                                                      OpMemberDecorate %49 4 Offset 49 
                                                      OpMemberDecorate %49 5 Offset 49 
                                                      OpMemberDecorate %49 6 Offset 49 
                                                      OpDecorate %49 Block 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %133 Location 133 
                                                      OpMemberDecorate %208 0 BuiltIn 208 
                                                      OpMemberDecorate %208 1 BuiltIn 208 
                                                      OpMemberDecorate %208 2 BuiltIn 208 
                                                      OpDecorate %208 Block 
                                                      OpDecorate %221 Location 221 
                                                      OpDecorate %222 Location 222 
                                                      OpDecorate %265 Location 265 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %275 Location 275 
                                                      OpDecorate %277 Location 277 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                               %7 = OpTypePointer Private %6 
                                 Private bool* %8 = OpVariable Private 
                                               %9 = OpTypeFloat 32 
                                          f32 %10 = OpConstant 3.67402E-40 
                                              %11 = OpTypeVector %9 4 
                                              %12 = OpTypePointer Input %11 
                                 Input f32_4* %13 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 2 
                                              %16 = OpTypePointer Input %9 
                                              %20 = OpTypePointer Private %11 
                               Private f32_4* %21 = OpVariable Private 
                                              %22 = OpTypePointer Function %9 
                                          f32 %27 = OpConstant 3.67402E-40 
                                              %30 = OpTypePointer Private %9 
                                              %32 = OpTypeVector %9 3 
                                              %33 = OpTypePointer Private %32 
                               Private f32_3* %34 = OpVariable Private 
                                              %35 = OpTypeVector %9 2 
                                              %43 = OpTypePointer Private %35 
                               Private f32_2* %44 = OpVariable Private 
                                          u32 %45 = OpConstant 4 
                                              %46 = OpTypeArray %11 %45 
                                              %47 = OpTypeArray %11 %45 
                                              %48 = OpTypeVector %14 4 
                                              %49 = OpTypeStruct %11 %46 %47 %11 %11 %48 %11 
                                              %50 = OpTypePointer Uniform %49 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4; u32_4; f32_4;}* %51 = OpVariable Uniform 
                                              %52 = OpTypeInt 32 1 
                                          i32 %53 = OpConstant 0 
                                              %54 = OpTypePointer Uniform %11 
                                          f32 %58 = OpConstant 3.67402E-40 
                                        f32_2 %59 = OpConstantComposite %58 %58 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %88 = OpConstant 3 
                                             %102 = OpTypePointer Function %32 
                                         i32 %104 = OpConstant 5 
                                             %105 = OpTypeVector %6 4 
                                             %106 = OpTypePointer Uniform %48 
                                         u32 %110 = OpConstant 0 
                               Private bool* %121 = OpVariable Private 
                              Private f32_4* %125 = OpVariable Private 
                                Input f32_4* %133 = OpVariable Input 
                                         i32 %136 = OpConstant 4 
                                         i32 %164 = OpConstant 1 
                                         i32 %175 = OpConstant 2 
                                         u32 %206 = OpConstant 1 
                                             %207 = OpTypeArray %9 %206 
                                             %208 = OpTypeStruct %11 %9 %207 
                                             %209 = OpTypePointer Output %208 
        Output struct {f32_4; f32; f32[1];}* %210 = OpVariable Output 
                                             %218 = OpTypePointer Output %11 
                                             %220 = OpTypePointer Output %35 
                               Output f32_2* %221 = OpVariable Output 
                                Input f32_4* %222 = OpVariable Input 
                                         i32 %225 = OpConstant 6 
                                             %264 = OpTypePointer Output %32 
                               Output f32_3* %265 = OpVariable Output 
                               Output f32_4* %275 = OpVariable Output 
                                       f32_4 %276 = OpConstantComposite %10 %10 %10 %10 
                               Output f32_3* %277 = OpVariable Output 
                                       f32_3 %278 = OpConstantComposite %10 %10 %10 
                                             %279 = OpTypePointer Output %9 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %23 = OpVariable Function 
                             Function f32_3* %103 = OpVariable Function 
                               Function f32* %126 = OpVariable Function 
                             Function f32_3* %147 = OpVariable Function 
                                   Input f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                         bool %19 = OpFOrdLessThan %10 %18 
                                                      OpStore %8 %19 
                                         bool %24 = OpLoad %8 
                                                      OpSelectionMerge %26 None 
                                                      OpBranchConditional %24 %25 %28 
                                              %25 = OpLabel 
                                                      OpStore %23 %27 
                                                      OpBranch %26 
                                              %28 = OpLabel 
                                                      OpStore %23 %10 
                                                      OpBranch %26 
                                              %26 = OpLabel 
                                          f32 %29 = OpLoad %23 
                                 Private f32* %31 = OpAccessChain %21 %15 
                                                      OpStore %31 %29 
                                        f32_4 %36 = OpLoad %13 
                                        f32_2 %37 = OpVectorShuffle %36 %36 0 1 
                                        f32_4 %38 = OpLoad %13 
                                        f32_2 %39 = OpVectorShuffle %38 %38 3 3 
                                        f32_2 %40 = OpFDiv %37 %39 
                                        f32_3 %41 = OpLoad %34 
                                        f32_3 %42 = OpVectorShuffle %41 %40 3 4 2 
                                                      OpStore %34 %42 
                               Uniform f32_4* %55 = OpAccessChain %51 %53 
                                        f32_4 %56 = OpLoad %55 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_2 %60 = OpFMul %57 %59 
                                                      OpStore %44 %60 
                                        f32_2 %61 = OpLoad %44 
                                        f32_3 %62 = OpLoad %34 
                                        f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                                        f32_2 %64 = OpFMul %61 %63 
                                        f32_3 %65 = OpLoad %34 
                                        f32_3 %66 = OpVectorShuffle %65 %64 3 4 2 
                                                      OpStore %34 %66 
                                        f32_3 %67 = OpLoad %34 
                                        f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                                        f32_2 %69 = OpExtInst %1 2 %68 
                                        f32_3 %70 = OpLoad %34 
                                        f32_3 %71 = OpVectorShuffle %70 %69 3 4 2 
                                                      OpStore %34 %71 
                                        f32_3 %72 = OpLoad %34 
                                        f32_2 %73 = OpVectorShuffle %72 %72 0 1 
                                        f32_2 %74 = OpLoad %44 
                                        f32_2 %75 = OpFDiv %73 %74 
                                        f32_3 %76 = OpLoad %34 
                                        f32_3 %77 = OpVectorShuffle %76 %75 3 4 2 
                                                      OpStore %34 %77 
                                        f32_3 %78 = OpLoad %34 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                                        f32_4 %80 = OpLoad %13 
                                        f32_2 %81 = OpVectorShuffle %80 %80 3 3 
                                        f32_2 %82 = OpFMul %79 %81 
                                        f32_3 %83 = OpLoad %34 
                                        f32_3 %84 = OpVectorShuffle %83 %82 3 4 2 
                                                      OpStore %34 %84 
                                        f32_4 %86 = OpLoad %85 
                                        f32_2 %87 = OpVectorShuffle %86 %86 0 1 
                               Uniform f32_4* %89 = OpAccessChain %51 %88 
                                        f32_4 %90 = OpLoad %89 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                                        f32_2 %92 = OpFMul %87 %91 
                               Uniform f32_4* %93 = OpAccessChain %51 %88 
                                        f32_4 %94 = OpLoad %93 
                                        f32_2 %95 = OpVectorShuffle %94 %94 2 3 
                                        f32_2 %96 = OpFAdd %92 %95 
                                        f32_4 %97 = OpLoad %21 
                                        f32_4 %98 = OpVectorShuffle %97 %96 4 5 2 3 
                                                      OpStore %21 %98 
                                   Input f32* %99 = OpAccessChain %13 %15 
                                         f32 %100 = OpLoad %99 
                                Private f32* %101 = OpAccessChain %34 %15 
                                                      OpStore %101 %100 
                              Uniform u32_4* %107 = OpAccessChain %51 %104 
                                       u32_4 %108 = OpLoad %107 
                                         u32 %109 = OpCompositeExtract %108 0 
                                        bool %111 = OpINotEqual %109 %110 
                                                      OpSelectionMerge %113 None 
                                                      OpBranchConditional %111 %112 %116 
                                             %112 = OpLabel 
                                       f32_4 %114 = OpLoad %21 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                                      OpStore %103 %115 
                                                      OpBranch %113 
                                             %116 = OpLabel 
                                       f32_3 %117 = OpLoad %34 
                                                      OpStore %103 %117 
                                                      OpBranch %113 
                                             %113 = OpLabel 
                                       f32_3 %118 = OpLoad %103 
                                       f32_4 %119 = OpLoad %21 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %21 %120 
                                Private f32* %122 = OpAccessChain %21 %15 
                                         f32 %123 = OpLoad %122 
                                        bool %124 = OpFOrdLessThan %10 %123 
                                                      OpStore %121 %124 
                                        bool %127 = OpLoad %121 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %130 
                                             %128 = OpLabel 
                                                      OpStore %126 %27 
                                                      OpBranch %129 
                                             %130 = OpLabel 
                                                      OpStore %126 %10 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                         f32 %131 = OpLoad %126 
                                Private f32* %132 = OpAccessChain %125 %15 
                                                      OpStore %132 %131 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                              Uniform f32_4* %137 = OpAccessChain %51 %136 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
                                       f32_2 %140 = OpFMul %135 %139 
                              Uniform f32_4* %141 = OpAccessChain %51 %136 
                                       f32_4 %142 = OpLoad %141 
                                       f32_2 %143 = OpVectorShuffle %142 %142 2 3 
                                       f32_2 %144 = OpFAdd %140 %143 
                                       f32_4 %145 = OpLoad %125 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 5 2 3 
                                                      OpStore %125 %146 
                              Uniform u32_4* %148 = OpAccessChain %51 %104 
                                       u32_4 %149 = OpLoad %148 
                                         u32 %150 = OpCompositeExtract %149 1 
                                        bool %151 = OpINotEqual %150 %110 
                                                      OpSelectionMerge %153 None 
                                                      OpBranchConditional %151 %152 %156 
                                             %152 = OpLabel 
                                       f32_4 %154 = OpLoad %125 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                                      OpStore %147 %155 
                                                      OpBranch %153 
                                             %156 = OpLabel 
                                       f32_4 %157 = OpLoad %21 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                                      OpStore %147 %158 
                                                      OpBranch %153 
                                             %153 = OpLabel 
                                       f32_3 %159 = OpLoad %147 
                                       f32_4 %160 = OpLoad %21 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 5 6 3 
                                                      OpStore %21 %161 
                                       f32_4 %162 = OpLoad %21 
                                       f32_4 %163 = OpVectorShuffle %162 %162 1 1 1 1 
                              Uniform f32_4* %165 = OpAccessChain %51 %164 %164 
                                       f32_4 %166 = OpLoad %165 
                                       f32_4 %167 = OpFMul %163 %166 
                                                      OpStore %125 %167 
                              Uniform f32_4* %168 = OpAccessChain %51 %164 %53 
                                       f32_4 %169 = OpLoad %168 
                                       f32_4 %170 = OpLoad %21 
                                       f32_4 %171 = OpVectorShuffle %170 %170 0 0 0 0 
                                       f32_4 %172 = OpFMul %169 %171 
                                       f32_4 %173 = OpLoad %125 
                                       f32_4 %174 = OpFAdd %172 %173 
                                                      OpStore %125 %174 
                              Uniform f32_4* %176 = OpAccessChain %51 %164 %175 
                                       f32_4 %177 = OpLoad %176 
                                       f32_4 %178 = OpLoad %21 
                                       f32_4 %179 = OpVectorShuffle %178 %178 2 2 2 2 
                                       f32_4 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %125 
                                       f32_4 %182 = OpFAdd %180 %181 
                                                      OpStore %21 %182 
                                       f32_4 %183 = OpLoad %21 
                              Uniform f32_4* %184 = OpAccessChain %51 %164 %88 
                                       f32_4 %185 = OpLoad %184 
                                       f32_4 %186 = OpFAdd %183 %185 
                                                      OpStore %21 %186 
                                       f32_4 %187 = OpLoad %21 
                                       f32_4 %188 = OpVectorShuffle %187 %187 1 1 1 1 
                              Uniform f32_4* %189 = OpAccessChain %51 %175 %164 
                                       f32_4 %190 = OpLoad %189 
                                       f32_4 %191 = OpFMul %188 %190 
                                                      OpStore %125 %191 
                              Uniform f32_4* %192 = OpAccessChain %51 %175 %53 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %21 
                                       f32_4 %195 = OpVectorShuffle %194 %194 0 0 0 0 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %125 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore %125 %198 
                              Uniform f32_4* %199 = OpAccessChain %51 %175 %175 
                                       f32_4 %200 = OpLoad %199 
                                       f32_4 %201 = OpLoad %21 
                                       f32_4 %202 = OpVectorShuffle %201 %201 2 2 2 2 
                                       f32_4 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %125 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %125 %205 
                              Uniform f32_4* %211 = OpAccessChain %51 %175 %88 
                                       f32_4 %212 = OpLoad %211 
                                       f32_4 %213 = OpLoad %21 
                                       f32_4 %214 = OpVectorShuffle %213 %213 3 3 3 3 
                                       f32_4 %215 = OpFMul %212 %214 
                                       f32_4 %216 = OpLoad %125 
                                       f32_4 %217 = OpFAdd %215 %216 
                               Output f32_4* %219 = OpAccessChain %210 %53 
                                                      OpStore %219 %217 
                                       f32_4 %223 = OpLoad %222 
                                       f32_2 %224 = OpVectorShuffle %223 %223 0 1 
                              Uniform f32_4* %226 = OpAccessChain %51 %225 
                                       f32_4 %227 = OpLoad %226 
                                       f32_2 %228 = OpVectorShuffle %227 %227 0 1 
                                       f32_2 %229 = OpFMul %224 %228 
                              Uniform f32_4* %230 = OpAccessChain %51 %225 
                                       f32_4 %231 = OpLoad %230 
                                       f32_2 %232 = OpVectorShuffle %231 %231 2 3 
                                       f32_2 %233 = OpFAdd %229 %232 
                                                      OpStore %221 %233 
                                       f32_3 %234 = OpLoad %34 
                                       f32_3 %235 = OpVectorShuffle %234 %234 1 1 1 
                              Uniform f32_4* %236 = OpAccessChain %51 %164 %164 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %239 = OpFMul %235 %238 
                                       f32_4 %240 = OpLoad %21 
                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 6 3 
                                                      OpStore %21 %241 
                              Uniform f32_4* %242 = OpAccessChain %51 %164 %53 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_3 %245 = OpLoad %34 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 0 0 
                                       f32_3 %247 = OpFMul %244 %246 
                                       f32_4 %248 = OpLoad %21 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFAdd %247 %249 
                                       f32_4 %251 = OpLoad %21 
                                       f32_4 %252 = OpVectorShuffle %251 %250 4 5 6 3 
                                                      OpStore %21 %252 
                              Uniform f32_4* %253 = OpAccessChain %51 %164 %175 
                                       f32_4 %254 = OpLoad %253 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_4 %256 = OpLoad %13 
                                       f32_3 %257 = OpVectorShuffle %256 %256 2 2 2 
                                       f32_3 %258 = OpFMul %255 %257 
                                       f32_4 %259 = OpLoad %21 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_3 %261 = OpFAdd %258 %260 
                                       f32_4 %262 = OpLoad %21 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %21 %263 
                              Uniform f32_4* %266 = OpAccessChain %51 %164 %88 
                                       f32_4 %267 = OpLoad %266 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                       f32_4 %269 = OpLoad %13 
                                       f32_3 %270 = OpVectorShuffle %269 %269 3 3 3 
                                       f32_3 %271 = OpFMul %268 %270 
                                       f32_4 %272 = OpLoad %21 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %274 = OpFAdd %271 %273 
                                                      OpStore %265 %274 
                                                      OpStore %275 %276 
                                                      OpStore %277 %278 
                                 Output f32* %280 = OpAccessChain %210 %53 %206 
                                         f32 %281 = OpLoad %280 
                                         f32 %282 = OpFNegate %281 
                                 Output f32* %283 = OpAccessChain %210 %53 %206 
                                                      OpStore %283 %282 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 146
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %33 %63 %132 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpMemberDecorate %12 0 Offset 12 
                                                     OpMemberDecorate %12 1 Offset 12 
                                                     OpMemberDecorate %12 2 Offset 12 
                                                     OpMemberDecorate %12 3 Offset 12 
                                                     OpMemberDecorate %12 4 Offset 12 
                                                     OpDecorate %12 Block 
                                                     OpDecorate %14 DescriptorSet 14 
                                                     OpDecorate %14 Binding 14 
                                                     OpDecorate %33 Location 33 
                                                     OpDecorate %55 RelaxedPrecision 
                                                     OpDecorate %59 RelaxedPrecision 
                                                     OpDecorate %59 DescriptorSet 59 
                                                     OpDecorate %59 Binding 59 
                                                     OpDecorate %60 RelaxedPrecision 
                                                     OpDecorate %63 Location 63 
                                                     OpDecorate %67 RelaxedPrecision 
                                                     OpDecorate %69 RelaxedPrecision 
                                                     OpDecorate %70 RelaxedPrecision 
                                                     OpDecorate %71 RelaxedPrecision 
                                                     OpDecorate %81 RelaxedPrecision 
                                                     OpDecorate %82 RelaxedPrecision 
                                                     OpDecorate %84 RelaxedPrecision 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %128 RelaxedPrecision 
                                                     OpDecorate %132 RelaxedPrecision 
                                                     OpDecorate %132 Location 132 
                                                     OpDecorate %143 RelaxedPrecision 
                                                     OpDecorate %144 RelaxedPrecision 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 3 
                                              %8 = OpTypePointer Private %7 
                               Private f32_3* %9 = OpVariable Private 
                                             %10 = OpTypeInt 32 0 
                                             %11 = OpTypeVector %10 4 
                                             %12 = OpTypeStruct %6 %6 %11 %6 %6 
                                             %13 = OpTypePointer Uniform %12 
Uniform struct {f32; f32; u32_4; f32; f32;}* %14 = OpVariable Uniform 
                                             %15 = OpTypeInt 32 1 
                                         i32 %16 = OpConstant 1 
                                             %17 = OpTypePointer Uniform %6 
                                         i32 %20 = OpConstant 0 
                                         u32 %24 = OpConstant 0 
                                             %25 = OpTypePointer Private %6 
                                         f32 %30 = OpConstant 3.67402E-40 
                                             %32 = OpTypePointer Input %7 
                                Input f32_3* %33 = OpVariable Input 
                                         u32 %34 = OpConstant 1 
                                             %35 = OpTypePointer Input %6 
                                             %40 = OpTypeBool 
                                             %41 = OpTypePointer Private %40 
                               Private bool* %42 = OpVariable Private 
                                         f32 %45 = OpConstant 3.67402E-40 
                                         i32 %49 = OpConstant -1 
                              Private f32_3* %55 = OpVariable Private 
                                             %56 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %57 = OpTypeSampledImage %56 
                                             %58 = OpTypePointer UniformConstant %57 
 UniformConstant read_only Texture2DSampled* %59 = OpVariable UniformConstant 
                                             %61 = OpTypeVector %6 2 
                                             %62 = OpTypePointer Input %61 
                                Input f32_2* %63 = OpVariable Input 
                                             %65 = OpTypeVector %6 4 
                                             %68 = OpTypePointer Private %65 
                              Private f32_4* %69 = OpVariable Private 
                                Private f32* %74 = OpVariable Private 
                                         i32 %75 = OpConstant 3 
                                         f32 %79 = OpConstant 3.67402E-40 
                                         i32 %89 = OpConstant 4 
                                            %102 = OpTypePointer Function %7 
                                        i32 %104 = OpConstant 2 
                                            %105 = OpTypeVector %40 4 
                                            %106 = OpTypePointer Uniform %11 
                                      f32_3 %115 = OpConstantComposite %45 %45 %45 
                                            %119 = OpTypePointer Function %6 
                                        u32 %129 = OpConstant 3 
                                            %131 = OpTypePointer Output %65 
                              Output f32_4* %132 = OpVariable Output 
                                            %133 = OpTypePointer Function %65 
                                      f32_4 %141 = OpConstantComposite %45 %45 %45 %79 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                            Function f32_3* %103 = OpVariable Function 
                              Function f32* %120 = OpVariable Function 
                            Function f32_4* %134 = OpVariable Function 
                                Uniform f32* %18 = OpAccessChain %14 %16 
                                         f32 %19 = OpLoad %18 
                                Uniform f32* %21 = OpAccessChain %14 %20 
                                         f32 %22 = OpLoad %21 
                                         f32 %23 = OpFMul %19 %22 
                                Private f32* %26 = OpAccessChain %9 %24 
                                                     OpStore %26 %23 
                                Private f32* %27 = OpAccessChain %9 %24 
                                         f32 %28 = OpLoad %27 
                                         f32 %29 = OpFNegate %28 
                                         f32 %31 = OpFMul %29 %30 
                                  Input f32* %36 = OpAccessChain %33 %34 
                                         f32 %37 = OpLoad %36 
                                         f32 %38 = OpFAdd %31 %37 
                                Private f32* %39 = OpAccessChain %9 %24 
                                                     OpStore %39 %38 
                                Private f32* %43 = OpAccessChain %9 %24 
                                         f32 %44 = OpLoad %43 
                                        bool %46 = OpFOrdLessThan %44 %45 
                                                     OpStore %42 %46 
                                        bool %47 = OpLoad %42 
                                         i32 %48 = OpSelect %47 %16 %20 
                                         i32 %50 = OpIMul %48 %49 
                                        bool %51 = OpINotEqual %50 %20 
                                                     OpSelectionMerge %53 None 
                                                     OpBranchConditional %51 %52 %53 
                                             %52 = OpLabel 
                                                     OpKill
                                             %53 = OpLabel 
                  read_only Texture2DSampled %60 = OpLoad %59 
                                       f32_2 %64 = OpLoad %63 
                                       f32_4 %66 = OpImageSampleImplicitLod %60 %64 
                                       f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                                     OpStore %55 %67 
                                       f32_3 %70 = OpLoad %55 
                                       f32_3 %71 = OpExtInst %1 30 %70 
                                       f32_4 %72 = OpLoad %69 
                                       f32_4 %73 = OpVectorShuffle %72 %71 4 5 6 3 
                                                     OpStore %69 %73 
                                Uniform f32* %76 = OpAccessChain %14 %75 
                                         f32 %77 = OpLoad %76 
                                                     OpStore %74 %77 
                                         f32 %78 = OpLoad %74 
                                         f32 %80 = OpExtInst %1 43 %78 %45 %79 
                                                     OpStore %74 %80 
                                       f32_4 %81 = OpLoad %69 
                                       f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                         f32 %83 = OpLoad %74 
                                       f32_3 %84 = OpCompositeConstruct %83 %83 %83 
                                       f32_3 %85 = OpFMul %82 %84 
                                                     OpStore %9 %85 
                                       f32_3 %86 = OpLoad %9 
                                       f32_3 %87 = OpExtInst %1 29 %86 
                                                     OpStore %9 %87 
                                       f32_3 %88 = OpLoad %9 
                                Uniform f32* %90 = OpAccessChain %14 %89 
                                         f32 %91 = OpLoad %90 
                                Uniform f32* %92 = OpAccessChain %14 %89 
                                         f32 %93 = OpLoad %92 
                                Uniform f32* %94 = OpAccessChain %14 %89 
                                         f32 %95 = OpLoad %94 
                                       f32_3 %96 = OpCompositeConstruct %91 %93 %95 
                                         f32 %97 = OpCompositeExtract %96 0 
                                         f32 %98 = OpCompositeExtract %96 1 
                                         f32 %99 = OpCompositeExtract %96 2 
                                      f32_3 %100 = OpCompositeConstruct %97 %98 %99 
                                      f32_3 %101 = OpExtInst %1 37 %88 %100 
                                                     OpStore %9 %101 
                             Uniform u32_4* %107 = OpAccessChain %14 %104 
                                      u32_4 %108 = OpLoad %107 
                                        u32 %109 = OpCompositeExtract %108 0 
                                       bool %110 = OpINotEqual %109 %24 
                                                     OpSelectionMerge %112 None 
                                                     OpBranchConditional %110 %111 %114 
                                            %111 = OpLabel 
                                      f32_3 %113 = OpLoad %9 
                                                     OpStore %103 %113 
                                                     OpBranch %112 
                                            %114 = OpLabel 
                                                     OpStore %103 %115 
                                                     OpBranch %112 
                                            %112 = OpLabel 
                                      f32_3 %116 = OpLoad %103 
                                      f32_4 %117 = OpLoad %69 
                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                                     OpStore %69 %118 
                             Uniform u32_4* %121 = OpAccessChain %14 %104 
                                      u32_4 %122 = OpLoad %121 
                                        u32 %123 = OpCompositeExtract %122 0 
                                       bool %124 = OpINotEqual %123 %24 
                                                     OpSelectionMerge %126 None 
                                                     OpBranchConditional %124 %125 %127 
                                            %125 = OpLabel 
                                                     OpStore %120 %79 
                                                     OpBranch %126 
                                            %127 = OpLabel 
                                                     OpStore %120 %45 
                                                     OpBranch %126 
                                            %126 = OpLabel 
                                        f32 %128 = OpLoad %120 
                               Private f32* %130 = OpAccessChain %69 %129 
                                                     OpStore %130 %128 
                             Uniform u32_4* %135 = OpAccessChain %14 %104 
                                      u32_4 %136 = OpLoad %135 
                                        u32 %137 = OpCompositeExtract %136 1 
                                       bool %138 = OpINotEqual %137 %24 
                                                     OpSelectionMerge %140 None 
                                                     OpBranchConditional %138 %139 %142 
                                            %139 = OpLabel 
                                                     OpStore %134 %141 
                                                     OpBranch %140 
                                            %142 = OpLabel 
                                      f32_4 %143 = OpLoad %69 
                                                     OpStore %134 %143 
                                                     OpBranch %140 
                                            %140 = OpLabel 
                                      f32_4 %144 = OpLoad %134 
                                                     OpStore %132 %144 
                                                     OpReturn
                                                     OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "DUMMY" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DUMMY" }
""
}
SubProgram "vulkan " {
Keywords { "DUMMY" }
""
}
SubProgram "d3d11 " {
Keywords { "PIXELSNAP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "PIXELSNAP_ON" }
""
}
}
}
}
Fallback "Transparent/VertexLit"
}