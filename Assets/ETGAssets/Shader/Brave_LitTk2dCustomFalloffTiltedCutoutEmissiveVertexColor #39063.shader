//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/LitTk2dCustomFalloffTiltedCutoutEmissiveVertexColor" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
_EmissivePower ("Emissive Power", Float) = 0
_EmissiveColorPower ("Emissive Color Power", Float) = 7
_EmissiveColor ("Emissive Color", Color) = (1,1,1,1)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "SHADOWSUPPORT" = "true" }
  ColorMask RGB 0
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 50088
Program "vp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat5;
float u_xlat13;
bool u_xlatb13;
float u_xlat14;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat5.x = u_xlat1.x * u_xlat1.x;
    u_xlat5.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat5.xyz = u_xlat0.xyz + (-vs_COLOR0.xyz);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz + vs_COLOR0.xyz;
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat13 = u_xlat0.w + (-_Cutoff);
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
    u_xlatb13 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb13){
        u_xlatb13 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat13 = u_xlat3.y * 0.25 + 0.75;
        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat13, u_xlat14);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat13 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat3;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 161
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %150 %152 
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
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %152 Location 152 
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
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                               Output f32_4* %149 = OpVariable Output 
                                Input f32_4* %150 = OpVariable Input 
                               Output f32_3* %152 = OpVariable Output 
                                         f32 %153 = OpConstant 3.67402E-40 
                                       f32_3 %154 = OpConstantComposite %153 %153 %153 
                                             %155 = OpTypePointer Output %6 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                       f32_4 %151 = OpLoad %150 
                                                      OpStore %149 %151 
                                                      OpStore %152 %154 
                                 Output f32* %156 = OpAccessChain %81 %23 %77 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFNegate %157 
                                 Output f32* %159 = OpAccessChain %81 %23 %77 
                                                      OpStore %159 %158 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 271
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %57 %140 %249 %255 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %74 ArrayStride 74 
                                                      OpMemberDecorate %75 0 RelaxedPrecision 
                                                      OpMemberDecorate %75 0 Offset 75 
                                                      OpMemberDecorate %75 1 Offset 75 
                                                      OpMemberDecorate %75 2 Offset 75 
                                                      OpMemberDecorate %75 3 Offset 75 
                                                      OpMemberDecorate %75 4 Offset 75 
                                                      OpMemberDecorate %75 5 RelaxedPrecision 
                                                      OpMemberDecorate %75 5 Offset 75 
                                                      OpMemberDecorate %75 6 Offset 75 
                                                      OpMemberDecorate %75 7 Offset 75 
                                                      OpMemberDecorate %75 8 RelaxedPrecision 
                                                      OpMemberDecorate %75 8 Offset 75 
                                                      OpDecorate %75 Block 
                                                      OpDecorate %77 DescriptorSet 77 
                                                      OpDecorate %77 Binding 77 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %131 SpecId 131 
                                                      OpDecorate %140 Location 140 
                                                      OpDecorate %216 DescriptorSet 216 
                                                      OpDecorate %216 Binding 216 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %249 Location 249 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %255 Location 255 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                               Private f32_3* %53 = OpVariable Private 
                                              %56 = OpTypePointer Input %7 
                                 Input f32_4* %57 = OpVariable Input 
                               Private f32_3* %71 = OpVariable Private 
                                          u32 %73 = OpConstant 4 
                                              %74 = OpTypeArray %7 %73 
                                              %75 = OpTypeStruct %7 %7 %74 %21 %21 %7 %6 %6 %6 
                                              %76 = OpTypePointer Uniform %75 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32;}* %77 = OpVariable Uniform 
                                              %78 = OpTypeInt 32 1 
                                          i32 %79 = OpConstant 7 
                                              %80 = OpTypePointer Uniform %6 
                                          u32 %95 = OpConstant 3 
                                          i32 %98 = OpConstant 8 
                                             %104 = OpTypeBool 
                                             %105 = OpTypePointer Private %104 
                               Private bool* %106 = OpVariable Private 
                                         f32 %109 = OpConstant 3.67402E-40 
                                         i32 %112 = OpConstant 0 
                                         i32 %113 = OpConstant 1 
                                         i32 %115 = OpConstant -1 
                                         f32 %123 = OpConstant 3.67402E-40 
                                        bool %125 = OpConstantFalse 
                                        bool %131 = OpSpecConstantFalse 
                                         u32 %134 = OpConstant 1 
                              Private f32_3* %138 = OpVariable Private 
                                             %139 = OpTypePointer Input %21 
                                Input f32_3* %140 = OpVariable Input 
                                         i32 %143 = OpConstant 2 
                                             %144 = OpTypePointer Uniform %7 
                                         i32 %166 = OpConstant 3 
                                             %171 = OpTypePointer Function %21 
                                         i32 %181 = OpConstant 4 
                                             %182 = OpTypePointer Uniform %21 
                              Private f32_4* %187 = OpVariable Private 
                                Private f32* %194 = OpVariable Private 
                                         f32 %197 = OpConstant 3.67402E-40 
                                         f32 %199 = OpConstant 3.67402E-40 
                                         u32 %201 = OpConstant 2 
                                         f32 %204 = OpConstant 3.67402E-40 
                                             %213 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %214 = OpTypeSampledImage %213 
                                             %215 = OpTypePointer UniformConstant %214 
 UniformConstant read_only Texture3DSampled* %216 = OpVariable UniformConstant 
                              Private f32_3* %227 = OpVariable Private 
                              Private f32_3* %237 = OpVariable Private 
                                         i32 %239 = OpConstant 5 
                                Input f32_3* %249 = OpVariable Input 
                                             %254 = OpTypePointer Output %7 
                               Output f32_4* %255 = OpVariable Output 
                                             %258 = OpTypePointer Output %6 
                                         i32 %260 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %172 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                 Private f32* %35 = OpAccessChain %20 %30 
                                          f32 %36 = OpLoad %35 
                                 Private f32* %37 = OpAccessChain %20 %30 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFMul %36 %38 
                                 Private f32* %40 = OpAccessChain %34 %30 
                                                      OpStore %40 %39 
                                 Private f32* %41 = OpAccessChain %20 %30 
                                          f32 %42 = OpLoad %41 
                                 Private f32* %43 = OpAccessChain %34 %30 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFMul %42 %44 
                                 Private f32* %46 = OpAccessChain %34 %30 
                                                      OpStore %46 %45 
                                 Private f32* %47 = OpAccessChain %20 %30 
                                          f32 %48 = OpLoad %47 
                                 Private f32* %49 = OpAccessChain %34 %30 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFMul %48 %50 
                                 Private f32* %52 = OpAccessChain %34 %30 
                                                      OpStore %52 %51 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFNegate %59 
                                        f32_3 %61 = OpFAdd %55 %60 
                                                      OpStore %53 %61 
                                        f32_3 %62 = OpLoad %34 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 0 0 
                                        f32_3 %64 = OpLoad %53 
                                        f32_3 %65 = OpFMul %63 %64 
                                        f32_4 %66 = OpLoad %57 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFAdd %65 %67 
                                                      OpStore %53 %68 
                                        f32_3 %69 = OpLoad %53 
                                        f32_3 %70 = OpExtInst %1 30 %69 
                                                      OpStore %34 %70 
                                        f32_3 %72 = OpLoad %34 
                                 Uniform f32* %81 = OpAccessChain %77 %79 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %83 = OpAccessChain %77 %79 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %85 = OpAccessChain %77 %79 
                                          f32 %86 = OpLoad %85 
                                        f32_3 %87 = OpCompositeConstruct %82 %84 %86 
                                          f32 %88 = OpCompositeExtract %87 0 
                                          f32 %89 = OpCompositeExtract %87 1 
                                          f32 %90 = OpCompositeExtract %87 2 
                                        f32_3 %91 = OpCompositeConstruct %88 %89 %90 
                                        f32_3 %92 = OpFMul %72 %91 
                                                      OpStore %71 %92 
                                        f32_3 %93 = OpLoad %71 
                                        f32_3 %94 = OpExtInst %1 29 %93 
                                                      OpStore %71 %94 
                                 Private f32* %96 = OpAccessChain %9 %95 
                                          f32 %97 = OpLoad %96 
                                 Uniform f32* %99 = OpAccessChain %77 %98 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFNegate %100 
                                         f32 %102 = OpFAdd %97 %101 
                                Private f32* %103 = OpAccessChain %20 %30 
                                                      OpStore %103 %102 
                                Private f32* %107 = OpAccessChain %20 %30 
                                         f32 %108 = OpLoad %107 
                                        bool %110 = OpFOrdLessThan %108 %109 
                                                      OpStore %106 %110 
                                        bool %111 = OpLoad %106 
                                         i32 %114 = OpSelect %111 %113 %112 
                                         i32 %116 = OpIMul %114 %115 
                                        bool %117 = OpINotEqual %116 %112 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                                      OpKill
                                             %119 = OpLabel 
                                Uniform f32* %121 = OpAccessChain %77 %113 %30 
                                         f32 %122 = OpLoad %121 
                                        bool %124 = OpFOrdEqual %122 %123 
                                                      OpStore %106 %124 
                                                      OpSelectionMerge %127 None 
                                                      OpBranchConditional %125 %126 %127 
                                             %126 = OpLabel 
                                        bool %128 = OpLoad %106 
                                                      OpSelectionMerge %130 None 
                                                      OpBranchConditional %128 %129 %130 
                                             %129 = OpLabel 
                                                      OpBranch %130 
                                             %130 = OpLabel 
                                                      OpBranch %127 
                                             %127 = OpLabel 
                                                      OpSelectionMerge %133 None 
                                                      OpBranchConditional %131 %132 %222 
                                             %132 = OpLabel 
                                Uniform f32* %135 = OpAccessChain %77 %113 %134 
                                         f32 %136 = OpLoad %135 
                                        bool %137 = OpFOrdEqual %136 %123 
                                                      OpStore %106 %137 
                                       f32_3 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 1 1 1 
                              Uniform f32_4* %145 = OpAccessChain %77 %143 %113 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFMul %142 %147 
                                                      OpStore %138 %148 
                              Uniform f32_4* %149 = OpAccessChain %77 %143 %112 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpLoad %140 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 0 0 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_3 %155 = OpLoad %138 
                                       f32_3 %156 = OpFAdd %154 %155 
                                                      OpStore %138 %156 
                              Uniform f32_4* %157 = OpAccessChain %77 %143 %143 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpLoad %140 
                                       f32_3 %161 = OpVectorShuffle %160 %160 2 2 2 
                                       f32_3 %162 = OpFMul %159 %161 
                                       f32_3 %163 = OpLoad %138 
                                       f32_3 %164 = OpFAdd %162 %163 
                                                      OpStore %138 %164 
                                       f32_3 %165 = OpLoad %138 
                              Uniform f32_4* %167 = OpAccessChain %77 %143 %166 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFAdd %165 %169 
                                                      OpStore %138 %170 
                                        bool %173 = OpLoad %106 
                                                      OpSelectionMerge %175 None 
                                                      OpBranchConditional %173 %174 %177 
                                             %174 = OpLabel 
                                       f32_3 %176 = OpLoad %138 
                                                      OpStore %172 %176 
                                                      OpBranch %175 
                                             %177 = OpLabel 
                                       f32_3 %178 = OpLoad %140 
                                                      OpStore %172 %178 
                                                      OpBranch %175 
                                             %175 = OpLabel 
                                       f32_3 %179 = OpLoad %172 
                                                      OpStore %138 %179 
                                       f32_3 %180 = OpLoad %138 
                              Uniform f32_3* %183 = OpAccessChain %77 %181 
                                       f32_3 %184 = OpLoad %183 
                                       f32_3 %185 = OpFNegate %184 
                                       f32_3 %186 = OpFAdd %180 %185 
                                                      OpStore %138 %186 
                                       f32_3 %188 = OpLoad %138 
                              Uniform f32_3* %189 = OpAccessChain %77 %166 
                                       f32_3 %190 = OpLoad %189 
                                       f32_3 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %187 
                                       f32_4 %193 = OpVectorShuffle %192 %191 0 4 5 6 
                                                      OpStore %187 %193 
                                Private f32* %195 = OpAccessChain %187 %134 
                                         f32 %196 = OpLoad %195 
                                         f32 %198 = OpFMul %196 %197 
                                         f32 %200 = OpFAdd %198 %199 
                                                      OpStore %194 %200 
                                Uniform f32* %202 = OpAccessChain %77 %113 %201 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %206 = OpFAdd %205 %199 
                                Private f32* %207 = OpAccessChain %138 %30 
                                                      OpStore %207 %206 
                                         f32 %208 = OpLoad %194 
                                Private f32* %209 = OpAccessChain %138 %30 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpExtInst %1 40 %208 %210 
                                Private f32* %212 = OpAccessChain %187 %30 
                                                      OpStore %212 %211 
                  read_only Texture3DSampled %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %187 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 2 3 
                                       f32_4 %220 = OpImageSampleImplicitLod %217 %219 
                                                      OpStore %187 %220 
                                       f32_4 %221 = OpLoad %187 
                                                      OpStore %20 %221 
                                                      OpBranch %133 
                                             %222 = OpLabel 
                                Private f32* %223 = OpAccessChain %20 %30 
                                                      OpStore %223 %123 
                                Private f32* %224 = OpAccessChain %20 %134 
                                                      OpStore %224 %123 
                                Private f32* %225 = OpAccessChain %20 %201 
                                                      OpStore %225 %123 
                                Private f32* %226 = OpAccessChain %20 %95 
                                                      OpStore %226 %123 
                                                      OpBranch %133 
                                             %133 = OpLabel 
                                       f32_4 %228 = OpLoad %20 
                              Uniform f32_4* %229 = OpAccessChain %77 %112 
                                       f32_4 %230 = OpLoad %229 
                                         f32 %231 = OpDot %228 %230 
                                Private f32* %232 = OpAccessChain %227 %30 
                                                      OpStore %232 %231 
                                Private f32* %233 = OpAccessChain %227 %30 
                                         f32 %234 = OpLoad %233 
                                         f32 %235 = OpExtInst %1 43 %234 %109 %123 
                                Private f32* %236 = OpAccessChain %227 %30 
                                                      OpStore %236 %235 
                                       f32_3 %238 = OpLoad %53 
                              Uniform f32_4* %240 = OpAccessChain %77 %239 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %243 = OpFMul %238 %242 
                                                      OpStore %237 %243 
                                       f32_3 %244 = OpLoad %227 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpLoad %237 
                                       f32_3 %247 = OpFMul %245 %246 
                                                      OpStore %227 %247 
                                       f32_3 %248 = OpLoad %53 
                                       f32_3 %250 = OpLoad %249 
                                       f32_3 %251 = OpFMul %248 %250 
                                       f32_3 %252 = OpLoad %227 
                                       f32_3 %253 = OpFAdd %251 %252 
                                                      OpStore %227 %253 
                                Private f32* %256 = OpAccessChain %9 %95 
                                         f32 %257 = OpLoad %256 
                                 Output f32* %259 = OpAccessChain %255 %95 
                                                      OpStore %259 %257 
                                Uniform f32* %261 = OpAccessChain %77 %260 
                                         f32 %262 = OpLoad %261 
                                       f32_3 %263 = OpCompositeConstruct %262 %262 %262 
                                       f32_3 %264 = OpLoad %71 
                                       f32_3 %265 = OpFMul %263 %264 
                                       f32_3 %266 = OpLoad %227 
                                       f32_3 %267 = OpFAdd %265 %266 
                                       f32_4 %268 = OpLoad %255 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %255 %269 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat5;
float u_xlat13;
bool u_xlatb13;
float u_xlat14;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat5.x = u_xlat1.x * u_xlat1.x;
    u_xlat5.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat5.xyz = u_xlat0.xyz + (-vs_COLOR0.xyz);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz + vs_COLOR0.xyz;
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat13 = u_xlat0.w + (-_Cutoff);
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
    u_xlatb13 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb13){
        u_xlatb13 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat13 = u_xlat3.y * 0.25 + 0.75;
        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat13, u_xlat14);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat13 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat3;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 276
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %83 %95 %96 %110 %149 %152 %155 %157 %158 %267 
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
                                                      OpMemberDecorate %81 0 BuiltIn 81 
                                                      OpMemberDecorate %81 1 BuiltIn 81 
                                                      OpMemberDecorate %81 2 BuiltIn 81 
                                                      OpDecorate %81 Block 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %155 Location 155 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %267 Location 267 
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
                               Private f32_4* %58 = OpVariable Private 
                                          i32 %61 = OpConstant 9 
                                          u32 %79 = OpConstant 1 
                                              %80 = OpTypeArray %6 %79 
                                              %81 = OpTypeStruct %7 %6 %80 
                                              %82 = OpTypePointer Output %81 
         Output struct {f32_4; f32; f32[1];}* %83 = OpVariable Output 
                                              %91 = OpTypePointer Output %7 
                                              %93 = OpTypeVector %6 2 
                                              %94 = OpTypePointer Output %93 
                                Output f32_2* %95 = OpVariable Output 
                                 Input f32_4* %96 = OpVariable Input 
                                          i32 %99 = OpConstant 10 
                                             %108 = OpTypeVector %6 3 
                                             %109 = OpTypePointer Input %108 
                                Input f32_3* %110 = OpVariable Input 
                                         i32 %112 = OpConstant 8 
                                         u32 %117 = OpConstant 0 
                                             %118 = OpTypePointer Private %6 
                                         u32 %131 = OpConstant 2 
                                Private f32* %133 = OpVariable Private 
                                             %148 = OpTypePointer Output %108 
                               Output f32_3* %149 = OpVariable Output 
                               Output f32_3* %152 = OpVariable Output 
                               Output f32_4* %155 = OpVariable Output 
                               Output f32_4* %157 = OpVariable Output 
                                Input f32_4* %158 = OpVariable Input 
                                             %160 = OpTypePointer Private %108 
                              Private f32_3* %161 = OpVariable Private 
                              Private f32_4* %178 = OpVariable Private 
                              Private f32_3* %184 = OpVariable Private 
                                         i32 %190 = OpConstant 4 
                                         i32 %196 = OpConstant 5 
                                         i32 %202 = OpConstant 6 
                                         f32 %211 = OpConstant 3.67402E-40 
                                         u32 %212 = OpConstant 3 
                                         f32 %233 = OpConstant 3.67402E-40 
                                       f32_3 %234 = OpConstantComposite %233 %233 %233 
                                         f32 %242 = OpConstant 3.67402E-40 
                                       f32_3 %243 = OpConstantComposite %242 %242 %242 
                                         f32 %254 = OpConstant 3.67402E-40 
                                       f32_3 %255 = OpConstantComposite %254 %254 %254 
                                         f32 %257 = OpConstant 3.67402E-40 
                                       f32_3 %258 = OpConstantComposite %257 %257 %257 
                               Output f32_3* %267 = OpVariable Output 
                                             %270 = OpTypePointer Output %6 
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
                               Uniform f32_4* %51 = OpAccessChain %21 %23 %47 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %11 
                                        f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                        f32_4 %55 = OpFMul %52 %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpFAdd %55 %56 
                                                      OpStore %9 %57 
                                        f32_4 %59 = OpLoad %45 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %62 = OpAccessChain %21 %61 %24 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %60 %63 
                                                      OpStore %58 %64 
                               Uniform f32_4* %65 = OpAccessChain %21 %61 %29 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %45 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %58 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %58 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %61 %37 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %45 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %58 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %58 %78 
                               Uniform f32_4* %84 = OpAccessChain %21 %61 %47 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpLoad %45 
                                        f32_4 %87 = OpVectorShuffle %86 %86 3 3 3 3 
                                        f32_4 %88 = OpFMul %85 %87 
                                        f32_4 %89 = OpLoad %58 
                                        f32_4 %90 = OpFAdd %88 %89 
                                Output f32_4* %92 = OpAccessChain %83 %29 
                                                      OpStore %92 %90 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %100 = OpAccessChain %21 %99 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_2 %103 = OpFMul %98 %102 
                              Uniform f32_4* %104 = OpAccessChain %21 %99 
                                       f32_4 %105 = OpLoad %104 
                                       f32_2 %106 = OpVectorShuffle %105 %105 2 3 
                                       f32_2 %107 = OpFAdd %103 %106 
                                                      OpStore %95 %107 
                                       f32_3 %111 = OpLoad %110 
                              Uniform f32_4* %113 = OpAccessChain %21 %112 %29 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                         f32 %116 = OpDot %111 %115 
                                Private f32* %119 = OpAccessChain %45 %117 
                                                      OpStore %119 %116 
                                       f32_3 %120 = OpLoad %110 
                              Uniform f32_4* %121 = OpAccessChain %21 %112 %24 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                         f32 %124 = OpDot %120 %123 
                                Private f32* %125 = OpAccessChain %45 %79 
                                                      OpStore %125 %124 
                                       f32_3 %126 = OpLoad %110 
                              Uniform f32_4* %127 = OpAccessChain %21 %112 %37 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                         f32 %130 = OpDot %126 %129 
                                Private f32* %132 = OpAccessChain %45 %131 
                                                      OpStore %132 %130 
                                       f32_4 %134 = OpLoad %45 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_4 %136 = OpLoad %45 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                         f32 %138 = OpDot %135 %137 
                                                      OpStore %133 %138 
                                         f32 %139 = OpLoad %133 
                                         f32 %140 = OpExtInst %1 32 %139 
                                                      OpStore %133 %140 
                                         f32 %141 = OpLoad %133 
                                       f32_3 %142 = OpCompositeConstruct %141 %141 %141 
                                       f32_4 %143 = OpLoad %45 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %45 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %45 %147 
                                       f32_4 %150 = OpLoad %45 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                                      OpStore %149 %151 
                                       f32_4 %153 = OpLoad %9 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                                      OpStore %152 %154 
                                       f32_4 %156 = OpLoad %9 
                                                      OpStore %155 %156 
                                       f32_4 %159 = OpLoad %158 
                                                      OpStore %157 %159 
                                Private f32* %162 = OpAccessChain %45 %79 
                                         f32 %163 = OpLoad %162 
                                Private f32* %164 = OpAccessChain %45 %79 
                                         f32 %165 = OpLoad %164 
                                         f32 %166 = OpFMul %163 %165 
                                Private f32* %167 = OpAccessChain %161 %117 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %45 %117 
                                         f32 %169 = OpLoad %168 
                                Private f32* %170 = OpAccessChain %45 %117 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFMul %169 %171 
                                Private f32* %173 = OpAccessChain %161 %117 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFNegate %174 
                                         f32 %176 = OpFAdd %172 %175 
                                Private f32* %177 = OpAccessChain %161 %117 
                                                      OpStore %177 %176 
                                       f32_4 %179 = OpLoad %45 
                                       f32_4 %180 = OpVectorShuffle %179 %179 1 2 2 0 
                                       f32_4 %181 = OpLoad %45 
                                       f32_4 %182 = OpVectorShuffle %181 %181 0 1 2 2 
                                       f32_4 %183 = OpFMul %180 %182 
                                                      OpStore %178 %183 
                              Uniform f32_4* %185 = OpAccessChain %21 %47 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %178 
                                         f32 %188 = OpDot %186 %187 
                                Private f32* %189 = OpAccessChain %184 %117 
                                                      OpStore %189 %188 
                              Uniform f32_4* %191 = OpAccessChain %21 %190 
                                       f32_4 %192 = OpLoad %191 
                                       f32_4 %193 = OpLoad %178 
                                         f32 %194 = OpDot %192 %193 
                                Private f32* %195 = OpAccessChain %184 %79 
                                                      OpStore %195 %194 
                              Uniform f32_4* %197 = OpAccessChain %21 %196 
                                       f32_4 %198 = OpLoad %197 
                                       f32_4 %199 = OpLoad %178 
                                         f32 %200 = OpDot %198 %199 
                                Private f32* %201 = OpAccessChain %184 %131 
                                                      OpStore %201 %200 
                              Uniform f32_4* %203 = OpAccessChain %21 %202 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpLoad %161 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 0 0 
                                       f32_3 %208 = OpFMul %205 %207 
                                       f32_3 %209 = OpLoad %184 
                                       f32_3 %210 = OpFAdd %208 %209 
                                                      OpStore %161 %210 
                                Private f32* %213 = OpAccessChain %45 %212 
                                                      OpStore %213 %211 
                              Uniform f32_4* %214 = OpAccessChain %21 %29 
                                       f32_4 %215 = OpLoad %214 
                                       f32_4 %216 = OpLoad %45 
                                         f32 %217 = OpDot %215 %216 
                                Private f32* %218 = OpAccessChain %184 %117 
                                                      OpStore %218 %217 
                              Uniform f32_4* %219 = OpAccessChain %21 %24 
                                       f32_4 %220 = OpLoad %219 
                                       f32_4 %221 = OpLoad %45 
                                         f32 %222 = OpDot %220 %221 
                                Private f32* %223 = OpAccessChain %184 %79 
                                                      OpStore %223 %222 
                              Uniform f32_4* %224 = OpAccessChain %21 %37 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpLoad %45 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %184 %131 
                                                      OpStore %228 %227 
                                       f32_3 %229 = OpLoad %161 
                                       f32_3 %230 = OpLoad %184 
                                       f32_3 %231 = OpFAdd %229 %230 
                                                      OpStore %161 %231 
                                       f32_3 %232 = OpLoad %161 
                                       f32_3 %235 = OpExtInst %1 40 %232 %234 
                                                      OpStore %161 %235 
                                       f32_3 %236 = OpLoad %161 
                                       f32_3 %237 = OpExtInst %1 30 %236 
                                       f32_4 %238 = OpLoad %45 
                                       f32_4 %239 = OpVectorShuffle %238 %237 4 5 6 3 
                                                      OpStore %45 %239 
                                       f32_4 %240 = OpLoad %45 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                       f32_3 %244 = OpFMul %241 %243 
                                       f32_4 %245 = OpLoad %45 
                                       f32_4 %246 = OpVectorShuffle %245 %244 4 5 6 3 
                                                      OpStore %45 %246 
                                       f32_4 %247 = OpLoad %45 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_3 %249 = OpExtInst %1 29 %248 
                                       f32_4 %250 = OpLoad %45 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %45 %251 
                                       f32_4 %252 = OpLoad %45 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_3 %256 = OpFMul %253 %255 
                                       f32_3 %259 = OpFAdd %256 %258 
                                       f32_4 %260 = OpLoad %45 
                                       f32_4 %261 = OpVectorShuffle %260 %259 4 5 6 3 
                                                      OpStore %45 %261 
                                       f32_4 %262 = OpLoad %45 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpExtInst %1 40 %263 %234 
                                       f32_4 %265 = OpLoad %45 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 6 3 
                                                      OpStore %45 %266 
                                       f32_4 %268 = OpLoad %45 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                                      OpStore %267 %269 
                                 Output f32* %271 = OpAccessChain %83 %29 %79 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFNegate %272 
                                 Output f32* %274 = OpAccessChain %83 %29 %79 
                                                      OpStore %274 %273 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 271
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %57 %140 %249 %255 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %74 ArrayStride 74 
                                                      OpMemberDecorate %75 0 RelaxedPrecision 
                                                      OpMemberDecorate %75 0 Offset 75 
                                                      OpMemberDecorate %75 1 Offset 75 
                                                      OpMemberDecorate %75 2 Offset 75 
                                                      OpMemberDecorate %75 3 Offset 75 
                                                      OpMemberDecorate %75 4 Offset 75 
                                                      OpMemberDecorate %75 5 RelaxedPrecision 
                                                      OpMemberDecorate %75 5 Offset 75 
                                                      OpMemberDecorate %75 6 Offset 75 
                                                      OpMemberDecorate %75 7 Offset 75 
                                                      OpMemberDecorate %75 8 RelaxedPrecision 
                                                      OpMemberDecorate %75 8 Offset 75 
                                                      OpDecorate %75 Block 
                                                      OpDecorate %77 DescriptorSet 77 
                                                      OpDecorate %77 Binding 77 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %131 SpecId 131 
                                                      OpDecorate %140 Location 140 
                                                      OpDecorate %216 DescriptorSet 216 
                                                      OpDecorate %216 Binding 216 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %249 Location 249 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %255 Location 255 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                               Private f32_3* %53 = OpVariable Private 
                                              %56 = OpTypePointer Input %7 
                                 Input f32_4* %57 = OpVariable Input 
                               Private f32_3* %71 = OpVariable Private 
                                          u32 %73 = OpConstant 4 
                                              %74 = OpTypeArray %7 %73 
                                              %75 = OpTypeStruct %7 %7 %74 %21 %21 %7 %6 %6 %6 
                                              %76 = OpTypePointer Uniform %75 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32;}* %77 = OpVariable Uniform 
                                              %78 = OpTypeInt 32 1 
                                          i32 %79 = OpConstant 7 
                                              %80 = OpTypePointer Uniform %6 
                                          u32 %95 = OpConstant 3 
                                          i32 %98 = OpConstant 8 
                                             %104 = OpTypeBool 
                                             %105 = OpTypePointer Private %104 
                               Private bool* %106 = OpVariable Private 
                                         f32 %109 = OpConstant 3.67402E-40 
                                         i32 %112 = OpConstant 0 
                                         i32 %113 = OpConstant 1 
                                         i32 %115 = OpConstant -1 
                                         f32 %123 = OpConstant 3.67402E-40 
                                        bool %125 = OpConstantFalse 
                                        bool %131 = OpSpecConstantFalse 
                                         u32 %134 = OpConstant 1 
                              Private f32_3* %138 = OpVariable Private 
                                             %139 = OpTypePointer Input %21 
                                Input f32_3* %140 = OpVariable Input 
                                         i32 %143 = OpConstant 2 
                                             %144 = OpTypePointer Uniform %7 
                                         i32 %166 = OpConstant 3 
                                             %171 = OpTypePointer Function %21 
                                         i32 %181 = OpConstant 4 
                                             %182 = OpTypePointer Uniform %21 
                              Private f32_4* %187 = OpVariable Private 
                                Private f32* %194 = OpVariable Private 
                                         f32 %197 = OpConstant 3.67402E-40 
                                         f32 %199 = OpConstant 3.67402E-40 
                                         u32 %201 = OpConstant 2 
                                         f32 %204 = OpConstant 3.67402E-40 
                                             %213 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %214 = OpTypeSampledImage %213 
                                             %215 = OpTypePointer UniformConstant %214 
 UniformConstant read_only Texture3DSampled* %216 = OpVariable UniformConstant 
                              Private f32_3* %227 = OpVariable Private 
                              Private f32_3* %237 = OpVariable Private 
                                         i32 %239 = OpConstant 5 
                                Input f32_3* %249 = OpVariable Input 
                                             %254 = OpTypePointer Output %7 
                               Output f32_4* %255 = OpVariable Output 
                                             %258 = OpTypePointer Output %6 
                                         i32 %260 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %172 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                 Private f32* %35 = OpAccessChain %20 %30 
                                          f32 %36 = OpLoad %35 
                                 Private f32* %37 = OpAccessChain %20 %30 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFMul %36 %38 
                                 Private f32* %40 = OpAccessChain %34 %30 
                                                      OpStore %40 %39 
                                 Private f32* %41 = OpAccessChain %20 %30 
                                          f32 %42 = OpLoad %41 
                                 Private f32* %43 = OpAccessChain %34 %30 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFMul %42 %44 
                                 Private f32* %46 = OpAccessChain %34 %30 
                                                      OpStore %46 %45 
                                 Private f32* %47 = OpAccessChain %20 %30 
                                          f32 %48 = OpLoad %47 
                                 Private f32* %49 = OpAccessChain %34 %30 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFMul %48 %50 
                                 Private f32* %52 = OpAccessChain %34 %30 
                                                      OpStore %52 %51 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFNegate %59 
                                        f32_3 %61 = OpFAdd %55 %60 
                                                      OpStore %53 %61 
                                        f32_3 %62 = OpLoad %34 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 0 0 
                                        f32_3 %64 = OpLoad %53 
                                        f32_3 %65 = OpFMul %63 %64 
                                        f32_4 %66 = OpLoad %57 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFAdd %65 %67 
                                                      OpStore %53 %68 
                                        f32_3 %69 = OpLoad %53 
                                        f32_3 %70 = OpExtInst %1 30 %69 
                                                      OpStore %34 %70 
                                        f32_3 %72 = OpLoad %34 
                                 Uniform f32* %81 = OpAccessChain %77 %79 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %83 = OpAccessChain %77 %79 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %85 = OpAccessChain %77 %79 
                                          f32 %86 = OpLoad %85 
                                        f32_3 %87 = OpCompositeConstruct %82 %84 %86 
                                          f32 %88 = OpCompositeExtract %87 0 
                                          f32 %89 = OpCompositeExtract %87 1 
                                          f32 %90 = OpCompositeExtract %87 2 
                                        f32_3 %91 = OpCompositeConstruct %88 %89 %90 
                                        f32_3 %92 = OpFMul %72 %91 
                                                      OpStore %71 %92 
                                        f32_3 %93 = OpLoad %71 
                                        f32_3 %94 = OpExtInst %1 29 %93 
                                                      OpStore %71 %94 
                                 Private f32* %96 = OpAccessChain %9 %95 
                                          f32 %97 = OpLoad %96 
                                 Uniform f32* %99 = OpAccessChain %77 %98 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFNegate %100 
                                         f32 %102 = OpFAdd %97 %101 
                                Private f32* %103 = OpAccessChain %20 %30 
                                                      OpStore %103 %102 
                                Private f32* %107 = OpAccessChain %20 %30 
                                         f32 %108 = OpLoad %107 
                                        bool %110 = OpFOrdLessThan %108 %109 
                                                      OpStore %106 %110 
                                        bool %111 = OpLoad %106 
                                         i32 %114 = OpSelect %111 %113 %112 
                                         i32 %116 = OpIMul %114 %115 
                                        bool %117 = OpINotEqual %116 %112 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                                      OpKill
                                             %119 = OpLabel 
                                Uniform f32* %121 = OpAccessChain %77 %113 %30 
                                         f32 %122 = OpLoad %121 
                                        bool %124 = OpFOrdEqual %122 %123 
                                                      OpStore %106 %124 
                                                      OpSelectionMerge %127 None 
                                                      OpBranchConditional %125 %126 %127 
                                             %126 = OpLabel 
                                        bool %128 = OpLoad %106 
                                                      OpSelectionMerge %130 None 
                                                      OpBranchConditional %128 %129 %130 
                                             %129 = OpLabel 
                                                      OpBranch %130 
                                             %130 = OpLabel 
                                                      OpBranch %127 
                                             %127 = OpLabel 
                                                      OpSelectionMerge %133 None 
                                                      OpBranchConditional %131 %132 %222 
                                             %132 = OpLabel 
                                Uniform f32* %135 = OpAccessChain %77 %113 %134 
                                         f32 %136 = OpLoad %135 
                                        bool %137 = OpFOrdEqual %136 %123 
                                                      OpStore %106 %137 
                                       f32_3 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 1 1 1 
                              Uniform f32_4* %145 = OpAccessChain %77 %143 %113 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFMul %142 %147 
                                                      OpStore %138 %148 
                              Uniform f32_4* %149 = OpAccessChain %77 %143 %112 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpLoad %140 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 0 0 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_3 %155 = OpLoad %138 
                                       f32_3 %156 = OpFAdd %154 %155 
                                                      OpStore %138 %156 
                              Uniform f32_4* %157 = OpAccessChain %77 %143 %143 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpLoad %140 
                                       f32_3 %161 = OpVectorShuffle %160 %160 2 2 2 
                                       f32_3 %162 = OpFMul %159 %161 
                                       f32_3 %163 = OpLoad %138 
                                       f32_3 %164 = OpFAdd %162 %163 
                                                      OpStore %138 %164 
                                       f32_3 %165 = OpLoad %138 
                              Uniform f32_4* %167 = OpAccessChain %77 %143 %166 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFAdd %165 %169 
                                                      OpStore %138 %170 
                                        bool %173 = OpLoad %106 
                                                      OpSelectionMerge %175 None 
                                                      OpBranchConditional %173 %174 %177 
                                             %174 = OpLabel 
                                       f32_3 %176 = OpLoad %138 
                                                      OpStore %172 %176 
                                                      OpBranch %175 
                                             %177 = OpLabel 
                                       f32_3 %178 = OpLoad %140 
                                                      OpStore %172 %178 
                                                      OpBranch %175 
                                             %175 = OpLabel 
                                       f32_3 %179 = OpLoad %172 
                                                      OpStore %138 %179 
                                       f32_3 %180 = OpLoad %138 
                              Uniform f32_3* %183 = OpAccessChain %77 %181 
                                       f32_3 %184 = OpLoad %183 
                                       f32_3 %185 = OpFNegate %184 
                                       f32_3 %186 = OpFAdd %180 %185 
                                                      OpStore %138 %186 
                                       f32_3 %188 = OpLoad %138 
                              Uniform f32_3* %189 = OpAccessChain %77 %166 
                                       f32_3 %190 = OpLoad %189 
                                       f32_3 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %187 
                                       f32_4 %193 = OpVectorShuffle %192 %191 0 4 5 6 
                                                      OpStore %187 %193 
                                Private f32* %195 = OpAccessChain %187 %134 
                                         f32 %196 = OpLoad %195 
                                         f32 %198 = OpFMul %196 %197 
                                         f32 %200 = OpFAdd %198 %199 
                                                      OpStore %194 %200 
                                Uniform f32* %202 = OpAccessChain %77 %113 %201 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %206 = OpFAdd %205 %199 
                                Private f32* %207 = OpAccessChain %138 %30 
                                                      OpStore %207 %206 
                                         f32 %208 = OpLoad %194 
                                Private f32* %209 = OpAccessChain %138 %30 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpExtInst %1 40 %208 %210 
                                Private f32* %212 = OpAccessChain %187 %30 
                                                      OpStore %212 %211 
                  read_only Texture3DSampled %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %187 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 2 3 
                                       f32_4 %220 = OpImageSampleImplicitLod %217 %219 
                                                      OpStore %187 %220 
                                       f32_4 %221 = OpLoad %187 
                                                      OpStore %20 %221 
                                                      OpBranch %133 
                                             %222 = OpLabel 
                                Private f32* %223 = OpAccessChain %20 %30 
                                                      OpStore %223 %123 
                                Private f32* %224 = OpAccessChain %20 %134 
                                                      OpStore %224 %123 
                                Private f32* %225 = OpAccessChain %20 %201 
                                                      OpStore %225 %123 
                                Private f32* %226 = OpAccessChain %20 %95 
                                                      OpStore %226 %123 
                                                      OpBranch %133 
                                             %133 = OpLabel 
                                       f32_4 %228 = OpLoad %20 
                              Uniform f32_4* %229 = OpAccessChain %77 %112 
                                       f32_4 %230 = OpLoad %229 
                                         f32 %231 = OpDot %228 %230 
                                Private f32* %232 = OpAccessChain %227 %30 
                                                      OpStore %232 %231 
                                Private f32* %233 = OpAccessChain %227 %30 
                                         f32 %234 = OpLoad %233 
                                         f32 %235 = OpExtInst %1 43 %234 %109 %123 
                                Private f32* %236 = OpAccessChain %227 %30 
                                                      OpStore %236 %235 
                                       f32_3 %238 = OpLoad %53 
                              Uniform f32_4* %240 = OpAccessChain %77 %239 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %243 = OpFMul %238 %242 
                                                      OpStore %237 %243 
                                       f32_3 %244 = OpLoad %227 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpLoad %237 
                                       f32_3 %247 = OpFMul %245 %246 
                                                      OpStore %227 %247 
                                       f32_3 %248 = OpLoad %53 
                                       f32_3 %250 = OpLoad %249 
                                       f32_3 %251 = OpFMul %248 %250 
                                       f32_3 %252 = OpLoad %227 
                                       f32_3 %253 = OpFAdd %251 %252 
                                                      OpStore %227 %253 
                                Private f32* %256 = OpAccessChain %9 %95 
                                         f32 %257 = OpLoad %256 
                                 Output f32* %259 = OpAccessChain %255 %95 
                                                      OpStore %259 %257 
                                Uniform f32* %261 = OpAccessChain %77 %260 
                                         f32 %262 = OpLoad %261 
                                       f32_3 %263 = OpCompositeConstruct %262 %262 %262 
                                       f32_3 %264 = OpLoad %71 
                                       f32_3 %265 = OpFMul %263 %264 
                                       f32_3 %266 = OpLoad %227 
                                       f32_3 %267 = OpFAdd %265 %266 
                                       f32_4 %268 = OpLoad %255 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %255 %269 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat6;
vec3 u_xlat8;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat6.x = u_xlat1.x * u_xlat1.x;
    u_xlat6.x = u_xlat1.x * u_xlat6.x;
    u_xlat1.x = u_xlat1.x * u_xlat6.x;
    u_xlat6.xyz = u_xlat0.xyz + (-vs_COLOR0.xyz);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat6.xyz + vs_COLOR0.xyz;
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat16 = u_xlat0.w + (-_Cutoff);
    u_xlatb16 = u_xlat16<0.0;
    if((int(u_xlatb16) * int(0xffffffffu))!=0){discard;}
    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat17 = sqrt(u_xlat17);
    u_xlat17 = (-u_xlat16) + u_xlat17;
    u_xlat16 = unity_ShadowFadeCenterAndType.w * u_xlat17 + u_xlat16;
    u_xlat16 = u_xlat16 * _LightShadowData.z + _LightShadowData.w;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb3 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat8.xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb3)) ? u_xlat8.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat8.x = u_xlat3.y * 0.25 + 0.75;
        u_xlat4.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat8.x, u_xlat4.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat3.x = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat8.xy);
    u_xlat16 = u_xlat16 + u_xlat10_4.x;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.x = min(u_xlat16, u_xlat3.x);
    u_xlat16 = (u_xlatb17) ? u_xlat3.x : u_xlat16;
    u_xlat3.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat3;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 196
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %88 %94 %95 %109 %140 %146 %149 %151 %152 %154 %176 %188 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %86 0 BuiltIn 86 
                                                      OpMemberDecorate %86 1 BuiltIn 86 
                                                      OpMemberDecorate %86 2 BuiltIn 86 
                                                      OpDecorate %86 Block 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %109 Location 109 
                                                      OpDecorate %140 Location 140 
                                                      OpDecorate %146 Location 146 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %151 Location 151 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %154 Location 154 
                                                      OpDecorate %176 Location 176 
                                                      OpDecorate %188 Location 188 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %84 = OpConstant 1 
                                              %85 = OpTypeArray %6 %84 
                                              %86 = OpTypeStruct %7 %6 %85 
                                              %87 = OpTypePointer Output %86 
         Output struct {f32_4; f32; f32[1];}* %88 = OpVariable Output 
                                              %90 = OpTypePointer Output %7 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                                Output f32_2* %94 = OpVariable Output 
                                 Input f32_4* %95 = OpVariable Input 
                                          i32 %98 = OpConstant 4 
                                             %107 = OpTypeVector %6 3 
                                             %108 = OpTypePointer Input %107 
                                Input f32_3* %109 = OpVariable Input 
                                         u32 %115 = OpConstant 0 
                                             %116 = OpTypePointer Private %6 
                                         u32 %129 = OpConstant 2 
                                Private f32* %131 = OpVariable Private 
                                             %139 = OpTypePointer Output %107 
                               Output f32_3* %140 = OpVariable Output 
                               Output f32_3* %146 = OpVariable Output 
                               Output f32_4* %149 = OpVariable Output 
                               Output f32_4* %151 = OpVariable Output 
                                Input f32_4* %152 = OpVariable Input 
                               Output f32_3* %154 = OpVariable Output 
                                         f32 %155 = OpConstant 3.67402E-40 
                                       f32_3 %156 = OpConstantComposite %155 %155 %155 
                                             %159 = OpTypePointer Uniform %6 
                                         f32 %166 = OpConstant 3.67402E-40 
                                         u32 %168 = OpConstant 3 
                                       f32_2 %172 = OpConstantComposite %166 %166 
                               Output f32_4* %176 = OpVariable Output 
                               Output f32_4* %188 = OpVariable Output 
                                       f32_4 %189 = OpConstantComposite %155 %155 %155 %155 
                                             %190 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %46 %23 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %46 %28 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %46 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %77 = OpAccessChain %21 %46 %46 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpLoad %44 
                                        f32_4 %80 = OpVectorShuffle %79 %79 3 3 3 3 
                                        f32_4 %81 = OpFMul %78 %80 
                                        f32_4 %82 = OpLoad %57 
                                        f32_4 %83 = OpFAdd %81 %82 
                                                      OpStore %44 %83 
                                        f32_4 %89 = OpLoad %44 
                                Output f32_4* %91 = OpAccessChain %88 %28 
                                                      OpStore %91 %89 
                                        f32_4 %96 = OpLoad %95 
                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                               Uniform f32_4* %99 = OpAccessChain %21 %98 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpFMul %97 %101 
                              Uniform f32_4* %103 = OpAccessChain %21 %98 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                       f32_2 %106 = OpFAdd %102 %105 
                                                      OpStore %94 %106 
                                       f32_3 %110 = OpLoad %109 
                              Uniform f32_4* %111 = OpAccessChain %21 %36 %28 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                         f32 %114 = OpDot %110 %113 
                                Private f32* %117 = OpAccessChain %57 %115 
                                                      OpStore %117 %114 
                                       f32_3 %118 = OpLoad %109 
                              Uniform f32_4* %119 = OpAccessChain %21 %36 %23 
                                       f32_4 %120 = OpLoad %119 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                         f32 %122 = OpDot %118 %121 
                                Private f32* %123 = OpAccessChain %57 %84 
                                                      OpStore %123 %122 
                                       f32_3 %124 = OpLoad %109 
                              Uniform f32_4* %125 = OpAccessChain %21 %36 %36 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                         f32 %128 = OpDot %124 %127 
                                Private f32* %130 = OpAccessChain %57 %129 
                                                      OpStore %130 %128 
                                       f32_4 %132 = OpLoad %57 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_4 %134 = OpLoad %57 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                         f32 %136 = OpDot %133 %135 
                                                      OpStore %131 %136 
                                         f32 %137 = OpLoad %131 
                                         f32 %138 = OpExtInst %1 32 %137 
                                                      OpStore %131 %138 
                                         f32 %141 = OpLoad %131 
                                       f32_3 %142 = OpCompositeConstruct %141 %141 %141 
                                       f32_4 %143 = OpLoad %57 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                                      OpStore %140 %145 
                                       f32_4 %147 = OpLoad %9 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                                      OpStore %146 %148 
                                       f32_4 %150 = OpLoad %9 
                                                      OpStore %149 %150 
                                       f32_4 %153 = OpLoad %152 
                                                      OpStore %151 %153 
                                                      OpStore %154 %156 
                                Private f32* %157 = OpAccessChain %44 %84 
                                         f32 %158 = OpLoad %157 
                                Uniform f32* %160 = OpAccessChain %21 %28 %115 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpFMul %158 %161 
                                Private f32* %163 = OpAccessChain %9 %115 
                                                      OpStore %163 %162 
                                Private f32* %164 = OpAccessChain %9 %115 
                                         f32 %165 = OpLoad %164 
                                         f32 %167 = OpFMul %165 %166 
                                Private f32* %169 = OpAccessChain %9 %168 
                                                      OpStore %169 %167 
                                       f32_4 %170 = OpLoad %44 
                                       f32_2 %171 = OpVectorShuffle %170 %170 0 3 
                                       f32_2 %173 = OpFMul %171 %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 1 5 3 
                                                      OpStore %9 %175 
                                       f32_4 %177 = OpLoad %44 
                                       f32_2 %178 = OpVectorShuffle %177 %177 2 3 
                                       f32_4 %179 = OpLoad %176 
                                       f32_4 %180 = OpVectorShuffle %179 %178 0 1 4 5 
                                                      OpStore %176 %180 
                                       f32_4 %181 = OpLoad %9 
                                       f32_2 %182 = OpVectorShuffle %181 %181 2 2 
                                       f32_4 %183 = OpLoad %9 
                                       f32_2 %184 = OpVectorShuffle %183 %183 0 3 
                                       f32_2 %185 = OpFAdd %182 %184 
                                       f32_4 %186 = OpLoad %176 
                                       f32_4 %187 = OpVectorShuffle %186 %185 4 5 2 3 
                                                      OpStore %176 %187 
                                                      OpStore %188 %189 
                                 Output f32* %191 = OpAccessChain %88 %28 %84 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFNegate %192 
                                 Output f32* %194 = OpAccessChain %88 %28 %84 
                                                      OpStore %194 %193 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 375
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %57 %124 %300 %353 %359 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %74 ArrayStride 74 
                                                      OpDecorate %75 ArrayStride 75 
                                                      OpMemberDecorate %76 0 Offset 76 
                                                      OpMemberDecorate %76 1 RelaxedPrecision 
                                                      OpMemberDecorate %76 1 Offset 76 
                                                      OpMemberDecorate %76 2 RelaxedPrecision 
                                                      OpMemberDecorate %76 2 Offset 76 
                                                      OpMemberDecorate %76 3 Offset 76 
                                                      OpMemberDecorate %76 4 Offset 76 
                                                      OpMemberDecorate %76 5 Offset 76 
                                                      OpMemberDecorate %76 6 Offset 76 
                                                      OpMemberDecorate %76 7 Offset 76 
                                                      OpMemberDecorate %76 8 Offset 76 
                                                      OpMemberDecorate %76 9 RelaxedPrecision 
                                                      OpMemberDecorate %76 9 Offset 76 
                                                      OpMemberDecorate %76 10 Offset 76 
                                                      OpMemberDecorate %76 11 Offset 76 
                                                      OpMemberDecorate %76 12 RelaxedPrecision 
                                                      OpMemberDecorate %76 12 Offset 76 
                                                      OpDecorate %76 Block 
                                                      OpDecorate %78 DescriptorSet 78 
                                                      OpDecorate %78 Binding 78 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %199 SpecId 199 
                                                      OpDecorate %279 DescriptorSet 279 
                                                      OpDecorate %279 Binding 279 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %300 Location 300 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %309 DescriptorSet 309 
                                                      OpDecorate %309 Binding 309 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %353 Location 353 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %359 Location 359 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                               Private f32_3* %53 = OpVariable Private 
                                              %56 = OpTypePointer Input %7 
                                 Input f32_4* %57 = OpVariable Input 
                               Private f32_3* %71 = OpVariable Private 
                                          u32 %73 = OpConstant 4 
                                              %74 = OpTypeArray %7 %73 
                                              %75 = OpTypeArray %7 %73 
                                              %76 = OpTypeStruct %21 %7 %7 %7 %74 %7 %75 %21 %21 %7 %6 %6 %6 
                                              %77 = OpTypePointer Uniform %76 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32;}* %78 = OpVariable Uniform 
                                              %79 = OpTypeInt 32 1 
                                          i32 %80 = OpConstant 11 
                                              %81 = OpTypePointer Uniform %6 
                                          u32 %96 = OpConstant 3 
                                          i32 %99 = OpConstant 12 
                                             %105 = OpTypeBool 
                                             %106 = OpTypePointer Private %105 
                               Private bool* %107 = OpVariable Private 
                                         f32 %110 = OpConstant 3.67402E-40 
                                         i32 %113 = OpConstant 0 
                                         i32 %114 = OpConstant 1 
                                         i32 %116 = OpConstant -1 
                              Private f32_3* %122 = OpVariable Private 
                                             %123 = OpTypePointer Input %21 
                                Input f32_3* %124 = OpVariable Input 
                                             %127 = OpTypePointer Uniform %21 
                              Private f32_3* %131 = OpVariable Private 
                                         i32 %132 = OpConstant 4 
                                         u32 %133 = OpConstant 2 
                                         u32 %139 = OpConstant 1 
                                         i32 %141 = OpConstant 2 
                                Private f32* %145 = OpVariable Private 
                                         i32 %150 = OpConstant 3 
                                             %151 = OpTypePointer Uniform %7 
                                         f32 %186 = OpConstant 3.67402E-40 
                               Private bool* %188 = OpVariable Private 
                                         i32 %189 = OpConstant 5 
                                        bool %193 = OpConstantFalse 
                                        bool %199 = OpSpecConstantFalse 
                               Private bool* %202 = OpVariable Private 
                                         i32 %208 = OpConstant 6 
                              Private f32_3* %234 = OpVariable Private 
                                             %235 = OpTypePointer Function %21 
                                         i32 %245 = OpConstant 8 
                              Private f32_4* %250 = OpVariable Private 
                                         i32 %252 = OpConstant 7 
                                         f32 %260 = OpConstant 3.67402E-40 
                                         f32 %262 = OpConstant 3.67402E-40 
                                Private f32* %265 = OpVariable Private 
                                         f32 %268 = OpConstant 3.67402E-40 
                                             %276 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %277 = OpTypeSampledImage %276 
                                             %278 = OpTypePointer UniformConstant %277 
 UniformConstant read_only Texture3DSampled* %279 = OpVariable UniformConstant 
                              Private f32_3* %290 = OpVariable Private 
                                Input f32_4* %300 = OpVariable Input 
                                Private f32* %308 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %309 = OpVariable UniformConstant 
                              Private f32_3* %315 = OpVariable Private 
                                             %330 = OpTypePointer Function %6 
                                         i32 %343 = OpConstant 9 
                                Input f32_3* %353 = OpVariable Input 
                                             %358 = OpTypePointer Output %7 
                               Output f32_4* %359 = OpVariable Output 
                                             %362 = OpTypePointer Output %6 
                                         i32 %364 = OpConstant 10 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %236 = OpVariable Function 
                               Function f32* %331 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                 Private f32* %35 = OpAccessChain %20 %30 
                                          f32 %36 = OpLoad %35 
                                 Private f32* %37 = OpAccessChain %20 %30 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFMul %36 %38 
                                 Private f32* %40 = OpAccessChain %34 %30 
                                                      OpStore %40 %39 
                                 Private f32* %41 = OpAccessChain %20 %30 
                                          f32 %42 = OpLoad %41 
                                 Private f32* %43 = OpAccessChain %34 %30 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFMul %42 %44 
                                 Private f32* %46 = OpAccessChain %34 %30 
                                                      OpStore %46 %45 
                                 Private f32* %47 = OpAccessChain %20 %30 
                                          f32 %48 = OpLoad %47 
                                 Private f32* %49 = OpAccessChain %34 %30 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFMul %48 %50 
                                 Private f32* %52 = OpAccessChain %34 %30 
                                                      OpStore %52 %51 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFNegate %59 
                                        f32_3 %61 = OpFAdd %55 %60 
                                                      OpStore %53 %61 
                                        f32_3 %62 = OpLoad %34 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 0 0 
                                        f32_3 %64 = OpLoad %53 
                                        f32_3 %65 = OpFMul %63 %64 
                                        f32_4 %66 = OpLoad %57 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFAdd %65 %67 
                                                      OpStore %53 %68 
                                        f32_3 %69 = OpLoad %53 
                                        f32_3 %70 = OpExtInst %1 30 %69 
                                                      OpStore %34 %70 
                                        f32_3 %72 = OpLoad %34 
                                 Uniform f32* %82 = OpAccessChain %78 %80 
                                          f32 %83 = OpLoad %82 
                                 Uniform f32* %84 = OpAccessChain %78 %80 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %86 = OpAccessChain %78 %80 
                                          f32 %87 = OpLoad %86 
                                        f32_3 %88 = OpCompositeConstruct %83 %85 %87 
                                          f32 %89 = OpCompositeExtract %88 0 
                                          f32 %90 = OpCompositeExtract %88 1 
                                          f32 %91 = OpCompositeExtract %88 2 
                                        f32_3 %92 = OpCompositeConstruct %89 %90 %91 
                                        f32_3 %93 = OpFMul %72 %92 
                                                      OpStore %71 %93 
                                        f32_3 %94 = OpLoad %71 
                                        f32_3 %95 = OpExtInst %1 29 %94 
                                                      OpStore %71 %95 
                                 Private f32* %97 = OpAccessChain %9 %96 
                                          f32 %98 = OpLoad %97 
                                Uniform f32* %100 = OpAccessChain %78 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFNegate %101 
                                         f32 %103 = OpFAdd %98 %102 
                                Private f32* %104 = OpAccessChain %20 %30 
                                                      OpStore %104 %103 
                                Private f32* %108 = OpAccessChain %20 %30 
                                         f32 %109 = OpLoad %108 
                                        bool %111 = OpFOrdLessThan %109 %110 
                                                      OpStore %107 %111 
                                        bool %112 = OpLoad %107 
                                         i32 %115 = OpSelect %112 %114 %113 
                                         i32 %117 = OpIMul %115 %116 
                                        bool %118 = OpINotEqual %117 %113 
                                                      OpSelectionMerge %120 None 
                                                      OpBranchConditional %118 %119 %120 
                                             %119 = OpLabel 
                                                      OpKill
                                             %120 = OpLabel 
                                       f32_3 %125 = OpLoad %124 
                                       f32_3 %126 = OpFNegate %125 
                              Uniform f32_3* %128 = OpAccessChain %78 %113 
                                       f32_3 %129 = OpLoad %128 
                                       f32_3 %130 = OpFAdd %126 %129 
                                                      OpStore %122 %130 
                                Uniform f32* %134 = OpAccessChain %78 %132 %113 %133 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %131 %30 
                                                      OpStore %136 %135 
                                Uniform f32* %137 = OpAccessChain %78 %132 %114 %133 
                                         f32 %138 = OpLoad %137 
                                Private f32* %140 = OpAccessChain %131 %139 
                                                      OpStore %140 %138 
                                Uniform f32* %142 = OpAccessChain %78 %132 %141 %133 
                                         f32 %143 = OpLoad %142 
                                Private f32* %144 = OpAccessChain %131 %133 
                                                      OpStore %144 %143 
                                       f32_3 %146 = OpLoad %122 
                                       f32_3 %147 = OpLoad %131 
                                         f32 %148 = OpDot %146 %147 
                                                      OpStore %145 %148 
                                       f32_3 %149 = OpLoad %124 
                              Uniform f32_4* %152 = OpAccessChain %78 %150 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFNegate %154 
                                       f32_3 %156 = OpFAdd %149 %155 
                                                      OpStore %122 %156 
                                       f32_3 %157 = OpLoad %122 
                                       f32_3 %158 = OpLoad %122 
                                         f32 %159 = OpDot %157 %158 
                                Private f32* %160 = OpAccessChain %122 %30 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %122 %30 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpExtInst %1 31 %162 
                                Private f32* %164 = OpAccessChain %122 %30 
                                                      OpStore %164 %163 
                                         f32 %165 = OpLoad %145 
                                         f32 %166 = OpFNegate %165 
                                Private f32* %167 = OpAccessChain %122 %30 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFAdd %166 %168 
                                Private f32* %170 = OpAccessChain %122 %30 
                                                      OpStore %170 %169 
                                Uniform f32* %171 = OpAccessChain %78 %150 %96 
                                         f32 %172 = OpLoad %171 
                                Private f32* %173 = OpAccessChain %122 %30 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFMul %172 %174 
                                         f32 %176 = OpLoad %145 
                                         f32 %177 = OpFAdd %175 %176 
                                                      OpStore %145 %177 
                                         f32 %178 = OpLoad %145 
                                Uniform f32* %179 = OpAccessChain %78 %141 %133 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFMul %178 %180 
                                Uniform f32* %182 = OpAccessChain %78 %141 %96 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpFAdd %181 %183 
                                                      OpStore %145 %184 
                                         f32 %185 = OpLoad %145 
                                         f32 %187 = OpExtInst %1 43 %185 %110 %186 
                                                      OpStore %145 %187 
                                Uniform f32* %190 = OpAccessChain %78 %189 %30 
                                         f32 %191 = OpLoad %190 
                                        bool %192 = OpFOrdEqual %191 %186 
                                                      OpStore %188 %192 
                                                      OpSelectionMerge %195 None 
                                                      OpBranchConditional %193 %194 %195 
                                             %194 = OpLabel 
                                        bool %196 = OpLoad %188 
                                                      OpSelectionMerge %198 None 
                                                      OpBranchConditional %196 %197 %198 
                                             %197 = OpLabel 
                                                      OpBranch %198 
                                             %198 = OpLabel 
                                                      OpBranch %195 
                                             %195 = OpLabel 
                                                      OpSelectionMerge %201 None 
                                                      OpBranchConditional %199 %200 %285 
                                             %200 = OpLabel 
                                Uniform f32* %203 = OpAccessChain %78 %189 %139 
                                         f32 %204 = OpLoad %203 
                                        bool %205 = OpFOrdEqual %204 %186 
                                                      OpStore %202 %205 
                                       f32_3 %206 = OpLoad %124 
                                       f32_3 %207 = OpVectorShuffle %206 %206 1 1 1 
                              Uniform f32_4* %209 = OpAccessChain %78 %208 %114 
                                       f32_4 %210 = OpLoad %209 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                                       f32_3 %212 = OpFMul %207 %211 
                                                      OpStore %131 %212 
                              Uniform f32_4* %213 = OpAccessChain %78 %208 %113 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpLoad %124 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 0 0 
                                       f32_3 %218 = OpFMul %215 %217 
                                       f32_3 %219 = OpLoad %131 
                                       f32_3 %220 = OpFAdd %218 %219 
                                                      OpStore %131 %220 
                              Uniform f32_4* %221 = OpAccessChain %78 %208 %141 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                       f32_3 %224 = OpLoad %124 
                                       f32_3 %225 = OpVectorShuffle %224 %224 2 2 2 
                                       f32_3 %226 = OpFMul %223 %225 
                                       f32_3 %227 = OpLoad %131 
                                       f32_3 %228 = OpFAdd %226 %227 
                                                      OpStore %131 %228 
                                       f32_3 %229 = OpLoad %131 
                              Uniform f32_4* %230 = OpAccessChain %78 %208 %150 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpFAdd %229 %232 
                                                      OpStore %131 %233 
                                        bool %237 = OpLoad %202 
                                                      OpSelectionMerge %239 None 
                                                      OpBranchConditional %237 %238 %241 
                                             %238 = OpLabel 
                                       f32_3 %240 = OpLoad %131 
                                                      OpStore %236 %240 
                                                      OpBranch %239 
                                             %241 = OpLabel 
                                       f32_3 %242 = OpLoad %124 
                                                      OpStore %236 %242 
                                                      OpBranch %239 
                                             %239 = OpLabel 
                                       f32_3 %243 = OpLoad %236 
                                                      OpStore %234 %243 
                                       f32_3 %244 = OpLoad %234 
                              Uniform f32_3* %246 = OpAccessChain %78 %245 
                                       f32_3 %247 = OpLoad %246 
                                       f32_3 %248 = OpFNegate %247 
                                       f32_3 %249 = OpFAdd %244 %248 
                                                      OpStore %234 %249 
                                       f32_3 %251 = OpLoad %234 
                              Uniform f32_3* %253 = OpAccessChain %78 %252 
                                       f32_3 %254 = OpLoad %253 
                                       f32_3 %255 = OpFMul %251 %254 
                                       f32_4 %256 = OpLoad %250 
                                       f32_4 %257 = OpVectorShuffle %256 %255 0 4 5 6 
                                                      OpStore %250 %257 
                                Private f32* %258 = OpAccessChain %250 %139 
                                         f32 %259 = OpLoad %258 
                                         f32 %261 = OpFMul %259 %260 
                                         f32 %263 = OpFAdd %261 %262 
                                Private f32* %264 = OpAccessChain %234 %30 
                                                      OpStore %264 %263 
                                Uniform f32* %266 = OpAccessChain %78 %189 %133 
                                         f32 %267 = OpLoad %266 
                                         f32 %269 = OpFMul %267 %268 
                                         f32 %270 = OpFAdd %269 %262 
                                                      OpStore %265 %270 
                                         f32 %271 = OpLoad %265 
                                Private f32* %272 = OpAccessChain %234 %30 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpExtInst %1 40 %271 %273 
                                Private f32* %275 = OpAccessChain %250 %30 
                                                      OpStore %275 %274 
                  read_only Texture3DSampled %280 = OpLoad %279 
                                       f32_4 %281 = OpLoad %250 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 2 3 
                                       f32_4 %283 = OpImageSampleImplicitLod %280 %282 
                                                      OpStore %250 %283 
                                       f32_4 %284 = OpLoad %250 
                                                      OpStore %20 %284 
                                                      OpBranch %201 
                                             %285 = OpLabel 
                                Private f32* %286 = OpAccessChain %20 %30 
                                                      OpStore %286 %186 
                                Private f32* %287 = OpAccessChain %20 %139 
                                                      OpStore %287 %186 
                                Private f32* %288 = OpAccessChain %20 %133 
                                                      OpStore %288 %186 
                                Private f32* %289 = OpAccessChain %20 %96 
                                                      OpStore %289 %186 
                                                      OpBranch %201 
                                             %201 = OpLabel 
                                       f32_4 %291 = OpLoad %20 
                              Uniform f32_4* %292 = OpAccessChain %78 %114 
                                       f32_4 %293 = OpLoad %292 
                                         f32 %294 = OpDot %291 %293 
                                Private f32* %295 = OpAccessChain %290 %30 
                                                      OpStore %295 %294 
                                Private f32* %296 = OpAccessChain %290 %30 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpExtInst %1 43 %297 %110 %186 
                                Private f32* %299 = OpAccessChain %290 %30 
                                                      OpStore %299 %298 
                                       f32_4 %301 = OpLoad %300 
                                       f32_2 %302 = OpVectorShuffle %301 %301 0 1 
                                       f32_4 %303 = OpLoad %300 
                                       f32_2 %304 = OpVectorShuffle %303 %303 3 3 
                                       f32_2 %305 = OpFDiv %302 %304 
                                       f32_3 %306 = OpLoad %234 
                                       f32_3 %307 = OpVectorShuffle %306 %305 3 4 2 
                                                      OpStore %234 %307 
                  read_only Texture2DSampled %310 = OpLoad %309 
                                       f32_3 %311 = OpLoad %234 
                                       f32_2 %312 = OpVectorShuffle %311 %311 0 1 
                                       f32_4 %313 = OpImageSampleImplicitLod %310 %312 
                                         f32 %314 = OpCompositeExtract %313 0 
                                                      OpStore %308 %314 
                                         f32 %316 = OpLoad %145 
                                         f32 %317 = OpLoad %308 
                                         f32 %318 = OpFAdd %316 %317 
                                Private f32* %319 = OpAccessChain %315 %30 
                                                      OpStore %319 %318 
                                Private f32* %320 = OpAccessChain %315 %30 
                                         f32 %321 = OpLoad %320 
                                         f32 %322 = OpExtInst %1 43 %321 %110 %186 
                                Private f32* %323 = OpAccessChain %315 %30 
                                                      OpStore %323 %322 
                                Private f32* %324 = OpAccessChain %315 %30 
                                         f32 %325 = OpLoad %324 
                                Private f32* %326 = OpAccessChain %290 %30 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpExtInst %1 37 %325 %327 
                                Private f32* %329 = OpAccessChain %290 %30 
                                                      OpStore %329 %328 
                                        bool %332 = OpLoad %188 
                                                      OpSelectionMerge %334 None 
                                                      OpBranchConditional %332 %333 %337 
                                             %333 = OpLabel 
                                Private f32* %335 = OpAccessChain %290 %30 
                                         f32 %336 = OpLoad %335 
                                                      OpStore %331 %336 
                                                      OpBranch %334 
                                             %337 = OpLabel 
                                Private f32* %338 = OpAccessChain %315 %30 
                                         f32 %339 = OpLoad %338 
                                                      OpStore %331 %339 
                                                      OpBranch %334 
                                             %334 = OpLabel 
                                         f32 %340 = OpLoad %331 
                                Private f32* %341 = OpAccessChain %290 %30 
                                                      OpStore %341 %340 
                                       f32_3 %342 = OpLoad %53 
                              Uniform f32_4* %344 = OpAccessChain %78 %343 
                                       f32_4 %345 = OpLoad %344 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_3 %347 = OpFMul %342 %346 
                                                      OpStore %315 %347 
                                       f32_3 %348 = OpLoad %290 
                                       f32_3 %349 = OpVectorShuffle %348 %348 0 0 0 
                                       f32_3 %350 = OpLoad %315 
                                       f32_3 %351 = OpFMul %349 %350 
                                                      OpStore %290 %351 
                                       f32_3 %352 = OpLoad %53 
                                       f32_3 %354 = OpLoad %353 
                                       f32_3 %355 = OpFMul %352 %354 
                                       f32_3 %356 = OpLoad %290 
                                       f32_3 %357 = OpFAdd %355 %356 
                                                      OpStore %290 %357 
                                Private f32* %360 = OpAccessChain %9 %96 
                                         f32 %361 = OpLoad %360 
                                 Output f32* %363 = OpAccessChain %359 %96 
                                                      OpStore %363 %361 
                                Uniform f32* %365 = OpAccessChain %78 %364 
                                         f32 %366 = OpLoad %365 
                                       f32_3 %367 = OpCompositeConstruct %366 %366 %366 
                                       f32_3 %368 = OpLoad %71 
                                       f32_3 %369 = OpFMul %367 %368 
                                       f32_3 %370 = OpLoad %290 
                                       f32_3 %371 = OpFAdd %369 %370 
                                       f32_4 %372 = OpLoad %359 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %359 %373 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
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
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat17;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = u_xlat2.y * u_xlat2.y;
    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat3 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat3);
    u_xlat4.y = dot(unity_SHBg, u_xlat3);
    u_xlat4.z = dot(unity_SHBb, u_xlat3);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat6;
vec3 u_xlat8;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat6.x = u_xlat1.x * u_xlat1.x;
    u_xlat6.x = u_xlat1.x * u_xlat6.x;
    u_xlat1.x = u_xlat1.x * u_xlat6.x;
    u_xlat6.xyz = u_xlat0.xyz + (-vs_COLOR0.xyz);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat6.xyz + vs_COLOR0.xyz;
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat16 = u_xlat0.w + (-_Cutoff);
    u_xlatb16 = u_xlat16<0.0;
    if((int(u_xlatb16) * int(0xffffffffu))!=0){discard;}
    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat17 = sqrt(u_xlat17);
    u_xlat17 = (-u_xlat16) + u_xlat17;
    u_xlat16 = unity_ShadowFadeCenterAndType.w * u_xlat17 + u_xlat16;
    u_xlat16 = u_xlat16 * _LightShadowData.z + _LightShadowData.w;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb3 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat8.xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb3)) ? u_xlat8.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat8.x = u_xlat3.y * 0.25 + 0.75;
        u_xlat4.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat8.x, u_xlat4.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat3.x = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat8.xy);
    u_xlat16 = u_xlat16 + u_xlat10_4.x;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.x = min(u_xlat16, u_xlat3.x);
    u_xlat16 = (u_xlatb17) ? u_xlat3.x : u_xlat16;
    u_xlat3.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat3;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 306
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %90 %96 %97 %111 %150 %153 %156 %158 %159 %269 %286 %298 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
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
                                                      OpMemberDecorate %19 7 RelaxedPrecision 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpMemberDecorate %19 10 Offset 19 
                                                      OpMemberDecorate %19 11 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %88 0 BuiltIn 88 
                                                      OpMemberDecorate %88 1 BuiltIn 88 
                                                      OpMemberDecorate %88 2 BuiltIn 88 
                                                      OpDecorate %88 Block 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %111 Location 111 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %153 Location 153 
                                                      OpDecorate %156 Location 156 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %159 Location 159 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %269 Location 269 
                                                      OpDecorate %286 Location 286 
                                                      OpDecorate %298 Location 298 
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
                                              %19 = OpTypeStruct %7 %7 %7 %7 %7 %7 %7 %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 8 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %29 = OpConstant 0 
                                          i32 %37 = OpConstant 2 
                               Private f32_4* %45 = OpVariable Private 
                                          i32 %47 = OpConstant 3 
                               Private f32_4* %58 = OpVariable Private 
                                          i32 %61 = OpConstant 10 
                                          u32 %86 = OpConstant 1 
                                              %87 = OpTypeArray %6 %86 
                                              %88 = OpTypeStruct %7 %6 %87 
                                              %89 = OpTypePointer Output %88 
         Output struct {f32_4; f32; f32[1];}* %90 = OpVariable Output 
                                              %92 = OpTypePointer Output %7 
                                              %94 = OpTypeVector %6 2 
                                              %95 = OpTypePointer Output %94 
                                Output f32_2* %96 = OpVariable Output 
                                 Input f32_4* %97 = OpVariable Input 
                                         i32 %100 = OpConstant 11 
                                             %109 = OpTypeVector %6 3 
                                             %110 = OpTypePointer Input %109 
                                Input f32_3* %111 = OpVariable Input 
                                         i32 %113 = OpConstant 9 
                                         u32 %118 = OpConstant 0 
                                             %119 = OpTypePointer Private %6 
                                         u32 %132 = OpConstant 2 
                                Private f32* %134 = OpVariable Private 
                                             %149 = OpTypePointer Output %109 
                               Output f32_3* %150 = OpVariable Output 
                               Output f32_3* %153 = OpVariable Output 
                               Output f32_4* %156 = OpVariable Output 
                               Output f32_4* %158 = OpVariable Output 
                                Input f32_4* %159 = OpVariable Input 
                                             %161 = OpTypePointer Private %109 
                              Private f32_3* %162 = OpVariable Private 
                              Private f32_4* %179 = OpVariable Private 
                              Private f32_3* %185 = OpVariable Private 
                                         i32 %186 = OpConstant 4 
                                         i32 %192 = OpConstant 5 
                                         i32 %198 = OpConstant 6 
                                         i32 %204 = OpConstant 7 
                                         f32 %213 = OpConstant 3.67402E-40 
                                         u32 %214 = OpConstant 3 
                                         f32 %235 = OpConstant 3.67402E-40 
                                       f32_3 %236 = OpConstantComposite %235 %235 %235 
                                         f32 %244 = OpConstant 3.67402E-40 
                                       f32_3 %245 = OpConstantComposite %244 %244 %244 
                                         f32 %256 = OpConstant 3.67402E-40 
                                       f32_3 %257 = OpConstantComposite %256 %256 %256 
                                         f32 %259 = OpConstant 3.67402E-40 
                                       f32_3 %260 = OpConstantComposite %259 %259 %259 
                               Output f32_3* %269 = OpVariable Output 
                                             %274 = OpTypePointer Uniform %6 
                                         f32 %281 = OpConstant 3.67402E-40 
                                       f32_3 %282 = OpConstantComposite %281 %281 %281 
                               Output f32_4* %286 = OpVariable Output 
                               Output f32_4* %298 = OpVariable Output 
                                       f32_4 %299 = OpConstantComposite %235 %235 %235 %235 
                                             %300 = OpTypePointer Output %6 
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
                               Uniform f32_4* %51 = OpAccessChain %21 %23 %47 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %11 
                                        f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                        f32_4 %55 = OpFMul %52 %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpFAdd %55 %56 
                                                      OpStore %9 %57 
                                        f32_4 %59 = OpLoad %45 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %62 = OpAccessChain %21 %61 %24 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %60 %63 
                                                      OpStore %58 %64 
                               Uniform f32_4* %65 = OpAccessChain %21 %61 %29 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %45 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %58 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %58 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %61 %37 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %45 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %58 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %58 %78 
                               Uniform f32_4* %79 = OpAccessChain %21 %61 %47 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %45 
                                        f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %58 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %45 %85 
                                        f32_4 %91 = OpLoad %45 
                                Output f32_4* %93 = OpAccessChain %90 %29 
                                                      OpStore %93 %91 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                              Uniform f32_4* %101 = OpAccessChain %21 %100 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %99 %103 
                              Uniform f32_4* %105 = OpAccessChain %21 %100 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 2 3 
                                       f32_2 %108 = OpFAdd %104 %107 
                                                      OpStore %96 %108 
                                       f32_3 %112 = OpLoad %111 
                              Uniform f32_4* %114 = OpAccessChain %21 %113 %29 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                         f32 %117 = OpDot %112 %116 
                                Private f32* %120 = OpAccessChain %58 %118 
                                                      OpStore %120 %117 
                                       f32_3 %121 = OpLoad %111 
                              Uniform f32_4* %122 = OpAccessChain %21 %113 %24 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %121 %124 
                                Private f32* %126 = OpAccessChain %58 %86 
                                                      OpStore %126 %125 
                                       f32_3 %127 = OpLoad %111 
                              Uniform f32_4* %128 = OpAccessChain %21 %113 %37 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %131 = OpDot %127 %130 
                                Private f32* %133 = OpAccessChain %58 %132 
                                                      OpStore %133 %131 
                                       f32_4 %135 = OpLoad %58 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %58 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                         f32 %139 = OpDot %136 %138 
                                                      OpStore %134 %139 
                                         f32 %140 = OpLoad %134 
                                         f32 %141 = OpExtInst %1 32 %140 
                                                      OpStore %134 %141 
                                         f32 %142 = OpLoad %134 
                                       f32_3 %143 = OpCompositeConstruct %142 %142 %142 
                                       f32_4 %144 = OpLoad %58 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_3 %146 = OpFMul %143 %145 
                                       f32_4 %147 = OpLoad %58 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %58 %148 
                                       f32_4 %151 = OpLoad %58 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                                      OpStore %150 %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                                      OpStore %153 %155 
                                       f32_4 %157 = OpLoad %9 
                                                      OpStore %156 %157 
                                       f32_4 %160 = OpLoad %159 
                                                      OpStore %158 %160 
                                Private f32* %163 = OpAccessChain %58 %86 
                                         f32 %164 = OpLoad %163 
                                Private f32* %165 = OpAccessChain %58 %86 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFMul %164 %166 
                                Private f32* %168 = OpAccessChain %162 %118 
                                                      OpStore %168 %167 
                                Private f32* %169 = OpAccessChain %58 %118 
                                         f32 %170 = OpLoad %169 
                                Private f32* %171 = OpAccessChain %58 %118 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFMul %170 %172 
                                Private f32* %174 = OpAccessChain %162 %118 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFNegate %175 
                                         f32 %177 = OpFAdd %173 %176 
                                Private f32* %178 = OpAccessChain %162 %118 
                                                      OpStore %178 %177 
                                       f32_4 %180 = OpLoad %58 
                                       f32_4 %181 = OpVectorShuffle %180 %180 1 2 2 0 
                                       f32_4 %182 = OpLoad %58 
                                       f32_4 %183 = OpVectorShuffle %182 %182 0 1 2 2 
                                       f32_4 %184 = OpFMul %181 %183 
                                                      OpStore %179 %184 
                              Uniform f32_4* %187 = OpAccessChain %21 %186 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpLoad %179 
                                         f32 %190 = OpDot %188 %189 
                                Private f32* %191 = OpAccessChain %185 %118 
                                                      OpStore %191 %190 
                              Uniform f32_4* %193 = OpAccessChain %21 %192 
                                       f32_4 %194 = OpLoad %193 
                                       f32_4 %195 = OpLoad %179 
                                         f32 %196 = OpDot %194 %195 
                                Private f32* %197 = OpAccessChain %185 %86 
                                                      OpStore %197 %196 
                              Uniform f32_4* %199 = OpAccessChain %21 %198 
                                       f32_4 %200 = OpLoad %199 
                                       f32_4 %201 = OpLoad %179 
                                         f32 %202 = OpDot %200 %201 
                                Private f32* %203 = OpAccessChain %185 %132 
                                                      OpStore %203 %202 
                              Uniform f32_4* %205 = OpAccessChain %21 %204 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpLoad %162 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 0 0 
                                       f32_3 %210 = OpFMul %207 %209 
                                       f32_3 %211 = OpLoad %185 
                                       f32_3 %212 = OpFAdd %210 %211 
                                                      OpStore %162 %212 
                                Private f32* %215 = OpAccessChain %58 %214 
                                                      OpStore %215 %213 
                              Uniform f32_4* %216 = OpAccessChain %21 %24 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %58 
                                         f32 %219 = OpDot %217 %218 
                                Private f32* %220 = OpAccessChain %185 %118 
                                                      OpStore %220 %219 
                              Uniform f32_4* %221 = OpAccessChain %21 %37 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpLoad %58 
                                         f32 %224 = OpDot %222 %223 
                                Private f32* %225 = OpAccessChain %185 %86 
                                                      OpStore %225 %224 
                              Uniform f32_4* %226 = OpAccessChain %21 %47 
                                       f32_4 %227 = OpLoad %226 
                                       f32_4 %228 = OpLoad %58 
                                         f32 %229 = OpDot %227 %228 
                                Private f32* %230 = OpAccessChain %185 %132 
                                                      OpStore %230 %229 
                                       f32_3 %231 = OpLoad %162 
                                       f32_3 %232 = OpLoad %185 
                                       f32_3 %233 = OpFAdd %231 %232 
                                                      OpStore %162 %233 
                                       f32_3 %234 = OpLoad %162 
                                       f32_3 %237 = OpExtInst %1 40 %234 %236 
                                                      OpStore %162 %237 
                                       f32_3 %238 = OpLoad %162 
                                       f32_3 %239 = OpExtInst %1 30 %238 
                                       f32_4 %240 = OpLoad %58 
                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 6 3 
                                                      OpStore %58 %241 
                                       f32_4 %242 = OpLoad %58 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_4 %247 = OpLoad %58 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %58 %248 
                                       f32_4 %249 = OpLoad %58 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %251 = OpExtInst %1 29 %250 
                                       f32_4 %252 = OpLoad %58 
                                       f32_4 %253 = OpVectorShuffle %252 %251 4 5 6 3 
                                                      OpStore %58 %253 
                                       f32_4 %254 = OpLoad %58 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_3 %258 = OpFMul %255 %257 
                                       f32_3 %261 = OpFAdd %258 %260 
                                       f32_4 %262 = OpLoad %58 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %58 %263 
                                       f32_4 %264 = OpLoad %58 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                                       f32_3 %266 = OpExtInst %1 40 %265 %236 
                                       f32_4 %267 = OpLoad %58 
                                       f32_4 %268 = OpVectorShuffle %267 %266 4 5 6 3 
                                                      OpStore %58 %268 
                                       f32_4 %270 = OpLoad %58 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                                      OpStore %269 %271 
                                Private f32* %272 = OpAccessChain %45 %86 
                                         f32 %273 = OpLoad %272 
                                Uniform f32* %275 = OpAccessChain %21 %29 %118 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpFMul %273 %276 
                                Private f32* %278 = OpAccessChain %45 %86 
                                                      OpStore %278 %277 
                                       f32_4 %279 = OpLoad %45 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 3 1 
                                       f32_3 %283 = OpFMul %280 %282 
                                       f32_4 %284 = OpLoad %58 
                                       f32_4 %285 = OpVectorShuffle %284 %283 4 1 5 6 
                                                      OpStore %58 %285 
                                       f32_4 %287 = OpLoad %45 
                                       f32_2 %288 = OpVectorShuffle %287 %287 2 3 
                                       f32_4 %289 = OpLoad %286 
                                       f32_4 %290 = OpVectorShuffle %289 %288 0 1 4 5 
                                                      OpStore %286 %290 
                                       f32_4 %291 = OpLoad %58 
                                       f32_2 %292 = OpVectorShuffle %291 %291 2 2 
                                       f32_4 %293 = OpLoad %58 
                                       f32_2 %294 = OpVectorShuffle %293 %293 0 3 
                                       f32_2 %295 = OpFAdd %292 %294 
                                       f32_4 %296 = OpLoad %286 
                                       f32_4 %297 = OpVectorShuffle %296 %295 4 5 2 3 
                                                      OpStore %286 %297 
                                                      OpStore %298 %299 
                                 Output f32* %301 = OpAccessChain %90 %29 %86 
                                         f32 %302 = OpLoad %301 
                                         f32 %303 = OpFNegate %302 
                                 Output f32* %304 = OpAccessChain %90 %29 %86 
                                                      OpStore %304 %303 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 375
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %57 %124 %300 %353 %359 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %74 ArrayStride 74 
                                                      OpDecorate %75 ArrayStride 75 
                                                      OpMemberDecorate %76 0 Offset 76 
                                                      OpMemberDecorate %76 1 RelaxedPrecision 
                                                      OpMemberDecorate %76 1 Offset 76 
                                                      OpMemberDecorate %76 2 RelaxedPrecision 
                                                      OpMemberDecorate %76 2 Offset 76 
                                                      OpMemberDecorate %76 3 Offset 76 
                                                      OpMemberDecorate %76 4 Offset 76 
                                                      OpMemberDecorate %76 5 Offset 76 
                                                      OpMemberDecorate %76 6 Offset 76 
                                                      OpMemberDecorate %76 7 Offset 76 
                                                      OpMemberDecorate %76 8 Offset 76 
                                                      OpMemberDecorate %76 9 RelaxedPrecision 
                                                      OpMemberDecorate %76 9 Offset 76 
                                                      OpMemberDecorate %76 10 Offset 76 
                                                      OpMemberDecorate %76 11 Offset 76 
                                                      OpMemberDecorate %76 12 RelaxedPrecision 
                                                      OpMemberDecorate %76 12 Offset 76 
                                                      OpDecorate %76 Block 
                                                      OpDecorate %78 DescriptorSet 78 
                                                      OpDecorate %78 Binding 78 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %199 SpecId 199 
                                                      OpDecorate %279 DescriptorSet 279 
                                                      OpDecorate %279 Binding 279 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %300 Location 300 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %309 DescriptorSet 309 
                                                      OpDecorate %309 Binding 309 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %353 Location 353 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %359 Location 359 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                               Private f32_3* %53 = OpVariable Private 
                                              %56 = OpTypePointer Input %7 
                                 Input f32_4* %57 = OpVariable Input 
                               Private f32_3* %71 = OpVariable Private 
                                          u32 %73 = OpConstant 4 
                                              %74 = OpTypeArray %7 %73 
                                              %75 = OpTypeArray %7 %73 
                                              %76 = OpTypeStruct %21 %7 %7 %7 %74 %7 %75 %21 %21 %7 %6 %6 %6 
                                              %77 = OpTypePointer Uniform %76 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32;}* %78 = OpVariable Uniform 
                                              %79 = OpTypeInt 32 1 
                                          i32 %80 = OpConstant 11 
                                              %81 = OpTypePointer Uniform %6 
                                          u32 %96 = OpConstant 3 
                                          i32 %99 = OpConstant 12 
                                             %105 = OpTypeBool 
                                             %106 = OpTypePointer Private %105 
                               Private bool* %107 = OpVariable Private 
                                         f32 %110 = OpConstant 3.67402E-40 
                                         i32 %113 = OpConstant 0 
                                         i32 %114 = OpConstant 1 
                                         i32 %116 = OpConstant -1 
                              Private f32_3* %122 = OpVariable Private 
                                             %123 = OpTypePointer Input %21 
                                Input f32_3* %124 = OpVariable Input 
                                             %127 = OpTypePointer Uniform %21 
                              Private f32_3* %131 = OpVariable Private 
                                         i32 %132 = OpConstant 4 
                                         u32 %133 = OpConstant 2 
                                         u32 %139 = OpConstant 1 
                                         i32 %141 = OpConstant 2 
                                Private f32* %145 = OpVariable Private 
                                         i32 %150 = OpConstant 3 
                                             %151 = OpTypePointer Uniform %7 
                                         f32 %186 = OpConstant 3.67402E-40 
                               Private bool* %188 = OpVariable Private 
                                         i32 %189 = OpConstant 5 
                                        bool %193 = OpConstantFalse 
                                        bool %199 = OpSpecConstantFalse 
                               Private bool* %202 = OpVariable Private 
                                         i32 %208 = OpConstant 6 
                              Private f32_3* %234 = OpVariable Private 
                                             %235 = OpTypePointer Function %21 
                                         i32 %245 = OpConstant 8 
                              Private f32_4* %250 = OpVariable Private 
                                         i32 %252 = OpConstant 7 
                                         f32 %260 = OpConstant 3.67402E-40 
                                         f32 %262 = OpConstant 3.67402E-40 
                                Private f32* %265 = OpVariable Private 
                                         f32 %268 = OpConstant 3.67402E-40 
                                             %276 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %277 = OpTypeSampledImage %276 
                                             %278 = OpTypePointer UniformConstant %277 
 UniformConstant read_only Texture3DSampled* %279 = OpVariable UniformConstant 
                              Private f32_3* %290 = OpVariable Private 
                                Input f32_4* %300 = OpVariable Input 
                                Private f32* %308 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %309 = OpVariable UniformConstant 
                              Private f32_3* %315 = OpVariable Private 
                                             %330 = OpTypePointer Function %6 
                                         i32 %343 = OpConstant 9 
                                Input f32_3* %353 = OpVariable Input 
                                             %358 = OpTypePointer Output %7 
                               Output f32_4* %359 = OpVariable Output 
                                             %362 = OpTypePointer Output %6 
                                         i32 %364 = OpConstant 10 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %236 = OpVariable Function 
                               Function f32* %331 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                 Private f32* %35 = OpAccessChain %20 %30 
                                          f32 %36 = OpLoad %35 
                                 Private f32* %37 = OpAccessChain %20 %30 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFMul %36 %38 
                                 Private f32* %40 = OpAccessChain %34 %30 
                                                      OpStore %40 %39 
                                 Private f32* %41 = OpAccessChain %20 %30 
                                          f32 %42 = OpLoad %41 
                                 Private f32* %43 = OpAccessChain %34 %30 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFMul %42 %44 
                                 Private f32* %46 = OpAccessChain %34 %30 
                                                      OpStore %46 %45 
                                 Private f32* %47 = OpAccessChain %20 %30 
                                          f32 %48 = OpLoad %47 
                                 Private f32* %49 = OpAccessChain %34 %30 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFMul %48 %50 
                                 Private f32* %52 = OpAccessChain %34 %30 
                                                      OpStore %52 %51 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFNegate %59 
                                        f32_3 %61 = OpFAdd %55 %60 
                                                      OpStore %53 %61 
                                        f32_3 %62 = OpLoad %34 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 0 0 
                                        f32_3 %64 = OpLoad %53 
                                        f32_3 %65 = OpFMul %63 %64 
                                        f32_4 %66 = OpLoad %57 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFAdd %65 %67 
                                                      OpStore %53 %68 
                                        f32_3 %69 = OpLoad %53 
                                        f32_3 %70 = OpExtInst %1 30 %69 
                                                      OpStore %34 %70 
                                        f32_3 %72 = OpLoad %34 
                                 Uniform f32* %82 = OpAccessChain %78 %80 
                                          f32 %83 = OpLoad %82 
                                 Uniform f32* %84 = OpAccessChain %78 %80 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %86 = OpAccessChain %78 %80 
                                          f32 %87 = OpLoad %86 
                                        f32_3 %88 = OpCompositeConstruct %83 %85 %87 
                                          f32 %89 = OpCompositeExtract %88 0 
                                          f32 %90 = OpCompositeExtract %88 1 
                                          f32 %91 = OpCompositeExtract %88 2 
                                        f32_3 %92 = OpCompositeConstruct %89 %90 %91 
                                        f32_3 %93 = OpFMul %72 %92 
                                                      OpStore %71 %93 
                                        f32_3 %94 = OpLoad %71 
                                        f32_3 %95 = OpExtInst %1 29 %94 
                                                      OpStore %71 %95 
                                 Private f32* %97 = OpAccessChain %9 %96 
                                          f32 %98 = OpLoad %97 
                                Uniform f32* %100 = OpAccessChain %78 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFNegate %101 
                                         f32 %103 = OpFAdd %98 %102 
                                Private f32* %104 = OpAccessChain %20 %30 
                                                      OpStore %104 %103 
                                Private f32* %108 = OpAccessChain %20 %30 
                                         f32 %109 = OpLoad %108 
                                        bool %111 = OpFOrdLessThan %109 %110 
                                                      OpStore %107 %111 
                                        bool %112 = OpLoad %107 
                                         i32 %115 = OpSelect %112 %114 %113 
                                         i32 %117 = OpIMul %115 %116 
                                        bool %118 = OpINotEqual %117 %113 
                                                      OpSelectionMerge %120 None 
                                                      OpBranchConditional %118 %119 %120 
                                             %119 = OpLabel 
                                                      OpKill
                                             %120 = OpLabel 
                                       f32_3 %125 = OpLoad %124 
                                       f32_3 %126 = OpFNegate %125 
                              Uniform f32_3* %128 = OpAccessChain %78 %113 
                                       f32_3 %129 = OpLoad %128 
                                       f32_3 %130 = OpFAdd %126 %129 
                                                      OpStore %122 %130 
                                Uniform f32* %134 = OpAccessChain %78 %132 %113 %133 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %131 %30 
                                                      OpStore %136 %135 
                                Uniform f32* %137 = OpAccessChain %78 %132 %114 %133 
                                         f32 %138 = OpLoad %137 
                                Private f32* %140 = OpAccessChain %131 %139 
                                                      OpStore %140 %138 
                                Uniform f32* %142 = OpAccessChain %78 %132 %141 %133 
                                         f32 %143 = OpLoad %142 
                                Private f32* %144 = OpAccessChain %131 %133 
                                                      OpStore %144 %143 
                                       f32_3 %146 = OpLoad %122 
                                       f32_3 %147 = OpLoad %131 
                                         f32 %148 = OpDot %146 %147 
                                                      OpStore %145 %148 
                                       f32_3 %149 = OpLoad %124 
                              Uniform f32_4* %152 = OpAccessChain %78 %150 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFNegate %154 
                                       f32_3 %156 = OpFAdd %149 %155 
                                                      OpStore %122 %156 
                                       f32_3 %157 = OpLoad %122 
                                       f32_3 %158 = OpLoad %122 
                                         f32 %159 = OpDot %157 %158 
                                Private f32* %160 = OpAccessChain %122 %30 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %122 %30 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpExtInst %1 31 %162 
                                Private f32* %164 = OpAccessChain %122 %30 
                                                      OpStore %164 %163 
                                         f32 %165 = OpLoad %145 
                                         f32 %166 = OpFNegate %165 
                                Private f32* %167 = OpAccessChain %122 %30 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFAdd %166 %168 
                                Private f32* %170 = OpAccessChain %122 %30 
                                                      OpStore %170 %169 
                                Uniform f32* %171 = OpAccessChain %78 %150 %96 
                                         f32 %172 = OpLoad %171 
                                Private f32* %173 = OpAccessChain %122 %30 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFMul %172 %174 
                                         f32 %176 = OpLoad %145 
                                         f32 %177 = OpFAdd %175 %176 
                                                      OpStore %145 %177 
                                         f32 %178 = OpLoad %145 
                                Uniform f32* %179 = OpAccessChain %78 %141 %133 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFMul %178 %180 
                                Uniform f32* %182 = OpAccessChain %78 %141 %96 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpFAdd %181 %183 
                                                      OpStore %145 %184 
                                         f32 %185 = OpLoad %145 
                                         f32 %187 = OpExtInst %1 43 %185 %110 %186 
                                                      OpStore %145 %187 
                                Uniform f32* %190 = OpAccessChain %78 %189 %30 
                                         f32 %191 = OpLoad %190 
                                        bool %192 = OpFOrdEqual %191 %186 
                                                      OpStore %188 %192 
                                                      OpSelectionMerge %195 None 
                                                      OpBranchConditional %193 %194 %195 
                                             %194 = OpLabel 
                                        bool %196 = OpLoad %188 
                                                      OpSelectionMerge %198 None 
                                                      OpBranchConditional %196 %197 %198 
                                             %197 = OpLabel 
                                                      OpBranch %198 
                                             %198 = OpLabel 
                                                      OpBranch %195 
                                             %195 = OpLabel 
                                                      OpSelectionMerge %201 None 
                                                      OpBranchConditional %199 %200 %285 
                                             %200 = OpLabel 
                                Uniform f32* %203 = OpAccessChain %78 %189 %139 
                                         f32 %204 = OpLoad %203 
                                        bool %205 = OpFOrdEqual %204 %186 
                                                      OpStore %202 %205 
                                       f32_3 %206 = OpLoad %124 
                                       f32_3 %207 = OpVectorShuffle %206 %206 1 1 1 
                              Uniform f32_4* %209 = OpAccessChain %78 %208 %114 
                                       f32_4 %210 = OpLoad %209 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                                       f32_3 %212 = OpFMul %207 %211 
                                                      OpStore %131 %212 
                              Uniform f32_4* %213 = OpAccessChain %78 %208 %113 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpLoad %124 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 0 0 
                                       f32_3 %218 = OpFMul %215 %217 
                                       f32_3 %219 = OpLoad %131 
                                       f32_3 %220 = OpFAdd %218 %219 
                                                      OpStore %131 %220 
                              Uniform f32_4* %221 = OpAccessChain %78 %208 %141 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                       f32_3 %224 = OpLoad %124 
                                       f32_3 %225 = OpVectorShuffle %224 %224 2 2 2 
                                       f32_3 %226 = OpFMul %223 %225 
                                       f32_3 %227 = OpLoad %131 
                                       f32_3 %228 = OpFAdd %226 %227 
                                                      OpStore %131 %228 
                                       f32_3 %229 = OpLoad %131 
                              Uniform f32_4* %230 = OpAccessChain %78 %208 %150 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpFAdd %229 %232 
                                                      OpStore %131 %233 
                                        bool %237 = OpLoad %202 
                                                      OpSelectionMerge %239 None 
                                                      OpBranchConditional %237 %238 %241 
                                             %238 = OpLabel 
                                       f32_3 %240 = OpLoad %131 
                                                      OpStore %236 %240 
                                                      OpBranch %239 
                                             %241 = OpLabel 
                                       f32_3 %242 = OpLoad %124 
                                                      OpStore %236 %242 
                                                      OpBranch %239 
                                             %239 = OpLabel 
                                       f32_3 %243 = OpLoad %236 
                                                      OpStore %234 %243 
                                       f32_3 %244 = OpLoad %234 
                              Uniform f32_3* %246 = OpAccessChain %78 %245 
                                       f32_3 %247 = OpLoad %246 
                                       f32_3 %248 = OpFNegate %247 
                                       f32_3 %249 = OpFAdd %244 %248 
                                                      OpStore %234 %249 
                                       f32_3 %251 = OpLoad %234 
                              Uniform f32_3* %253 = OpAccessChain %78 %252 
                                       f32_3 %254 = OpLoad %253 
                                       f32_3 %255 = OpFMul %251 %254 
                                       f32_4 %256 = OpLoad %250 
                                       f32_4 %257 = OpVectorShuffle %256 %255 0 4 5 6 
                                                      OpStore %250 %257 
                                Private f32* %258 = OpAccessChain %250 %139 
                                         f32 %259 = OpLoad %258 
                                         f32 %261 = OpFMul %259 %260 
                                         f32 %263 = OpFAdd %261 %262 
                                Private f32* %264 = OpAccessChain %234 %30 
                                                      OpStore %264 %263 
                                Uniform f32* %266 = OpAccessChain %78 %189 %133 
                                         f32 %267 = OpLoad %266 
                                         f32 %269 = OpFMul %267 %268 
                                         f32 %270 = OpFAdd %269 %262 
                                                      OpStore %265 %270 
                                         f32 %271 = OpLoad %265 
                                Private f32* %272 = OpAccessChain %234 %30 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpExtInst %1 40 %271 %273 
                                Private f32* %275 = OpAccessChain %250 %30 
                                                      OpStore %275 %274 
                  read_only Texture3DSampled %280 = OpLoad %279 
                                       f32_4 %281 = OpLoad %250 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 2 3 
                                       f32_4 %283 = OpImageSampleImplicitLod %280 %282 
                                                      OpStore %250 %283 
                                       f32_4 %284 = OpLoad %250 
                                                      OpStore %20 %284 
                                                      OpBranch %201 
                                             %285 = OpLabel 
                                Private f32* %286 = OpAccessChain %20 %30 
                                                      OpStore %286 %186 
                                Private f32* %287 = OpAccessChain %20 %139 
                                                      OpStore %287 %186 
                                Private f32* %288 = OpAccessChain %20 %133 
                                                      OpStore %288 %186 
                                Private f32* %289 = OpAccessChain %20 %96 
                                                      OpStore %289 %186 
                                                      OpBranch %201 
                                             %201 = OpLabel 
                                       f32_4 %291 = OpLoad %20 
                              Uniform f32_4* %292 = OpAccessChain %78 %114 
                                       f32_4 %293 = OpLoad %292 
                                         f32 %294 = OpDot %291 %293 
                                Private f32* %295 = OpAccessChain %290 %30 
                                                      OpStore %295 %294 
                                Private f32* %296 = OpAccessChain %290 %30 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpExtInst %1 43 %297 %110 %186 
                                Private f32* %299 = OpAccessChain %290 %30 
                                                      OpStore %299 %298 
                                       f32_4 %301 = OpLoad %300 
                                       f32_2 %302 = OpVectorShuffle %301 %301 0 1 
                                       f32_4 %303 = OpLoad %300 
                                       f32_2 %304 = OpVectorShuffle %303 %303 3 3 
                                       f32_2 %305 = OpFDiv %302 %304 
                                       f32_3 %306 = OpLoad %234 
                                       f32_3 %307 = OpVectorShuffle %306 %305 3 4 2 
                                                      OpStore %234 %307 
                  read_only Texture2DSampled %310 = OpLoad %309 
                                       f32_3 %311 = OpLoad %234 
                                       f32_2 %312 = OpVectorShuffle %311 %311 0 1 
                                       f32_4 %313 = OpImageSampleImplicitLod %310 %312 
                                         f32 %314 = OpCompositeExtract %313 0 
                                                      OpStore %308 %314 
                                         f32 %316 = OpLoad %145 
                                         f32 %317 = OpLoad %308 
                                         f32 %318 = OpFAdd %316 %317 
                                Private f32* %319 = OpAccessChain %315 %30 
                                                      OpStore %319 %318 
                                Private f32* %320 = OpAccessChain %315 %30 
                                         f32 %321 = OpLoad %320 
                                         f32 %322 = OpExtInst %1 43 %321 %110 %186 
                                Private f32* %323 = OpAccessChain %315 %30 
                                                      OpStore %323 %322 
                                Private f32* %324 = OpAccessChain %315 %30 
                                         f32 %325 = OpLoad %324 
                                Private f32* %326 = OpAccessChain %290 %30 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpExtInst %1 37 %325 %327 
                                Private f32* %329 = OpAccessChain %290 %30 
                                                      OpStore %329 %328 
                                        bool %332 = OpLoad %188 
                                                      OpSelectionMerge %334 None 
                                                      OpBranchConditional %332 %333 %337 
                                             %333 = OpLabel 
                                Private f32* %335 = OpAccessChain %290 %30 
                                         f32 %336 = OpLoad %335 
                                                      OpStore %331 %336 
                                                      OpBranch %334 
                                             %337 = OpLabel 
                                Private f32* %338 = OpAccessChain %315 %30 
                                         f32 %339 = OpLoad %338 
                                                      OpStore %331 %339 
                                                      OpBranch %334 
                                             %334 = OpLabel 
                                         f32 %340 = OpLoad %331 
                                Private f32* %341 = OpAccessChain %290 %30 
                                                      OpStore %341 %340 
                                       f32_3 %342 = OpLoad %53 
                              Uniform f32_4* %344 = OpAccessChain %78 %343 
                                       f32_4 %345 = OpLoad %344 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_3 %347 = OpFMul %342 %346 
                                                      OpStore %315 %347 
                                       f32_3 %348 = OpLoad %290 
                                       f32_3 %349 = OpVectorShuffle %348 %348 0 0 0 
                                       f32_3 %350 = OpLoad %315 
                                       f32_3 %351 = OpFMul %349 %350 
                                                      OpStore %290 %351 
                                       f32_3 %352 = OpLoad %53 
                                       f32_3 %354 = OpLoad %353 
                                       f32_3 %355 = OpFMul %352 %354 
                                       f32_3 %356 = OpLoad %290 
                                       f32_3 %357 = OpFAdd %355 %356 
                                                      OpStore %290 %357 
                                Private f32* %360 = OpAccessChain %9 %96 
                                         f32 %361 = OpLoad %360 
                                 Output f32* %363 = OpAccessChain %359 %96 
                                                      OpStore %363 %361 
                                Uniform f32* %365 = OpAccessChain %78 %364 
                                         f32 %366 = OpLoad %365 
                                       f32_3 %367 = OpCompositeConstruct %366 %366 %366 
                                       f32_3 %368 = OpLoad %71 
                                       f32_3 %369 = OpFMul %367 %368 
                                       f32_3 %370 = OpLoad %290 
                                       f32_3 %371 = OpFAdd %369 %370 
                                       f32_4 %372 = OpLoad %359 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %359 %373 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat5;
float u_xlat13;
bool u_xlatb13;
float u_xlat14;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat5.x = u_xlat1.x * u_xlat1.x;
    u_xlat5.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat5.xyz = u_xlat0.xyz + (-vs_COLOR0.xyz);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz + vs_COLOR0.xyz;
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat13 = u_xlat0.w + (-_Cutoff);
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
    u_xlatb13 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb13){
        u_xlatb13 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat13 = u_xlat3.y * 0.25 + 0.75;
        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat13, u_xlat14);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat13 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat3;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 287
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %85 %97 %98 %112 %151 %154 %157 %158 %160 %278 
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
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %151 Location 151 
                                                      OpDecorate %154 Location 154 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 Location 160 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %278 Location 278 
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
                                              %21 = OpTypeStruct %7 %7 %7 %7 %16 %18 %19 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 5 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 0 
                                          i32 %39 = OpConstant 2 
                               Private f32_4* %47 = OpVariable Private 
                                          i32 %49 = OpConstant 3 
                               Private f32_4* %60 = OpVariable Private 
                                          i32 %63 = OpConstant 7 
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
                                         i32 %101 = OpConstant 8 
                                             %110 = OpTypeVector %6 3 
                                             %111 = OpTypePointer Input %110 
                                Input f32_3* %112 = OpVariable Input 
                                         i32 %114 = OpConstant 6 
                                         u32 %119 = OpConstant 0 
                                             %120 = OpTypePointer Private %6 
                                         u32 %133 = OpConstant 2 
                                Private f32* %135 = OpVariable Private 
                                             %150 = OpTypePointer Output %110 
                               Output f32_3* %151 = OpVariable Output 
                               Output f32_3* %154 = OpVariable Output 
                               Output f32_4* %157 = OpVariable Output 
                                Input f32_4* %158 = OpVariable Input 
                               Output f32_4* %160 = OpVariable Output 
                              Private f32_4* %168 = OpVariable Private 
                              Private f32_4* %176 = OpVariable Private 
                                         f32 %212 = OpConstant 3.67402E-40 
                                       f32_4 %213 = OpConstantComposite %212 %212 %212 %212 
                                         f32 %221 = OpConstant 3.67402E-40 
                                       f32_4 %222 = OpConstantComposite %221 %221 %221 %221 
                                         f32 %230 = OpConstant 3.67402E-40 
                                       f32_4 %231 = OpConstantComposite %230 %230 %230 %230 
                                         i32 %238 = OpConstant 4 
                               Output f32_3* %278 = OpVariable Output 
                                             %281 = OpTypePointer Output %6 
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
                               Uniform f32_4* %53 = OpAccessChain %23 %25 %49 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %11 
                                        f32_4 %56 = OpVectorShuffle %55 %55 3 3 3 3 
                                        f32_4 %57 = OpFMul %54 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpFAdd %57 %58 
                                                      OpStore %9 %59 
                                        f32_4 %61 = OpLoad %47 
                                        f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %23 %63 %26 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %62 %65 
                                                      OpStore %60 %66 
                               Uniform f32_4* %67 = OpAccessChain %23 %63 %31 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %47 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %60 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %60 %73 
                               Uniform f32_4* %74 = OpAccessChain %23 %63 %39 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %60 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %60 %80 
                               Uniform f32_4* %86 = OpAccessChain %23 %63 %49 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %60 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %31 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %102 = OpAccessChain %23 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpFMul %100 %104 
                              Uniform f32_4* %106 = OpAccessChain %23 %101 
                                       f32_4 %107 = OpLoad %106 
                                       f32_2 %108 = OpVectorShuffle %107 %107 2 3 
                                       f32_2 %109 = OpFAdd %105 %108 
                                                      OpStore %97 %109 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %115 = OpAccessChain %23 %114 %31 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                         f32 %118 = OpDot %113 %117 
                                Private f32* %121 = OpAccessChain %47 %119 
                                                      OpStore %121 %118 
                                       f32_3 %122 = OpLoad %112 
                              Uniform f32_4* %123 = OpAccessChain %23 %114 %26 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %127 = OpAccessChain %47 %81 
                                                      OpStore %127 %126 
                                       f32_3 %128 = OpLoad %112 
                              Uniform f32_4* %129 = OpAccessChain %23 %114 %39 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                         f32 %132 = OpDot %128 %131 
                                Private f32* %134 = OpAccessChain %47 %133 
                                                      OpStore %134 %132 
                                       f32_4 %136 = OpLoad %47 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_4 %138 = OpLoad %47 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                         f32 %140 = OpDot %137 %139 
                                                      OpStore %135 %140 
                                         f32 %141 = OpLoad %135 
                                         f32 %142 = OpExtInst %1 32 %141 
                                                      OpStore %135 %142 
                                         f32 %143 = OpLoad %135 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %47 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                       f32_4 %148 = OpLoad %47 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %47 %149 
                                       f32_4 %152 = OpLoad %47 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                                      OpStore %151 %153 
                                       f32_4 %155 = OpLoad %9 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                                      OpStore %154 %156 
                                       f32_4 %159 = OpLoad %158 
                                                      OpStore %157 %159 
                                       f32_4 %161 = OpLoad %9 
                                                      OpStore %160 %161 
                                       f32_4 %162 = OpLoad %9 
                                       f32_4 %163 = OpVectorShuffle %162 %162 1 1 1 1 
                                       f32_4 %164 = OpFNegate %163 
                              Uniform f32_4* %165 = OpAccessChain %23 %26 
                                       f32_4 %166 = OpLoad %165 
                                       f32_4 %167 = OpFAdd %164 %166 
                                                      OpStore %60 %167 
                                       f32_4 %169 = OpLoad %47 
                                       f32_4 %170 = OpVectorShuffle %169 %169 1 1 1 1 
                                       f32_4 %171 = OpLoad %60 
                                       f32_4 %172 = OpFMul %170 %171 
                                                      OpStore %168 %172 
                                       f32_4 %173 = OpLoad %60 
                                       f32_4 %174 = OpLoad %60 
                                       f32_4 %175 = OpFMul %173 %174 
                                                      OpStore %60 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_4 %178 = OpVectorShuffle %177 %177 0 0 0 0 
                                       f32_4 %179 = OpFNegate %178 
                              Uniform f32_4* %180 = OpAccessChain %23 %31 
                                       f32_4 %181 = OpLoad %180 
                                       f32_4 %182 = OpFAdd %179 %181 
                                                      OpStore %176 %182 
                                       f32_4 %183 = OpLoad %9 
                                       f32_4 %184 = OpVectorShuffle %183 %183 2 2 2 2 
                                       f32_4 %185 = OpFNegate %184 
                              Uniform f32_4* %186 = OpAccessChain %23 %39 
                                       f32_4 %187 = OpLoad %186 
                                       f32_4 %188 = OpFAdd %185 %187 
                                                      OpStore %9 %188 
                                       f32_4 %189 = OpLoad %176 
                                       f32_4 %190 = OpLoad %47 
                                       f32_4 %191 = OpVectorShuffle %190 %190 0 0 0 0 
                                       f32_4 %192 = OpFMul %189 %191 
                                       f32_4 %193 = OpLoad %168 
                                       f32_4 %194 = OpFAdd %192 %193 
                                                      OpStore %168 %194 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpLoad %47 
                                       f32_4 %197 = OpVectorShuffle %196 %196 2 2 2 2 
                                       f32_4 %198 = OpFMul %195 %197 
                                       f32_4 %199 = OpLoad %168 
                                       f32_4 %200 = OpFAdd %198 %199 
                                                      OpStore %47 %200 
                                       f32_4 %201 = OpLoad %176 
                                       f32_4 %202 = OpLoad %176 
                                       f32_4 %203 = OpFMul %201 %202 
                                       f32_4 %204 = OpLoad %60 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %60 %205 
                                       f32_4 %206 = OpLoad %9 
                                       f32_4 %207 = OpLoad %9 
                                       f32_4 %208 = OpFMul %206 %207 
                                       f32_4 %209 = OpLoad %60 
                                       f32_4 %210 = OpFAdd %208 %209 
                                                      OpStore %9 %210 
                                       f32_4 %211 = OpLoad %9 
                                       f32_4 %214 = OpExtInst %1 40 %211 %213 
                                                      OpStore %9 %214 
                                       f32_4 %215 = OpLoad %9 
                                       f32_4 %216 = OpExtInst %1 32 %215 
                                                      OpStore %60 %216 
                                       f32_4 %217 = OpLoad %9 
                              Uniform f32_4* %218 = OpAccessChain %23 %49 
                                       f32_4 %219 = OpLoad %218 
                                       f32_4 %220 = OpFMul %217 %219 
                                       f32_4 %223 = OpFAdd %220 %222 
                                                      OpStore %9 %223 
                                       f32_4 %224 = OpLoad %9 
                                       f32_4 %225 = OpFDiv %222 %224 
                                                      OpStore %9 %225 
                                       f32_4 %226 = OpLoad %47 
                                       f32_4 %227 = OpLoad %60 
                                       f32_4 %228 = OpFMul %226 %227 
                                                      OpStore %47 %228 
                                       f32_4 %229 = OpLoad %47 
                                       f32_4 %232 = OpExtInst %1 40 %229 %231 
                                                      OpStore %47 %232 
                                       f32_4 %233 = OpLoad %9 
                                       f32_4 %234 = OpLoad %47 
                                       f32_4 %235 = OpFMul %233 %234 
                                                      OpStore %9 %235 
                                       f32_4 %236 = OpLoad %9 
                                       f32_3 %237 = OpVectorShuffle %236 %236 1 1 1 
                              Uniform f32_4* %239 = OpAccessChain %23 %238 %26 
                                       f32_4 %240 = OpLoad %239 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
                                       f32_3 %242 = OpFMul %237 %241 
                                       f32_4 %243 = OpLoad %47 
                                       f32_4 %244 = OpVectorShuffle %243 %242 4 5 6 3 
                                                      OpStore %47 %244 
                              Uniform f32_4* %245 = OpAccessChain %23 %238 %31 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 1 2 
                                       f32_4 %248 = OpLoad %9 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 0 0 
                                       f32_3 %250 = OpFMul %247 %249 
                                       f32_4 %251 = OpLoad %47 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_3 %253 = OpFAdd %250 %252 
                                       f32_4 %254 = OpLoad %47 
                                       f32_4 %255 = OpVectorShuffle %254 %253 4 5 6 3 
                                                      OpStore %47 %255 
                              Uniform f32_4* %256 = OpAccessChain %23 %238 %39 
                                       f32_4 %257 = OpLoad %256 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                                       f32_4 %259 = OpLoad %9 
                                       f32_3 %260 = OpVectorShuffle %259 %259 2 2 2 
                                       f32_3 %261 = OpFMul %258 %260 
                                       f32_4 %262 = OpLoad %47 
                                       f32_3 %263 = OpVectorShuffle %262 %262 0 1 2 
                                       f32_3 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %9 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 6 3 
                                                      OpStore %9 %266 
                              Uniform f32_4* %267 = OpAccessChain %23 %238 %49 
                                       f32_4 %268 = OpLoad %267 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                       f32_4 %270 = OpLoad %9 
                                       f32_3 %271 = OpVectorShuffle %270 %270 3 3 3 
                                       f32_3 %272 = OpFMul %269 %271 
                                       f32_4 %273 = OpLoad %9 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFAdd %272 %274 
                                       f32_4 %276 = OpLoad %9 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %9 %277 
                                       f32_4 %279 = OpLoad %9 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                                      OpStore %278 %280 
                                 Output f32* %282 = OpAccessChain %85 %31 %81 
                                         f32 %283 = OpLoad %282 
                                         f32 %284 = OpFNegate %283 
                                 Output f32* %285 = OpAccessChain %85 %31 %81 
                                                      OpStore %285 %284 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 271
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %57 %140 %249 %255 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %74 ArrayStride 74 
                                                      OpMemberDecorate %75 0 RelaxedPrecision 
                                                      OpMemberDecorate %75 0 Offset 75 
                                                      OpMemberDecorate %75 1 Offset 75 
                                                      OpMemberDecorate %75 2 Offset 75 
                                                      OpMemberDecorate %75 3 Offset 75 
                                                      OpMemberDecorate %75 4 Offset 75 
                                                      OpMemberDecorate %75 5 RelaxedPrecision 
                                                      OpMemberDecorate %75 5 Offset 75 
                                                      OpMemberDecorate %75 6 Offset 75 
                                                      OpMemberDecorate %75 7 Offset 75 
                                                      OpMemberDecorate %75 8 RelaxedPrecision 
                                                      OpMemberDecorate %75 8 Offset 75 
                                                      OpDecorate %75 Block 
                                                      OpDecorate %77 DescriptorSet 77 
                                                      OpDecorate %77 Binding 77 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %131 SpecId 131 
                                                      OpDecorate %140 Location 140 
                                                      OpDecorate %216 DescriptorSet 216 
                                                      OpDecorate %216 Binding 216 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %249 Location 249 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %255 Location 255 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                               Private f32_3* %53 = OpVariable Private 
                                              %56 = OpTypePointer Input %7 
                                 Input f32_4* %57 = OpVariable Input 
                               Private f32_3* %71 = OpVariable Private 
                                          u32 %73 = OpConstant 4 
                                              %74 = OpTypeArray %7 %73 
                                              %75 = OpTypeStruct %7 %7 %74 %21 %21 %7 %6 %6 %6 
                                              %76 = OpTypePointer Uniform %75 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32;}* %77 = OpVariable Uniform 
                                              %78 = OpTypeInt 32 1 
                                          i32 %79 = OpConstant 7 
                                              %80 = OpTypePointer Uniform %6 
                                          u32 %95 = OpConstant 3 
                                          i32 %98 = OpConstant 8 
                                             %104 = OpTypeBool 
                                             %105 = OpTypePointer Private %104 
                               Private bool* %106 = OpVariable Private 
                                         f32 %109 = OpConstant 3.67402E-40 
                                         i32 %112 = OpConstant 0 
                                         i32 %113 = OpConstant 1 
                                         i32 %115 = OpConstant -1 
                                         f32 %123 = OpConstant 3.67402E-40 
                                        bool %125 = OpConstantFalse 
                                        bool %131 = OpSpecConstantFalse 
                                         u32 %134 = OpConstant 1 
                              Private f32_3* %138 = OpVariable Private 
                                             %139 = OpTypePointer Input %21 
                                Input f32_3* %140 = OpVariable Input 
                                         i32 %143 = OpConstant 2 
                                             %144 = OpTypePointer Uniform %7 
                                         i32 %166 = OpConstant 3 
                                             %171 = OpTypePointer Function %21 
                                         i32 %181 = OpConstant 4 
                                             %182 = OpTypePointer Uniform %21 
                              Private f32_4* %187 = OpVariable Private 
                                Private f32* %194 = OpVariable Private 
                                         f32 %197 = OpConstant 3.67402E-40 
                                         f32 %199 = OpConstant 3.67402E-40 
                                         u32 %201 = OpConstant 2 
                                         f32 %204 = OpConstant 3.67402E-40 
                                             %213 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %214 = OpTypeSampledImage %213 
                                             %215 = OpTypePointer UniformConstant %214 
 UniformConstant read_only Texture3DSampled* %216 = OpVariable UniformConstant 
                              Private f32_3* %227 = OpVariable Private 
                              Private f32_3* %237 = OpVariable Private 
                                         i32 %239 = OpConstant 5 
                                Input f32_3* %249 = OpVariable Input 
                                             %254 = OpTypePointer Output %7 
                               Output f32_4* %255 = OpVariable Output 
                                             %258 = OpTypePointer Output %6 
                                         i32 %260 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %172 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                 Private f32* %35 = OpAccessChain %20 %30 
                                          f32 %36 = OpLoad %35 
                                 Private f32* %37 = OpAccessChain %20 %30 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFMul %36 %38 
                                 Private f32* %40 = OpAccessChain %34 %30 
                                                      OpStore %40 %39 
                                 Private f32* %41 = OpAccessChain %20 %30 
                                          f32 %42 = OpLoad %41 
                                 Private f32* %43 = OpAccessChain %34 %30 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFMul %42 %44 
                                 Private f32* %46 = OpAccessChain %34 %30 
                                                      OpStore %46 %45 
                                 Private f32* %47 = OpAccessChain %20 %30 
                                          f32 %48 = OpLoad %47 
                                 Private f32* %49 = OpAccessChain %34 %30 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFMul %48 %50 
                                 Private f32* %52 = OpAccessChain %34 %30 
                                                      OpStore %52 %51 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFNegate %59 
                                        f32_3 %61 = OpFAdd %55 %60 
                                                      OpStore %53 %61 
                                        f32_3 %62 = OpLoad %34 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 0 0 
                                        f32_3 %64 = OpLoad %53 
                                        f32_3 %65 = OpFMul %63 %64 
                                        f32_4 %66 = OpLoad %57 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFAdd %65 %67 
                                                      OpStore %53 %68 
                                        f32_3 %69 = OpLoad %53 
                                        f32_3 %70 = OpExtInst %1 30 %69 
                                                      OpStore %34 %70 
                                        f32_3 %72 = OpLoad %34 
                                 Uniform f32* %81 = OpAccessChain %77 %79 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %83 = OpAccessChain %77 %79 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %85 = OpAccessChain %77 %79 
                                          f32 %86 = OpLoad %85 
                                        f32_3 %87 = OpCompositeConstruct %82 %84 %86 
                                          f32 %88 = OpCompositeExtract %87 0 
                                          f32 %89 = OpCompositeExtract %87 1 
                                          f32 %90 = OpCompositeExtract %87 2 
                                        f32_3 %91 = OpCompositeConstruct %88 %89 %90 
                                        f32_3 %92 = OpFMul %72 %91 
                                                      OpStore %71 %92 
                                        f32_3 %93 = OpLoad %71 
                                        f32_3 %94 = OpExtInst %1 29 %93 
                                                      OpStore %71 %94 
                                 Private f32* %96 = OpAccessChain %9 %95 
                                          f32 %97 = OpLoad %96 
                                 Uniform f32* %99 = OpAccessChain %77 %98 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFNegate %100 
                                         f32 %102 = OpFAdd %97 %101 
                                Private f32* %103 = OpAccessChain %20 %30 
                                                      OpStore %103 %102 
                                Private f32* %107 = OpAccessChain %20 %30 
                                         f32 %108 = OpLoad %107 
                                        bool %110 = OpFOrdLessThan %108 %109 
                                                      OpStore %106 %110 
                                        bool %111 = OpLoad %106 
                                         i32 %114 = OpSelect %111 %113 %112 
                                         i32 %116 = OpIMul %114 %115 
                                        bool %117 = OpINotEqual %116 %112 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                                      OpKill
                                             %119 = OpLabel 
                                Uniform f32* %121 = OpAccessChain %77 %113 %30 
                                         f32 %122 = OpLoad %121 
                                        bool %124 = OpFOrdEqual %122 %123 
                                                      OpStore %106 %124 
                                                      OpSelectionMerge %127 None 
                                                      OpBranchConditional %125 %126 %127 
                                             %126 = OpLabel 
                                        bool %128 = OpLoad %106 
                                                      OpSelectionMerge %130 None 
                                                      OpBranchConditional %128 %129 %130 
                                             %129 = OpLabel 
                                                      OpBranch %130 
                                             %130 = OpLabel 
                                                      OpBranch %127 
                                             %127 = OpLabel 
                                                      OpSelectionMerge %133 None 
                                                      OpBranchConditional %131 %132 %222 
                                             %132 = OpLabel 
                                Uniform f32* %135 = OpAccessChain %77 %113 %134 
                                         f32 %136 = OpLoad %135 
                                        bool %137 = OpFOrdEqual %136 %123 
                                                      OpStore %106 %137 
                                       f32_3 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 1 1 1 
                              Uniform f32_4* %145 = OpAccessChain %77 %143 %113 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFMul %142 %147 
                                                      OpStore %138 %148 
                              Uniform f32_4* %149 = OpAccessChain %77 %143 %112 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpLoad %140 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 0 0 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_3 %155 = OpLoad %138 
                                       f32_3 %156 = OpFAdd %154 %155 
                                                      OpStore %138 %156 
                              Uniform f32_4* %157 = OpAccessChain %77 %143 %143 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpLoad %140 
                                       f32_3 %161 = OpVectorShuffle %160 %160 2 2 2 
                                       f32_3 %162 = OpFMul %159 %161 
                                       f32_3 %163 = OpLoad %138 
                                       f32_3 %164 = OpFAdd %162 %163 
                                                      OpStore %138 %164 
                                       f32_3 %165 = OpLoad %138 
                              Uniform f32_4* %167 = OpAccessChain %77 %143 %166 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFAdd %165 %169 
                                                      OpStore %138 %170 
                                        bool %173 = OpLoad %106 
                                                      OpSelectionMerge %175 None 
                                                      OpBranchConditional %173 %174 %177 
                                             %174 = OpLabel 
                                       f32_3 %176 = OpLoad %138 
                                                      OpStore %172 %176 
                                                      OpBranch %175 
                                             %177 = OpLabel 
                                       f32_3 %178 = OpLoad %140 
                                                      OpStore %172 %178 
                                                      OpBranch %175 
                                             %175 = OpLabel 
                                       f32_3 %179 = OpLoad %172 
                                                      OpStore %138 %179 
                                       f32_3 %180 = OpLoad %138 
                              Uniform f32_3* %183 = OpAccessChain %77 %181 
                                       f32_3 %184 = OpLoad %183 
                                       f32_3 %185 = OpFNegate %184 
                                       f32_3 %186 = OpFAdd %180 %185 
                                                      OpStore %138 %186 
                                       f32_3 %188 = OpLoad %138 
                              Uniform f32_3* %189 = OpAccessChain %77 %166 
                                       f32_3 %190 = OpLoad %189 
                                       f32_3 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %187 
                                       f32_4 %193 = OpVectorShuffle %192 %191 0 4 5 6 
                                                      OpStore %187 %193 
                                Private f32* %195 = OpAccessChain %187 %134 
                                         f32 %196 = OpLoad %195 
                                         f32 %198 = OpFMul %196 %197 
                                         f32 %200 = OpFAdd %198 %199 
                                                      OpStore %194 %200 
                                Uniform f32* %202 = OpAccessChain %77 %113 %201 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %206 = OpFAdd %205 %199 
                                Private f32* %207 = OpAccessChain %138 %30 
                                                      OpStore %207 %206 
                                         f32 %208 = OpLoad %194 
                                Private f32* %209 = OpAccessChain %138 %30 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpExtInst %1 40 %208 %210 
                                Private f32* %212 = OpAccessChain %187 %30 
                                                      OpStore %212 %211 
                  read_only Texture3DSampled %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %187 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 2 3 
                                       f32_4 %220 = OpImageSampleImplicitLod %217 %219 
                                                      OpStore %187 %220 
                                       f32_4 %221 = OpLoad %187 
                                                      OpStore %20 %221 
                                                      OpBranch %133 
                                             %222 = OpLabel 
                                Private f32* %223 = OpAccessChain %20 %30 
                                                      OpStore %223 %123 
                                Private f32* %224 = OpAccessChain %20 %134 
                                                      OpStore %224 %123 
                                Private f32* %225 = OpAccessChain %20 %201 
                                                      OpStore %225 %123 
                                Private f32* %226 = OpAccessChain %20 %95 
                                                      OpStore %226 %123 
                                                      OpBranch %133 
                                             %133 = OpLabel 
                                       f32_4 %228 = OpLoad %20 
                              Uniform f32_4* %229 = OpAccessChain %77 %112 
                                       f32_4 %230 = OpLoad %229 
                                         f32 %231 = OpDot %228 %230 
                                Private f32* %232 = OpAccessChain %227 %30 
                                                      OpStore %232 %231 
                                Private f32* %233 = OpAccessChain %227 %30 
                                         f32 %234 = OpLoad %233 
                                         f32 %235 = OpExtInst %1 43 %234 %109 %123 
                                Private f32* %236 = OpAccessChain %227 %30 
                                                      OpStore %236 %235 
                                       f32_3 %238 = OpLoad %53 
                              Uniform f32_4* %240 = OpAccessChain %77 %239 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %243 = OpFMul %238 %242 
                                                      OpStore %237 %243 
                                       f32_3 %244 = OpLoad %227 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpLoad %237 
                                       f32_3 %247 = OpFMul %245 %246 
                                                      OpStore %227 %247 
                                       f32_3 %248 = OpLoad %53 
                                       f32_3 %250 = OpLoad %249 
                                       f32_3 %251 = OpFMul %248 %250 
                                       f32_3 %252 = OpLoad %227 
                                       f32_3 %253 = OpFAdd %251 %252 
                                                      OpStore %227 %253 
                                Private f32* %256 = OpAccessChain %9 %95 
                                         f32 %257 = OpLoad %256 
                                 Output f32* %259 = OpAccessChain %255 %95 
                                                      OpStore %259 %257 
                                Uniform f32* %261 = OpAccessChain %77 %260 
                                         f32 %262 = OpLoad %261 
                                       f32_3 %263 = OpCompositeConstruct %262 %262 %262 
                                       f32_3 %264 = OpLoad %71 
                                       f32_3 %265 = OpFMul %263 %264 
                                       f32_3 %266 = OpLoad %227 
                                       f32_3 %267 = OpFAdd %265 %266 
                                       f32_4 %268 = OpLoad %255 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %255 %269 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3 = u_xlat0;
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
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat2.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat5;
float u_xlat13;
bool u_xlatb13;
float u_xlat14;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat5.x = u_xlat1.x * u_xlat1.x;
    u_xlat5.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat5.xyz = u_xlat0.xyz + (-vs_COLOR0.xyz);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz + vs_COLOR0.xyz;
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat13 = u_xlat0.w + (-_Cutoff);
    u_xlatb13 = u_xlat13<0.0;
    if((int(u_xlatb13) * int(0xffffffffu))!=0){discard;}
    u_xlatb13 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb13){
        u_xlatb13 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat13 = u_xlat3.y * 0.25 + 0.75;
        u_xlat14 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat13, u_xlat14);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat13 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat3;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 389
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %85 %97 %98 %112 %151 %154 %157 %158 %160 %380 
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
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %151 Location 151 
                                                      OpDecorate %154 Location 154 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 Location 160 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %365 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %380 Location 380 
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
                               Private f32_4* %60 = OpVariable Private 
                                          i32 %63 = OpConstant 14 
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
                                         i32 %101 = OpConstant 15 
                                             %110 = OpTypeVector %6 3 
                                             %111 = OpTypePointer Input %110 
                                Input f32_3* %112 = OpVariable Input 
                                         i32 %114 = OpConstant 13 
                                         u32 %119 = OpConstant 0 
                                             %120 = OpTypePointer Private %6 
                                         u32 %133 = OpConstant 2 
                                Private f32* %135 = OpVariable Private 
                                             %150 = OpTypePointer Output %110 
                               Output f32_3* %151 = OpVariable Output 
                               Output f32_3* %154 = OpVariable Output 
                               Output f32_4* %157 = OpVariable Output 
                                Input f32_4* %158 = OpVariable Input 
                               Output f32_4* %160 = OpVariable Output 
                                             %162 = OpTypePointer Private %110 
                              Private f32_3* %163 = OpVariable Private 
                              Private f32_4* %180 = OpVariable Private 
                              Private f32_3* %186 = OpVariable Private 
                                         i32 %187 = OpConstant 8 
                                         i32 %193 = OpConstant 9 
                                         i32 %199 = OpConstant 10 
                                         i32 %205 = OpConstant 11 
                                         f32 %214 = OpConstant 3.67402E-40 
                                         u32 %215 = OpConstant 3 
                                         i32 %217 = OpConstant 5 
                                         i32 %223 = OpConstant 6 
                                         i32 %229 = OpConstant 7 
                                         f32 %239 = OpConstant 3.67402E-40 
                                       f32_3 %240 = OpConstantComposite %239 %239 %239 
                              Private f32_3* %242 = OpVariable Private 
                                         f32 %246 = OpConstant 3.67402E-40 
                                       f32_3 %247 = OpConstantComposite %246 %246 %246 
                                         f32 %252 = OpConstant 3.67402E-40 
                                       f32_3 %253 = OpConstantComposite %252 %252 %252 
                                         f32 %255 = OpConstant 3.67402E-40 
                                       f32_3 %256 = OpConstantComposite %255 %255 %255 
                              Private f32_4* %266 = OpVariable Private 
                              Private f32_4* %274 = OpVariable Private 
                                         f32 %310 = OpConstant 3.67402E-40 
                                       f32_4 %311 = OpConstantComposite %310 %310 %310 %310 
                                       f32_4 %319 = OpConstantComposite %214 %214 %214 %214 
                                       f32_4 %327 = OpConstantComposite %239 %239 %239 %239 
                                         i32 %334 = OpConstant 4 
                               Output f32_3* %380 = OpVariable Output 
                                             %383 = OpTypePointer Output %6 
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
                               Uniform f32_4* %53 = OpAccessChain %23 %25 %49 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %11 
                                        f32_4 %56 = OpVectorShuffle %55 %55 3 3 3 3 
                                        f32_4 %57 = OpFMul %54 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpFAdd %57 %58 
                                                      OpStore %9 %59 
                                        f32_4 %61 = OpLoad %47 
                                        f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %23 %63 %26 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %62 %65 
                                                      OpStore %60 %66 
                               Uniform f32_4* %67 = OpAccessChain %23 %63 %31 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %47 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %60 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %60 %73 
                               Uniform f32_4* %74 = OpAccessChain %23 %63 %39 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %60 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %60 %80 
                               Uniform f32_4* %86 = OpAccessChain %23 %63 %49 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %60 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %31 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %102 = OpAccessChain %23 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpFMul %100 %104 
                              Uniform f32_4* %106 = OpAccessChain %23 %101 
                                       f32_4 %107 = OpLoad %106 
                                       f32_2 %108 = OpVectorShuffle %107 %107 2 3 
                                       f32_2 %109 = OpFAdd %105 %108 
                                                      OpStore %97 %109 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %115 = OpAccessChain %23 %114 %31 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                         f32 %118 = OpDot %113 %117 
                                Private f32* %121 = OpAccessChain %47 %119 
                                                      OpStore %121 %118 
                                       f32_3 %122 = OpLoad %112 
                              Uniform f32_4* %123 = OpAccessChain %23 %114 %26 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %127 = OpAccessChain %47 %81 
                                                      OpStore %127 %126 
                                       f32_3 %128 = OpLoad %112 
                              Uniform f32_4* %129 = OpAccessChain %23 %114 %39 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                         f32 %132 = OpDot %128 %131 
                                Private f32* %134 = OpAccessChain %47 %133 
                                                      OpStore %134 %132 
                                       f32_4 %136 = OpLoad %47 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_4 %138 = OpLoad %47 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                         f32 %140 = OpDot %137 %139 
                                                      OpStore %135 %140 
                                         f32 %141 = OpLoad %135 
                                         f32 %142 = OpExtInst %1 32 %141 
                                                      OpStore %135 %142 
                                         f32 %143 = OpLoad %135 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %47 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                       f32_4 %148 = OpLoad %47 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %47 %149 
                                       f32_4 %152 = OpLoad %47 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                                      OpStore %151 %153 
                                       f32_4 %155 = OpLoad %9 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                                      OpStore %154 %156 
                                       f32_4 %159 = OpLoad %158 
                                                      OpStore %157 %159 
                                       f32_4 %161 = OpLoad %9 
                                                      OpStore %160 %161 
                                Private f32* %164 = OpAccessChain %47 %81 
                                         f32 %165 = OpLoad %164 
                                Private f32* %166 = OpAccessChain %47 %81 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFMul %165 %167 
                                Private f32* %169 = OpAccessChain %163 %119 
                                                      OpStore %169 %168 
                                Private f32* %170 = OpAccessChain %47 %119 
                                         f32 %171 = OpLoad %170 
                                Private f32* %172 = OpAccessChain %47 %119 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFMul %171 %173 
                                Private f32* %175 = OpAccessChain %163 %119 
                                         f32 %176 = OpLoad %175 
                                         f32 %177 = OpFNegate %176 
                                         f32 %178 = OpFAdd %174 %177 
                                Private f32* %179 = OpAccessChain %163 %119 
                                                      OpStore %179 %178 
                                       f32_4 %181 = OpLoad %47 
                                       f32_4 %182 = OpVectorShuffle %181 %181 1 2 2 0 
                                       f32_4 %183 = OpLoad %47 
                                       f32_4 %184 = OpVectorShuffle %183 %183 0 1 2 2 
                                       f32_4 %185 = OpFMul %182 %184 
                                                      OpStore %180 %185 
                              Uniform f32_4* %188 = OpAccessChain %23 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpLoad %180 
                                         f32 %191 = OpDot %189 %190 
                                Private f32* %192 = OpAccessChain %186 %119 
                                                      OpStore %192 %191 
                              Uniform f32_4* %194 = OpAccessChain %23 %193 
                                       f32_4 %195 = OpLoad %194 
                                       f32_4 %196 = OpLoad %180 
                                         f32 %197 = OpDot %195 %196 
                                Private f32* %198 = OpAccessChain %186 %81 
                                                      OpStore %198 %197 
                              Uniform f32_4* %200 = OpAccessChain %23 %199 
                                       f32_4 %201 = OpLoad %200 
                                       f32_4 %202 = OpLoad %180 
                                         f32 %203 = OpDot %201 %202 
                                Private f32* %204 = OpAccessChain %186 %133 
                                                      OpStore %204 %203 
                              Uniform f32_4* %206 = OpAccessChain %23 %205 
                                       f32_4 %207 = OpLoad %206 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 1 2 
                                       f32_3 %209 = OpLoad %163 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 0 0 
                                       f32_3 %211 = OpFMul %208 %210 
                                       f32_3 %212 = OpLoad %186 
                                       f32_3 %213 = OpFAdd %211 %212 
                                                      OpStore %163 %213 
                                Private f32* %216 = OpAccessChain %47 %215 
                                                      OpStore %216 %214 
                              Uniform f32_4* %218 = OpAccessChain %23 %217 
                                       f32_4 %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %47 
                                         f32 %221 = OpDot %219 %220 
                                Private f32* %222 = OpAccessChain %186 %119 
                                                      OpStore %222 %221 
                              Uniform f32_4* %224 = OpAccessChain %23 %223 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpLoad %47 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %186 %81 
                                                      OpStore %228 %227 
                              Uniform f32_4* %230 = OpAccessChain %23 %229 
                                       f32_4 %231 = OpLoad %230 
                                       f32_4 %232 = OpLoad %47 
                                         f32 %233 = OpDot %231 %232 
                                Private f32* %234 = OpAccessChain %186 %133 
                                                      OpStore %234 %233 
                                       f32_3 %235 = OpLoad %163 
                                       f32_3 %236 = OpLoad %186 
                                       f32_3 %237 = OpFAdd %235 %236 
                                                      OpStore %163 %237 
                                       f32_3 %238 = OpLoad %163 
                                       f32_3 %241 = OpExtInst %1 40 %238 %240 
                                                      OpStore %163 %241 
                                       f32_3 %243 = OpLoad %163 
                                       f32_3 %244 = OpExtInst %1 30 %243 
                                                      OpStore %242 %244 
                                       f32_3 %245 = OpLoad %242 
                                       f32_3 %248 = OpFMul %245 %247 
                                                      OpStore %242 %248 
                                       f32_3 %249 = OpLoad %242 
                                       f32_3 %250 = OpExtInst %1 29 %249 
                                                      OpStore %242 %250 
                                       f32_3 %251 = OpLoad %242 
                                       f32_3 %254 = OpFMul %251 %253 
                                       f32_3 %257 = OpFAdd %254 %256 
                                                      OpStore %242 %257 
                                       f32_3 %258 = OpLoad %242 
                                       f32_3 %259 = OpExtInst %1 40 %258 %240 
                                                      OpStore %242 %259 
                                       f32_4 %260 = OpLoad %9 
                                       f32_4 %261 = OpVectorShuffle %260 %260 1 1 1 1 
                                       f32_4 %262 = OpFNegate %261 
                              Uniform f32_4* %263 = OpAccessChain %23 %26 
                                       f32_4 %264 = OpLoad %263 
                                       f32_4 %265 = OpFAdd %262 %264 
                                                      OpStore %60 %265 
                                       f32_4 %267 = OpLoad %47 
                                       f32_4 %268 = OpVectorShuffle %267 %267 1 1 1 1 
                                       f32_4 %269 = OpLoad %60 
                                       f32_4 %270 = OpFMul %268 %269 
                                                      OpStore %266 %270 
                                       f32_4 %271 = OpLoad %60 
                                       f32_4 %272 = OpLoad %60 
                                       f32_4 %273 = OpFMul %271 %272 
                                                      OpStore %60 %273 
                                       f32_4 %275 = OpLoad %9 
                                       f32_4 %276 = OpVectorShuffle %275 %275 0 0 0 0 
                                       f32_4 %277 = OpFNegate %276 
                              Uniform f32_4* %278 = OpAccessChain %23 %31 
                                       f32_4 %279 = OpLoad %278 
                                       f32_4 %280 = OpFAdd %277 %279 
                                                      OpStore %274 %280 
                                       f32_4 %281 = OpLoad %9 
                                       f32_4 %282 = OpVectorShuffle %281 %281 2 2 2 2 
                                       f32_4 %283 = OpFNegate %282 
                              Uniform f32_4* %284 = OpAccessChain %23 %39 
                                       f32_4 %285 = OpLoad %284 
                                       f32_4 %286 = OpFAdd %283 %285 
                                                      OpStore %9 %286 
                                       f32_4 %287 = OpLoad %274 
                                       f32_4 %288 = OpLoad %47 
                                       f32_4 %289 = OpVectorShuffle %288 %288 0 0 0 0 
                                       f32_4 %290 = OpFMul %287 %289 
                                       f32_4 %291 = OpLoad %266 
                                       f32_4 %292 = OpFAdd %290 %291 
                                                      OpStore %266 %292 
                                       f32_4 %293 = OpLoad %9 
                                       f32_4 %294 = OpLoad %47 
                                       f32_4 %295 = OpVectorShuffle %294 %294 2 2 2 2 
                                       f32_4 %296 = OpFMul %293 %295 
                                       f32_4 %297 = OpLoad %266 
                                       f32_4 %298 = OpFAdd %296 %297 
                                                      OpStore %47 %298 
                                       f32_4 %299 = OpLoad %274 
                                       f32_4 %300 = OpLoad %274 
                                       f32_4 %301 = OpFMul %299 %300 
                                       f32_4 %302 = OpLoad %60 
                                       f32_4 %303 = OpFAdd %301 %302 
                                                      OpStore %60 %303 
                                       f32_4 %304 = OpLoad %9 
                                       f32_4 %305 = OpLoad %9 
                                       f32_4 %306 = OpFMul %304 %305 
                                       f32_4 %307 = OpLoad %60 
                                       f32_4 %308 = OpFAdd %306 %307 
                                                      OpStore %9 %308 
                                       f32_4 %309 = OpLoad %9 
                                       f32_4 %312 = OpExtInst %1 40 %309 %311 
                                                      OpStore %9 %312 
                                       f32_4 %313 = OpLoad %9 
                                       f32_4 %314 = OpExtInst %1 32 %313 
                                                      OpStore %60 %314 
                                       f32_4 %315 = OpLoad %9 
                              Uniform f32_4* %316 = OpAccessChain %23 %49 
                                       f32_4 %317 = OpLoad %316 
                                       f32_4 %318 = OpFMul %315 %317 
                                       f32_4 %320 = OpFAdd %318 %319 
                                                      OpStore %9 %320 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpFDiv %319 %321 
                                                      OpStore %9 %322 
                                       f32_4 %323 = OpLoad %47 
                                       f32_4 %324 = OpLoad %60 
                                       f32_4 %325 = OpFMul %323 %324 
                                                      OpStore %47 %325 
                                       f32_4 %326 = OpLoad %47 
                                       f32_4 %328 = OpExtInst %1 40 %326 %327 
                                                      OpStore %47 %328 
                                       f32_4 %329 = OpLoad %9 
                                       f32_4 %330 = OpLoad %47 
                                       f32_4 %331 = OpFMul %329 %330 
                                                      OpStore %9 %331 
                                       f32_4 %332 = OpLoad %9 
                                       f32_3 %333 = OpVectorShuffle %332 %332 1 1 1 
                              Uniform f32_4* %335 = OpAccessChain %23 %334 %26 
                                       f32_4 %336 = OpLoad %335 
                                       f32_3 %337 = OpVectorShuffle %336 %336 0 1 2 
                                       f32_3 %338 = OpFMul %333 %337 
                                       f32_4 %339 = OpLoad %47 
                                       f32_4 %340 = OpVectorShuffle %339 %338 4 5 6 3 
                                                      OpStore %47 %340 
                              Uniform f32_4* %341 = OpAccessChain %23 %334 %31 
                                       f32_4 %342 = OpLoad %341 
                                       f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
                                       f32_4 %344 = OpLoad %9 
                                       f32_3 %345 = OpVectorShuffle %344 %344 0 0 0 
                                       f32_3 %346 = OpFMul %343 %345 
                                       f32_4 %347 = OpLoad %47 
                                       f32_3 %348 = OpVectorShuffle %347 %347 0 1 2 
                                       f32_3 %349 = OpFAdd %346 %348 
                                       f32_4 %350 = OpLoad %47 
                                       f32_4 %351 = OpVectorShuffle %350 %349 4 5 6 3 
                                                      OpStore %47 %351 
                              Uniform f32_4* %352 = OpAccessChain %23 %334 %39 
                                       f32_4 %353 = OpLoad %352 
                                       f32_3 %354 = OpVectorShuffle %353 %353 0 1 2 
                                       f32_4 %355 = OpLoad %9 
                                       f32_3 %356 = OpVectorShuffle %355 %355 2 2 2 
                                       f32_3 %357 = OpFMul %354 %356 
                                       f32_4 %358 = OpLoad %47 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                       f32_3 %360 = OpFAdd %357 %359 
                                       f32_4 %361 = OpLoad %9 
                                       f32_4 %362 = OpVectorShuffle %361 %360 4 5 6 3 
                                                      OpStore %9 %362 
                              Uniform f32_4* %363 = OpAccessChain %23 %334 %49 
                                       f32_4 %364 = OpLoad %363 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                       f32_4 %366 = OpLoad %9 
                                       f32_3 %367 = OpVectorShuffle %366 %366 3 3 3 
                                       f32_3 %368 = OpFMul %365 %367 
                                       f32_4 %369 = OpLoad %9 
                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                                       f32_3 %371 = OpFAdd %368 %370 
                                       f32_4 %372 = OpLoad %9 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %9 %373 
                                       f32_4 %374 = OpLoad %9 
                                       f32_3 %375 = OpVectorShuffle %374 %374 0 1 2 
                                       f32_3 %376 = OpLoad %242 
                                       f32_3 %377 = OpFAdd %375 %376 
                                       f32_4 %378 = OpLoad %9 
                                       f32_4 %379 = OpVectorShuffle %378 %377 4 5 6 3 
                                                      OpStore %9 %379 
                                       f32_4 %381 = OpLoad %9 
                                       f32_3 %382 = OpVectorShuffle %381 %381 0 1 2 
                                                      OpStore %380 %382 
                                 Output f32* %384 = OpAccessChain %85 %31 %81 
                                         f32 %385 = OpLoad %384 
                                         f32 %386 = OpFNegate %385 
                                 Output f32* %387 = OpAccessChain %85 %31 %81 
                                                      OpStore %387 %386 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 271
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %57 %140 %249 %255 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %74 ArrayStride 74 
                                                      OpMemberDecorate %75 0 RelaxedPrecision 
                                                      OpMemberDecorate %75 0 Offset 75 
                                                      OpMemberDecorate %75 1 Offset 75 
                                                      OpMemberDecorate %75 2 Offset 75 
                                                      OpMemberDecorate %75 3 Offset 75 
                                                      OpMemberDecorate %75 4 Offset 75 
                                                      OpMemberDecorate %75 5 RelaxedPrecision 
                                                      OpMemberDecorate %75 5 Offset 75 
                                                      OpMemberDecorate %75 6 Offset 75 
                                                      OpMemberDecorate %75 7 Offset 75 
                                                      OpMemberDecorate %75 8 RelaxedPrecision 
                                                      OpMemberDecorate %75 8 Offset 75 
                                                      OpDecorate %75 Block 
                                                      OpDecorate %77 DescriptorSet 77 
                                                      OpDecorate %77 Binding 77 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %131 SpecId 131 
                                                      OpDecorate %140 Location 140 
                                                      OpDecorate %216 DescriptorSet 216 
                                                      OpDecorate %216 Binding 216 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %249 Location 249 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %255 Location 255 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                               Private f32_3* %53 = OpVariable Private 
                                              %56 = OpTypePointer Input %7 
                                 Input f32_4* %57 = OpVariable Input 
                               Private f32_3* %71 = OpVariable Private 
                                          u32 %73 = OpConstant 4 
                                              %74 = OpTypeArray %7 %73 
                                              %75 = OpTypeStruct %7 %7 %74 %21 %21 %7 %6 %6 %6 
                                              %76 = OpTypePointer Uniform %75 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32;}* %77 = OpVariable Uniform 
                                              %78 = OpTypeInt 32 1 
                                          i32 %79 = OpConstant 7 
                                              %80 = OpTypePointer Uniform %6 
                                          u32 %95 = OpConstant 3 
                                          i32 %98 = OpConstant 8 
                                             %104 = OpTypeBool 
                                             %105 = OpTypePointer Private %104 
                               Private bool* %106 = OpVariable Private 
                                         f32 %109 = OpConstant 3.67402E-40 
                                         i32 %112 = OpConstant 0 
                                         i32 %113 = OpConstant 1 
                                         i32 %115 = OpConstant -1 
                                         f32 %123 = OpConstant 3.67402E-40 
                                        bool %125 = OpConstantFalse 
                                        bool %131 = OpSpecConstantFalse 
                                         u32 %134 = OpConstant 1 
                              Private f32_3* %138 = OpVariable Private 
                                             %139 = OpTypePointer Input %21 
                                Input f32_3* %140 = OpVariable Input 
                                         i32 %143 = OpConstant 2 
                                             %144 = OpTypePointer Uniform %7 
                                         i32 %166 = OpConstant 3 
                                             %171 = OpTypePointer Function %21 
                                         i32 %181 = OpConstant 4 
                                             %182 = OpTypePointer Uniform %21 
                              Private f32_4* %187 = OpVariable Private 
                                Private f32* %194 = OpVariable Private 
                                         f32 %197 = OpConstant 3.67402E-40 
                                         f32 %199 = OpConstant 3.67402E-40 
                                         u32 %201 = OpConstant 2 
                                         f32 %204 = OpConstant 3.67402E-40 
                                             %213 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %214 = OpTypeSampledImage %213 
                                             %215 = OpTypePointer UniformConstant %214 
 UniformConstant read_only Texture3DSampled* %216 = OpVariable UniformConstant 
                              Private f32_3* %227 = OpVariable Private 
                              Private f32_3* %237 = OpVariable Private 
                                         i32 %239 = OpConstant 5 
                                Input f32_3* %249 = OpVariable Input 
                                             %254 = OpTypePointer Output %7 
                               Output f32_4* %255 = OpVariable Output 
                                             %258 = OpTypePointer Output %6 
                                         i32 %260 = OpConstant 6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %172 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                 Private f32* %35 = OpAccessChain %20 %30 
                                          f32 %36 = OpLoad %35 
                                 Private f32* %37 = OpAccessChain %20 %30 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFMul %36 %38 
                                 Private f32* %40 = OpAccessChain %34 %30 
                                                      OpStore %40 %39 
                                 Private f32* %41 = OpAccessChain %20 %30 
                                          f32 %42 = OpLoad %41 
                                 Private f32* %43 = OpAccessChain %34 %30 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFMul %42 %44 
                                 Private f32* %46 = OpAccessChain %34 %30 
                                                      OpStore %46 %45 
                                 Private f32* %47 = OpAccessChain %20 %30 
                                          f32 %48 = OpLoad %47 
                                 Private f32* %49 = OpAccessChain %34 %30 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFMul %48 %50 
                                 Private f32* %52 = OpAccessChain %34 %30 
                                                      OpStore %52 %51 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFNegate %59 
                                        f32_3 %61 = OpFAdd %55 %60 
                                                      OpStore %53 %61 
                                        f32_3 %62 = OpLoad %34 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 0 0 
                                        f32_3 %64 = OpLoad %53 
                                        f32_3 %65 = OpFMul %63 %64 
                                        f32_4 %66 = OpLoad %57 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFAdd %65 %67 
                                                      OpStore %53 %68 
                                        f32_3 %69 = OpLoad %53 
                                        f32_3 %70 = OpExtInst %1 30 %69 
                                                      OpStore %34 %70 
                                        f32_3 %72 = OpLoad %34 
                                 Uniform f32* %81 = OpAccessChain %77 %79 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %83 = OpAccessChain %77 %79 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %85 = OpAccessChain %77 %79 
                                          f32 %86 = OpLoad %85 
                                        f32_3 %87 = OpCompositeConstruct %82 %84 %86 
                                          f32 %88 = OpCompositeExtract %87 0 
                                          f32 %89 = OpCompositeExtract %87 1 
                                          f32 %90 = OpCompositeExtract %87 2 
                                        f32_3 %91 = OpCompositeConstruct %88 %89 %90 
                                        f32_3 %92 = OpFMul %72 %91 
                                                      OpStore %71 %92 
                                        f32_3 %93 = OpLoad %71 
                                        f32_3 %94 = OpExtInst %1 29 %93 
                                                      OpStore %71 %94 
                                 Private f32* %96 = OpAccessChain %9 %95 
                                          f32 %97 = OpLoad %96 
                                 Uniform f32* %99 = OpAccessChain %77 %98 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFNegate %100 
                                         f32 %102 = OpFAdd %97 %101 
                                Private f32* %103 = OpAccessChain %20 %30 
                                                      OpStore %103 %102 
                                Private f32* %107 = OpAccessChain %20 %30 
                                         f32 %108 = OpLoad %107 
                                        bool %110 = OpFOrdLessThan %108 %109 
                                                      OpStore %106 %110 
                                        bool %111 = OpLoad %106 
                                         i32 %114 = OpSelect %111 %113 %112 
                                         i32 %116 = OpIMul %114 %115 
                                        bool %117 = OpINotEqual %116 %112 
                                                      OpSelectionMerge %119 None 
                                                      OpBranchConditional %117 %118 %119 
                                             %118 = OpLabel 
                                                      OpKill
                                             %119 = OpLabel 
                                Uniform f32* %121 = OpAccessChain %77 %113 %30 
                                         f32 %122 = OpLoad %121 
                                        bool %124 = OpFOrdEqual %122 %123 
                                                      OpStore %106 %124 
                                                      OpSelectionMerge %127 None 
                                                      OpBranchConditional %125 %126 %127 
                                             %126 = OpLabel 
                                        bool %128 = OpLoad %106 
                                                      OpSelectionMerge %130 None 
                                                      OpBranchConditional %128 %129 %130 
                                             %129 = OpLabel 
                                                      OpBranch %130 
                                             %130 = OpLabel 
                                                      OpBranch %127 
                                             %127 = OpLabel 
                                                      OpSelectionMerge %133 None 
                                                      OpBranchConditional %131 %132 %222 
                                             %132 = OpLabel 
                                Uniform f32* %135 = OpAccessChain %77 %113 %134 
                                         f32 %136 = OpLoad %135 
                                        bool %137 = OpFOrdEqual %136 %123 
                                                      OpStore %106 %137 
                                       f32_3 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 1 1 1 
                              Uniform f32_4* %145 = OpAccessChain %77 %143 %113 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFMul %142 %147 
                                                      OpStore %138 %148 
                              Uniform f32_4* %149 = OpAccessChain %77 %143 %112 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpLoad %140 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 0 0 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_3 %155 = OpLoad %138 
                                       f32_3 %156 = OpFAdd %154 %155 
                                                      OpStore %138 %156 
                              Uniform f32_4* %157 = OpAccessChain %77 %143 %143 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpLoad %140 
                                       f32_3 %161 = OpVectorShuffle %160 %160 2 2 2 
                                       f32_3 %162 = OpFMul %159 %161 
                                       f32_3 %163 = OpLoad %138 
                                       f32_3 %164 = OpFAdd %162 %163 
                                                      OpStore %138 %164 
                                       f32_3 %165 = OpLoad %138 
                              Uniform f32_4* %167 = OpAccessChain %77 %143 %166 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFAdd %165 %169 
                                                      OpStore %138 %170 
                                        bool %173 = OpLoad %106 
                                                      OpSelectionMerge %175 None 
                                                      OpBranchConditional %173 %174 %177 
                                             %174 = OpLabel 
                                       f32_3 %176 = OpLoad %138 
                                                      OpStore %172 %176 
                                                      OpBranch %175 
                                             %177 = OpLabel 
                                       f32_3 %178 = OpLoad %140 
                                                      OpStore %172 %178 
                                                      OpBranch %175 
                                             %175 = OpLabel 
                                       f32_3 %179 = OpLoad %172 
                                                      OpStore %138 %179 
                                       f32_3 %180 = OpLoad %138 
                              Uniform f32_3* %183 = OpAccessChain %77 %181 
                                       f32_3 %184 = OpLoad %183 
                                       f32_3 %185 = OpFNegate %184 
                                       f32_3 %186 = OpFAdd %180 %185 
                                                      OpStore %138 %186 
                                       f32_3 %188 = OpLoad %138 
                              Uniform f32_3* %189 = OpAccessChain %77 %166 
                                       f32_3 %190 = OpLoad %189 
                                       f32_3 %191 = OpFMul %188 %190 
                                       f32_4 %192 = OpLoad %187 
                                       f32_4 %193 = OpVectorShuffle %192 %191 0 4 5 6 
                                                      OpStore %187 %193 
                                Private f32* %195 = OpAccessChain %187 %134 
                                         f32 %196 = OpLoad %195 
                                         f32 %198 = OpFMul %196 %197 
                                         f32 %200 = OpFAdd %198 %199 
                                                      OpStore %194 %200 
                                Uniform f32* %202 = OpAccessChain %77 %113 %201 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %206 = OpFAdd %205 %199 
                                Private f32* %207 = OpAccessChain %138 %30 
                                                      OpStore %207 %206 
                                         f32 %208 = OpLoad %194 
                                Private f32* %209 = OpAccessChain %138 %30 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpExtInst %1 40 %208 %210 
                                Private f32* %212 = OpAccessChain %187 %30 
                                                      OpStore %212 %211 
                  read_only Texture3DSampled %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %187 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 2 3 
                                       f32_4 %220 = OpImageSampleImplicitLod %217 %219 
                                                      OpStore %187 %220 
                                       f32_4 %221 = OpLoad %187 
                                                      OpStore %20 %221 
                                                      OpBranch %133 
                                             %222 = OpLabel 
                                Private f32* %223 = OpAccessChain %20 %30 
                                                      OpStore %223 %123 
                                Private f32* %224 = OpAccessChain %20 %134 
                                                      OpStore %224 %123 
                                Private f32* %225 = OpAccessChain %20 %201 
                                                      OpStore %225 %123 
                                Private f32* %226 = OpAccessChain %20 %95 
                                                      OpStore %226 %123 
                                                      OpBranch %133 
                                             %133 = OpLabel 
                                       f32_4 %228 = OpLoad %20 
                              Uniform f32_4* %229 = OpAccessChain %77 %112 
                                       f32_4 %230 = OpLoad %229 
                                         f32 %231 = OpDot %228 %230 
                                Private f32* %232 = OpAccessChain %227 %30 
                                                      OpStore %232 %231 
                                Private f32* %233 = OpAccessChain %227 %30 
                                         f32 %234 = OpLoad %233 
                                         f32 %235 = OpExtInst %1 43 %234 %109 %123 
                                Private f32* %236 = OpAccessChain %227 %30 
                                                      OpStore %236 %235 
                                       f32_3 %238 = OpLoad %53 
                              Uniform f32_4* %240 = OpAccessChain %77 %239 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %243 = OpFMul %238 %242 
                                                      OpStore %237 %243 
                                       f32_3 %244 = OpLoad %227 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpLoad %237 
                                       f32_3 %247 = OpFMul %245 %246 
                                                      OpStore %227 %247 
                                       f32_3 %248 = OpLoad %53 
                                       f32_3 %250 = OpLoad %249 
                                       f32_3 %251 = OpFMul %248 %250 
                                       f32_3 %252 = OpLoad %227 
                                       f32_3 %253 = OpFAdd %251 %252 
                                                      OpStore %227 %253 
                                Private f32* %256 = OpAccessChain %9 %95 
                                         f32 %257 = OpLoad %256 
                                 Output f32* %259 = OpAccessChain %255 %95 
                                                      OpStore %259 %257 
                                Uniform f32* %261 = OpAccessChain %77 %260 
                                         f32 %262 = OpLoad %261 
                                       f32_3 %263 = OpCompositeConstruct %262 %262 %262 
                                       f32_3 %264 = OpLoad %71 
                                       f32_3 %265 = OpFMul %263 %264 
                                       f32_3 %266 = OpLoad %227 
                                       f32_3 %267 = OpFAdd %265 %266 
                                       f32_4 %268 = OpLoad %255 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %255 %269 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat20;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat20 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat6;
vec3 u_xlat8;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat6.x = u_xlat1.x * u_xlat1.x;
    u_xlat6.x = u_xlat1.x * u_xlat6.x;
    u_xlat1.x = u_xlat1.x * u_xlat6.x;
    u_xlat6.xyz = u_xlat0.xyz + (-vs_COLOR0.xyz);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat6.xyz + vs_COLOR0.xyz;
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat16 = u_xlat0.w + (-_Cutoff);
    u_xlatb16 = u_xlat16<0.0;
    if((int(u_xlatb16) * int(0xffffffffu))!=0){discard;}
    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat17 = sqrt(u_xlat17);
    u_xlat17 = (-u_xlat16) + u_xlat17;
    u_xlat16 = unity_ShadowFadeCenterAndType.w * u_xlat17 + u_xlat16;
    u_xlat16 = u_xlat16 * _LightShadowData.z + _LightShadowData.w;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb3 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat8.xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb3)) ? u_xlat8.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat8.x = u_xlat3.y * 0.25 + 0.75;
        u_xlat4.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat8.x, u_xlat4.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat3.x = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat8.xy);
    u_xlat16 = u_xlat16 + u_xlat10_4.x;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.x = min(u_xlat16, u_xlat3.x);
    u_xlat16 = (u_xlatb17) ? u_xlat3.x : u_xlat16;
    u_xlat3.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat3;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 322
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %98 %99 %113 %152 %155 %158 %159 %161 %281 %303 %315 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 RelaxedPrecision 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 RelaxedPrecision 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpMemberDecorate %21 9 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %113 Location 113 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %155 Location 155 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %159 Location 159 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %161 Location 161 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %281 Location 281 
                                                      OpDecorate %303 Location 303 
                                                      OpDecorate %315 Location 315 
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
                                              %21 = OpTypeStruct %7 %7 %7 %7 %7 %16 %18 %19 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 6 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 0 
                                          i32 %39 = OpConstant 2 
                               Private f32_4* %47 = OpVariable Private 
                                          i32 %49 = OpConstant 3 
                               Private f32_4* %60 = OpVariable Private 
                                          i32 %63 = OpConstant 8 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypeVector %6 2 
                                              %97 = OpTypePointer Output %96 
                                Output f32_2* %98 = OpVariable Output 
                                 Input f32_4* %99 = OpVariable Input 
                                         i32 %102 = OpConstant 9 
                                             %111 = OpTypeVector %6 3 
                                             %112 = OpTypePointer Input %111 
                                Input f32_3* %113 = OpVariable Input 
                                         i32 %115 = OpConstant 7 
                                         u32 %120 = OpConstant 0 
                                             %121 = OpTypePointer Private %6 
                                         u32 %134 = OpConstant 2 
                                Private f32* %136 = OpVariable Private 
                                             %151 = OpTypePointer Output %111 
                               Output f32_3* %152 = OpVariable Output 
                               Output f32_3* %155 = OpVariable Output 
                               Output f32_4* %158 = OpVariable Output 
                                Input f32_4* %159 = OpVariable Input 
                               Output f32_4* %161 = OpVariable Output 
                              Private f32_4* %163 = OpVariable Private 
                              Private f32_4* %170 = OpVariable Private 
                              Private f32_4* %178 = OpVariable Private 
                                         f32 %214 = OpConstant 3.67402E-40 
                                       f32_4 %215 = OpConstantComposite %214 %214 %214 %214 
                                         i32 %220 = OpConstant 4 
                                         f32 %224 = OpConstant 3.67402E-40 
                                       f32_4 %225 = OpConstantComposite %224 %224 %224 %224 
                                         f32 %233 = OpConstant 3.67402E-40 
                                       f32_4 %234 = OpConstantComposite %233 %233 %233 %233 
                                         i32 %241 = OpConstant 5 
                               Output f32_3* %281 = OpVariable Output 
                                             %286 = OpTypePointer Uniform %6 
                                         f32 %293 = OpConstant 3.67402E-40 
                                         u32 %295 = OpConstant 3 
                                       f32_2 %299 = OpConstantComposite %293 %293 
                               Output f32_4* %303 = OpVariable Output 
                               Output f32_4* %315 = OpVariable Output 
                                             %316 = OpTypePointer Output %6 
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
                               Uniform f32_4* %53 = OpAccessChain %23 %25 %49 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %11 
                                        f32_4 %56 = OpVectorShuffle %55 %55 3 3 3 3 
                                        f32_4 %57 = OpFMul %54 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpFAdd %57 %58 
                                                      OpStore %9 %59 
                                        f32_4 %61 = OpLoad %47 
                                        f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %23 %63 %26 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %62 %65 
                                                      OpStore %60 %66 
                               Uniform f32_4* %67 = OpAccessChain %23 %63 %31 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %47 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %60 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %60 %73 
                               Uniform f32_4* %74 = OpAccessChain %23 %63 %39 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %60 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %60 %80 
                               Uniform f32_4* %81 = OpAccessChain %23 %63 %49 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %47 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %60 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %47 %87 
                                        f32_4 %93 = OpLoad %47 
                                Output f32_4* %95 = OpAccessChain %92 %31 
                                                      OpStore %95 %93 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                              Uniform f32_4* %103 = OpAccessChain %23 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %101 %105 
                              Uniform f32_4* %107 = OpAccessChain %23 %102 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 3 
                                       f32_2 %110 = OpFAdd %106 %109 
                                                      OpStore %98 %110 
                                       f32_3 %114 = OpLoad %113 
                              Uniform f32_4* %116 = OpAccessChain %23 %115 %31 
                                       f32_4 %117 = OpLoad %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                         f32 %119 = OpDot %114 %118 
                                Private f32* %122 = OpAccessChain %60 %120 
                                                      OpStore %122 %119 
                                       f32_3 %123 = OpLoad %113 
                              Uniform f32_4* %124 = OpAccessChain %23 %115 %26 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                         f32 %127 = OpDot %123 %126 
                                Private f32* %128 = OpAccessChain %60 %88 
                                                      OpStore %128 %127 
                                       f32_3 %129 = OpLoad %113 
                              Uniform f32_4* %130 = OpAccessChain %23 %115 %39 
                                       f32_4 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                         f32 %133 = OpDot %129 %132 
                                Private f32* %135 = OpAccessChain %60 %134 
                                                      OpStore %135 %133 
                                       f32_4 %137 = OpLoad %60 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_4 %139 = OpLoad %60 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                         f32 %141 = OpDot %138 %140 
                                                      OpStore %136 %141 
                                         f32 %142 = OpLoad %136 
                                         f32 %143 = OpExtInst %1 32 %142 
                                                      OpStore %136 %143 
                                         f32 %144 = OpLoad %136 
                                       f32_3 %145 = OpCompositeConstruct %144 %144 %144 
                                       f32_4 %146 = OpLoad %60 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %60 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %60 %150 
                                       f32_4 %153 = OpLoad %60 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                                      OpStore %152 %154 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                                      OpStore %155 %157 
                                       f32_4 %160 = OpLoad %159 
                                                      OpStore %158 %160 
                                       f32_4 %162 = OpLoad %9 
                                                      OpStore %161 %162 
                                       f32_4 %164 = OpLoad %9 
                                       f32_4 %165 = OpVectorShuffle %164 %164 1 1 1 1 
                                       f32_4 %166 = OpFNegate %165 
                              Uniform f32_4* %167 = OpAccessChain %23 %39 
                                       f32_4 %168 = OpLoad %167 
                                       f32_4 %169 = OpFAdd %166 %168 
                                                      OpStore %163 %169 
                                       f32_4 %171 = OpLoad %60 
                                       f32_4 %172 = OpVectorShuffle %171 %171 1 1 1 1 
                                       f32_4 %173 = OpLoad %163 
                                       f32_4 %174 = OpFMul %172 %173 
                                                      OpStore %170 %174 
                                       f32_4 %175 = OpLoad %163 
                                       f32_4 %176 = OpLoad %163 
                                       f32_4 %177 = OpFMul %175 %176 
                                                      OpStore %163 %177 
                                       f32_4 %179 = OpLoad %9 
                                       f32_4 %180 = OpVectorShuffle %179 %179 0 0 0 0 
                                       f32_4 %181 = OpFNegate %180 
                              Uniform f32_4* %182 = OpAccessChain %23 %26 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpFAdd %181 %183 
                                                      OpStore %178 %184 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %185 2 2 2 2 
                                       f32_4 %187 = OpFNegate %186 
                              Uniform f32_4* %188 = OpAccessChain %23 %49 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpFAdd %187 %189 
                                                      OpStore %9 %190 
                                       f32_4 %191 = OpLoad %178 
                                       f32_4 %192 = OpLoad %60 
                                       f32_4 %193 = OpVectorShuffle %192 %192 0 0 0 0 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %170 
                                       f32_4 %196 = OpFAdd %194 %195 
                                                      OpStore %170 %196 
                                       f32_4 %197 = OpLoad %9 
                                       f32_4 %198 = OpLoad %60 
                                       f32_4 %199 = OpVectorShuffle %198 %198 2 2 2 2 
                                       f32_4 %200 = OpFMul %197 %199 
                                       f32_4 %201 = OpLoad %170 
                                       f32_4 %202 = OpFAdd %200 %201 
                                                      OpStore %60 %202 
                                       f32_4 %203 = OpLoad %178 
                                       f32_4 %204 = OpLoad %178 
                                       f32_4 %205 = OpFMul %203 %204 
                                       f32_4 %206 = OpLoad %163 
                                       f32_4 %207 = OpFAdd %205 %206 
                                                      OpStore %163 %207 
                                       f32_4 %208 = OpLoad %9 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpFMul %208 %209 
                                       f32_4 %211 = OpLoad %163 
                                       f32_4 %212 = OpFAdd %210 %211 
                                                      OpStore %9 %212 
                                       f32_4 %213 = OpLoad %9 
                                       f32_4 %216 = OpExtInst %1 40 %213 %215 
                                                      OpStore %9 %216 
                                       f32_4 %217 = OpLoad %9 
                                       f32_4 %218 = OpExtInst %1 32 %217 
                                                      OpStore %163 %218 
                                       f32_4 %219 = OpLoad %9 
                              Uniform f32_4* %221 = OpAccessChain %23 %220 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpFMul %219 %222 
                                       f32_4 %226 = OpFAdd %223 %225 
                                                      OpStore %9 %226 
                                       f32_4 %227 = OpLoad %9 
                                       f32_4 %228 = OpFDiv %225 %227 
                                                      OpStore %9 %228 
                                       f32_4 %229 = OpLoad %60 
                                       f32_4 %230 = OpLoad %163 
                                       f32_4 %231 = OpFMul %229 %230 
                                                      OpStore %60 %231 
                                       f32_4 %232 = OpLoad %60 
                                       f32_4 %235 = OpExtInst %1 40 %232 %234 
                                                      OpStore %60 %235 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpLoad %60 
                                       f32_4 %238 = OpFMul %236 %237 
                                                      OpStore %9 %238 
                                       f32_4 %239 = OpLoad %9 
                                       f32_3 %240 = OpVectorShuffle %239 %239 1 1 1 
                              Uniform f32_4* %242 = OpAccessChain %23 %241 %26 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_3 %245 = OpFMul %240 %244 
                                       f32_4 %246 = OpLoad %60 
                                       f32_4 %247 = OpVectorShuffle %246 %245 4 5 6 3 
                                                      OpStore %60 %247 
                              Uniform f32_4* %248 = OpAccessChain %23 %241 %31 
                                       f32_4 %249 = OpLoad %248 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_4 %251 = OpLoad %9 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 0 0 
                                       f32_3 %253 = OpFMul %250 %252 
                                       f32_4 %254 = OpLoad %60 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_3 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %60 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                      OpStore %60 %258 
                              Uniform f32_4* %259 = OpAccessChain %23 %241 %39 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                       f32_4 %262 = OpLoad %9 
                                       f32_3 %263 = OpVectorShuffle %262 %262 2 2 2 
                                       f32_3 %264 = OpFMul %261 %263 
                                       f32_4 %265 = OpLoad %60 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_3 %267 = OpFAdd %264 %266 
                                       f32_4 %268 = OpLoad %9 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %9 %269 
                              Uniform f32_4* %270 = OpAccessChain %23 %241 %49 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_4 %273 = OpLoad %9 
                                       f32_3 %274 = OpVectorShuffle %273 %273 3 3 3 
                                       f32_3 %275 = OpFMul %272 %274 
                                       f32_4 %276 = OpLoad %9 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                       f32_3 %278 = OpFAdd %275 %277 
                                       f32_4 %279 = OpLoad %9 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
                                                      OpStore %9 %280 
                                       f32_4 %282 = OpLoad %9 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                                      OpStore %281 %283 
                                Private f32* %284 = OpAccessChain %47 %88 
                                         f32 %285 = OpLoad %284 
                                Uniform f32* %287 = OpAccessChain %23 %31 %120 
                                         f32 %288 = OpLoad %287 
                                         f32 %289 = OpFMul %285 %288 
                                Private f32* %290 = OpAccessChain %9 %120 
                                                      OpStore %290 %289 
                                Private f32* %291 = OpAccessChain %9 %120 
                                         f32 %292 = OpLoad %291 
                                         f32 %294 = OpFMul %292 %293 
                                Private f32* %296 = OpAccessChain %9 %295 
                                                      OpStore %296 %294 
                                       f32_4 %297 = OpLoad %47 
                                       f32_2 %298 = OpVectorShuffle %297 %297 0 3 
                                       f32_2 %300 = OpFMul %298 %299 
                                       f32_4 %301 = OpLoad %9 
                                       f32_4 %302 = OpVectorShuffle %301 %300 4 1 5 3 
                                                      OpStore %9 %302 
                                       f32_4 %304 = OpLoad %47 
                                       f32_2 %305 = OpVectorShuffle %304 %304 2 3 
                                       f32_4 %306 = OpLoad %303 
                                       f32_4 %307 = OpVectorShuffle %306 %305 0 1 4 5 
                                                      OpStore %303 %307 
                                       f32_4 %308 = OpLoad %9 
                                       f32_2 %309 = OpVectorShuffle %308 %308 2 2 
                                       f32_4 %310 = OpLoad %9 
                                       f32_2 %311 = OpVectorShuffle %310 %310 0 3 
                                       f32_2 %312 = OpFAdd %309 %311 
                                       f32_4 %313 = OpLoad %303 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 5 2 3 
                                                      OpStore %303 %314 
                                                      OpStore %315 %234 
                                 Output f32* %317 = OpAccessChain %92 %31 %88 
                                         f32 %318 = OpLoad %317 
                                         f32 %319 = OpFNegate %318 
                                 Output f32* %320 = OpAccessChain %92 %31 %88 
                                                      OpStore %320 %319 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 375
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %57 %124 %300 %353 %359 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %74 ArrayStride 74 
                                                      OpDecorate %75 ArrayStride 75 
                                                      OpMemberDecorate %76 0 Offset 76 
                                                      OpMemberDecorate %76 1 RelaxedPrecision 
                                                      OpMemberDecorate %76 1 Offset 76 
                                                      OpMemberDecorate %76 2 RelaxedPrecision 
                                                      OpMemberDecorate %76 2 Offset 76 
                                                      OpMemberDecorate %76 3 Offset 76 
                                                      OpMemberDecorate %76 4 Offset 76 
                                                      OpMemberDecorate %76 5 Offset 76 
                                                      OpMemberDecorate %76 6 Offset 76 
                                                      OpMemberDecorate %76 7 Offset 76 
                                                      OpMemberDecorate %76 8 Offset 76 
                                                      OpMemberDecorate %76 9 RelaxedPrecision 
                                                      OpMemberDecorate %76 9 Offset 76 
                                                      OpMemberDecorate %76 10 Offset 76 
                                                      OpMemberDecorate %76 11 Offset 76 
                                                      OpMemberDecorate %76 12 RelaxedPrecision 
                                                      OpMemberDecorate %76 12 Offset 76 
                                                      OpDecorate %76 Block 
                                                      OpDecorate %78 DescriptorSet 78 
                                                      OpDecorate %78 Binding 78 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %199 SpecId 199 
                                                      OpDecorate %279 DescriptorSet 279 
                                                      OpDecorate %279 Binding 279 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %300 Location 300 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %309 DescriptorSet 309 
                                                      OpDecorate %309 Binding 309 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %353 Location 353 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %359 Location 359 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                               Private f32_3* %53 = OpVariable Private 
                                              %56 = OpTypePointer Input %7 
                                 Input f32_4* %57 = OpVariable Input 
                               Private f32_3* %71 = OpVariable Private 
                                          u32 %73 = OpConstant 4 
                                              %74 = OpTypeArray %7 %73 
                                              %75 = OpTypeArray %7 %73 
                                              %76 = OpTypeStruct %21 %7 %7 %7 %74 %7 %75 %21 %21 %7 %6 %6 %6 
                                              %77 = OpTypePointer Uniform %76 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32;}* %78 = OpVariable Uniform 
                                              %79 = OpTypeInt 32 1 
                                          i32 %80 = OpConstant 11 
                                              %81 = OpTypePointer Uniform %6 
                                          u32 %96 = OpConstant 3 
                                          i32 %99 = OpConstant 12 
                                             %105 = OpTypeBool 
                                             %106 = OpTypePointer Private %105 
                               Private bool* %107 = OpVariable Private 
                                         f32 %110 = OpConstant 3.67402E-40 
                                         i32 %113 = OpConstant 0 
                                         i32 %114 = OpConstant 1 
                                         i32 %116 = OpConstant -1 
                              Private f32_3* %122 = OpVariable Private 
                                             %123 = OpTypePointer Input %21 
                                Input f32_3* %124 = OpVariable Input 
                                             %127 = OpTypePointer Uniform %21 
                              Private f32_3* %131 = OpVariable Private 
                                         i32 %132 = OpConstant 4 
                                         u32 %133 = OpConstant 2 
                                         u32 %139 = OpConstant 1 
                                         i32 %141 = OpConstant 2 
                                Private f32* %145 = OpVariable Private 
                                         i32 %150 = OpConstant 3 
                                             %151 = OpTypePointer Uniform %7 
                                         f32 %186 = OpConstant 3.67402E-40 
                               Private bool* %188 = OpVariable Private 
                                         i32 %189 = OpConstant 5 
                                        bool %193 = OpConstantFalse 
                                        bool %199 = OpSpecConstantFalse 
                               Private bool* %202 = OpVariable Private 
                                         i32 %208 = OpConstant 6 
                              Private f32_3* %234 = OpVariable Private 
                                             %235 = OpTypePointer Function %21 
                                         i32 %245 = OpConstant 8 
                              Private f32_4* %250 = OpVariable Private 
                                         i32 %252 = OpConstant 7 
                                         f32 %260 = OpConstant 3.67402E-40 
                                         f32 %262 = OpConstant 3.67402E-40 
                                Private f32* %265 = OpVariable Private 
                                         f32 %268 = OpConstant 3.67402E-40 
                                             %276 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %277 = OpTypeSampledImage %276 
                                             %278 = OpTypePointer UniformConstant %277 
 UniformConstant read_only Texture3DSampled* %279 = OpVariable UniformConstant 
                              Private f32_3* %290 = OpVariable Private 
                                Input f32_4* %300 = OpVariable Input 
                                Private f32* %308 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %309 = OpVariable UniformConstant 
                              Private f32_3* %315 = OpVariable Private 
                                             %330 = OpTypePointer Function %6 
                                         i32 %343 = OpConstant 9 
                                Input f32_3* %353 = OpVariable Input 
                                             %358 = OpTypePointer Output %7 
                               Output f32_4* %359 = OpVariable Output 
                                             %362 = OpTypePointer Output %6 
                                         i32 %364 = OpConstant 10 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %236 = OpVariable Function 
                               Function f32* %331 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                 Private f32* %35 = OpAccessChain %20 %30 
                                          f32 %36 = OpLoad %35 
                                 Private f32* %37 = OpAccessChain %20 %30 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFMul %36 %38 
                                 Private f32* %40 = OpAccessChain %34 %30 
                                                      OpStore %40 %39 
                                 Private f32* %41 = OpAccessChain %20 %30 
                                          f32 %42 = OpLoad %41 
                                 Private f32* %43 = OpAccessChain %34 %30 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFMul %42 %44 
                                 Private f32* %46 = OpAccessChain %34 %30 
                                                      OpStore %46 %45 
                                 Private f32* %47 = OpAccessChain %20 %30 
                                          f32 %48 = OpLoad %47 
                                 Private f32* %49 = OpAccessChain %34 %30 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFMul %48 %50 
                                 Private f32* %52 = OpAccessChain %34 %30 
                                                      OpStore %52 %51 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFNegate %59 
                                        f32_3 %61 = OpFAdd %55 %60 
                                                      OpStore %53 %61 
                                        f32_3 %62 = OpLoad %34 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 0 0 
                                        f32_3 %64 = OpLoad %53 
                                        f32_3 %65 = OpFMul %63 %64 
                                        f32_4 %66 = OpLoad %57 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFAdd %65 %67 
                                                      OpStore %53 %68 
                                        f32_3 %69 = OpLoad %53 
                                        f32_3 %70 = OpExtInst %1 30 %69 
                                                      OpStore %34 %70 
                                        f32_3 %72 = OpLoad %34 
                                 Uniform f32* %82 = OpAccessChain %78 %80 
                                          f32 %83 = OpLoad %82 
                                 Uniform f32* %84 = OpAccessChain %78 %80 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %86 = OpAccessChain %78 %80 
                                          f32 %87 = OpLoad %86 
                                        f32_3 %88 = OpCompositeConstruct %83 %85 %87 
                                          f32 %89 = OpCompositeExtract %88 0 
                                          f32 %90 = OpCompositeExtract %88 1 
                                          f32 %91 = OpCompositeExtract %88 2 
                                        f32_3 %92 = OpCompositeConstruct %89 %90 %91 
                                        f32_3 %93 = OpFMul %72 %92 
                                                      OpStore %71 %93 
                                        f32_3 %94 = OpLoad %71 
                                        f32_3 %95 = OpExtInst %1 29 %94 
                                                      OpStore %71 %95 
                                 Private f32* %97 = OpAccessChain %9 %96 
                                          f32 %98 = OpLoad %97 
                                Uniform f32* %100 = OpAccessChain %78 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFNegate %101 
                                         f32 %103 = OpFAdd %98 %102 
                                Private f32* %104 = OpAccessChain %20 %30 
                                                      OpStore %104 %103 
                                Private f32* %108 = OpAccessChain %20 %30 
                                         f32 %109 = OpLoad %108 
                                        bool %111 = OpFOrdLessThan %109 %110 
                                                      OpStore %107 %111 
                                        bool %112 = OpLoad %107 
                                         i32 %115 = OpSelect %112 %114 %113 
                                         i32 %117 = OpIMul %115 %116 
                                        bool %118 = OpINotEqual %117 %113 
                                                      OpSelectionMerge %120 None 
                                                      OpBranchConditional %118 %119 %120 
                                             %119 = OpLabel 
                                                      OpKill
                                             %120 = OpLabel 
                                       f32_3 %125 = OpLoad %124 
                                       f32_3 %126 = OpFNegate %125 
                              Uniform f32_3* %128 = OpAccessChain %78 %113 
                                       f32_3 %129 = OpLoad %128 
                                       f32_3 %130 = OpFAdd %126 %129 
                                                      OpStore %122 %130 
                                Uniform f32* %134 = OpAccessChain %78 %132 %113 %133 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %131 %30 
                                                      OpStore %136 %135 
                                Uniform f32* %137 = OpAccessChain %78 %132 %114 %133 
                                         f32 %138 = OpLoad %137 
                                Private f32* %140 = OpAccessChain %131 %139 
                                                      OpStore %140 %138 
                                Uniform f32* %142 = OpAccessChain %78 %132 %141 %133 
                                         f32 %143 = OpLoad %142 
                                Private f32* %144 = OpAccessChain %131 %133 
                                                      OpStore %144 %143 
                                       f32_3 %146 = OpLoad %122 
                                       f32_3 %147 = OpLoad %131 
                                         f32 %148 = OpDot %146 %147 
                                                      OpStore %145 %148 
                                       f32_3 %149 = OpLoad %124 
                              Uniform f32_4* %152 = OpAccessChain %78 %150 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFNegate %154 
                                       f32_3 %156 = OpFAdd %149 %155 
                                                      OpStore %122 %156 
                                       f32_3 %157 = OpLoad %122 
                                       f32_3 %158 = OpLoad %122 
                                         f32 %159 = OpDot %157 %158 
                                Private f32* %160 = OpAccessChain %122 %30 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %122 %30 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpExtInst %1 31 %162 
                                Private f32* %164 = OpAccessChain %122 %30 
                                                      OpStore %164 %163 
                                         f32 %165 = OpLoad %145 
                                         f32 %166 = OpFNegate %165 
                                Private f32* %167 = OpAccessChain %122 %30 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFAdd %166 %168 
                                Private f32* %170 = OpAccessChain %122 %30 
                                                      OpStore %170 %169 
                                Uniform f32* %171 = OpAccessChain %78 %150 %96 
                                         f32 %172 = OpLoad %171 
                                Private f32* %173 = OpAccessChain %122 %30 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFMul %172 %174 
                                         f32 %176 = OpLoad %145 
                                         f32 %177 = OpFAdd %175 %176 
                                                      OpStore %145 %177 
                                         f32 %178 = OpLoad %145 
                                Uniform f32* %179 = OpAccessChain %78 %141 %133 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFMul %178 %180 
                                Uniform f32* %182 = OpAccessChain %78 %141 %96 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpFAdd %181 %183 
                                                      OpStore %145 %184 
                                         f32 %185 = OpLoad %145 
                                         f32 %187 = OpExtInst %1 43 %185 %110 %186 
                                                      OpStore %145 %187 
                                Uniform f32* %190 = OpAccessChain %78 %189 %30 
                                         f32 %191 = OpLoad %190 
                                        bool %192 = OpFOrdEqual %191 %186 
                                                      OpStore %188 %192 
                                                      OpSelectionMerge %195 None 
                                                      OpBranchConditional %193 %194 %195 
                                             %194 = OpLabel 
                                        bool %196 = OpLoad %188 
                                                      OpSelectionMerge %198 None 
                                                      OpBranchConditional %196 %197 %198 
                                             %197 = OpLabel 
                                                      OpBranch %198 
                                             %198 = OpLabel 
                                                      OpBranch %195 
                                             %195 = OpLabel 
                                                      OpSelectionMerge %201 None 
                                                      OpBranchConditional %199 %200 %285 
                                             %200 = OpLabel 
                                Uniform f32* %203 = OpAccessChain %78 %189 %139 
                                         f32 %204 = OpLoad %203 
                                        bool %205 = OpFOrdEqual %204 %186 
                                                      OpStore %202 %205 
                                       f32_3 %206 = OpLoad %124 
                                       f32_3 %207 = OpVectorShuffle %206 %206 1 1 1 
                              Uniform f32_4* %209 = OpAccessChain %78 %208 %114 
                                       f32_4 %210 = OpLoad %209 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                                       f32_3 %212 = OpFMul %207 %211 
                                                      OpStore %131 %212 
                              Uniform f32_4* %213 = OpAccessChain %78 %208 %113 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpLoad %124 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 0 0 
                                       f32_3 %218 = OpFMul %215 %217 
                                       f32_3 %219 = OpLoad %131 
                                       f32_3 %220 = OpFAdd %218 %219 
                                                      OpStore %131 %220 
                              Uniform f32_4* %221 = OpAccessChain %78 %208 %141 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                       f32_3 %224 = OpLoad %124 
                                       f32_3 %225 = OpVectorShuffle %224 %224 2 2 2 
                                       f32_3 %226 = OpFMul %223 %225 
                                       f32_3 %227 = OpLoad %131 
                                       f32_3 %228 = OpFAdd %226 %227 
                                                      OpStore %131 %228 
                                       f32_3 %229 = OpLoad %131 
                              Uniform f32_4* %230 = OpAccessChain %78 %208 %150 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpFAdd %229 %232 
                                                      OpStore %131 %233 
                                        bool %237 = OpLoad %202 
                                                      OpSelectionMerge %239 None 
                                                      OpBranchConditional %237 %238 %241 
                                             %238 = OpLabel 
                                       f32_3 %240 = OpLoad %131 
                                                      OpStore %236 %240 
                                                      OpBranch %239 
                                             %241 = OpLabel 
                                       f32_3 %242 = OpLoad %124 
                                                      OpStore %236 %242 
                                                      OpBranch %239 
                                             %239 = OpLabel 
                                       f32_3 %243 = OpLoad %236 
                                                      OpStore %234 %243 
                                       f32_3 %244 = OpLoad %234 
                              Uniform f32_3* %246 = OpAccessChain %78 %245 
                                       f32_3 %247 = OpLoad %246 
                                       f32_3 %248 = OpFNegate %247 
                                       f32_3 %249 = OpFAdd %244 %248 
                                                      OpStore %234 %249 
                                       f32_3 %251 = OpLoad %234 
                              Uniform f32_3* %253 = OpAccessChain %78 %252 
                                       f32_3 %254 = OpLoad %253 
                                       f32_3 %255 = OpFMul %251 %254 
                                       f32_4 %256 = OpLoad %250 
                                       f32_4 %257 = OpVectorShuffle %256 %255 0 4 5 6 
                                                      OpStore %250 %257 
                                Private f32* %258 = OpAccessChain %250 %139 
                                         f32 %259 = OpLoad %258 
                                         f32 %261 = OpFMul %259 %260 
                                         f32 %263 = OpFAdd %261 %262 
                                Private f32* %264 = OpAccessChain %234 %30 
                                                      OpStore %264 %263 
                                Uniform f32* %266 = OpAccessChain %78 %189 %133 
                                         f32 %267 = OpLoad %266 
                                         f32 %269 = OpFMul %267 %268 
                                         f32 %270 = OpFAdd %269 %262 
                                                      OpStore %265 %270 
                                         f32 %271 = OpLoad %265 
                                Private f32* %272 = OpAccessChain %234 %30 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpExtInst %1 40 %271 %273 
                                Private f32* %275 = OpAccessChain %250 %30 
                                                      OpStore %275 %274 
                  read_only Texture3DSampled %280 = OpLoad %279 
                                       f32_4 %281 = OpLoad %250 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 2 3 
                                       f32_4 %283 = OpImageSampleImplicitLod %280 %282 
                                                      OpStore %250 %283 
                                       f32_4 %284 = OpLoad %250 
                                                      OpStore %20 %284 
                                                      OpBranch %201 
                                             %285 = OpLabel 
                                Private f32* %286 = OpAccessChain %20 %30 
                                                      OpStore %286 %186 
                                Private f32* %287 = OpAccessChain %20 %139 
                                                      OpStore %287 %186 
                                Private f32* %288 = OpAccessChain %20 %133 
                                                      OpStore %288 %186 
                                Private f32* %289 = OpAccessChain %20 %96 
                                                      OpStore %289 %186 
                                                      OpBranch %201 
                                             %201 = OpLabel 
                                       f32_4 %291 = OpLoad %20 
                              Uniform f32_4* %292 = OpAccessChain %78 %114 
                                       f32_4 %293 = OpLoad %292 
                                         f32 %294 = OpDot %291 %293 
                                Private f32* %295 = OpAccessChain %290 %30 
                                                      OpStore %295 %294 
                                Private f32* %296 = OpAccessChain %290 %30 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpExtInst %1 43 %297 %110 %186 
                                Private f32* %299 = OpAccessChain %290 %30 
                                                      OpStore %299 %298 
                                       f32_4 %301 = OpLoad %300 
                                       f32_2 %302 = OpVectorShuffle %301 %301 0 1 
                                       f32_4 %303 = OpLoad %300 
                                       f32_2 %304 = OpVectorShuffle %303 %303 3 3 
                                       f32_2 %305 = OpFDiv %302 %304 
                                       f32_3 %306 = OpLoad %234 
                                       f32_3 %307 = OpVectorShuffle %306 %305 3 4 2 
                                                      OpStore %234 %307 
                  read_only Texture2DSampled %310 = OpLoad %309 
                                       f32_3 %311 = OpLoad %234 
                                       f32_2 %312 = OpVectorShuffle %311 %311 0 1 
                                       f32_4 %313 = OpImageSampleImplicitLod %310 %312 
                                         f32 %314 = OpCompositeExtract %313 0 
                                                      OpStore %308 %314 
                                         f32 %316 = OpLoad %145 
                                         f32 %317 = OpLoad %308 
                                         f32 %318 = OpFAdd %316 %317 
                                Private f32* %319 = OpAccessChain %315 %30 
                                                      OpStore %319 %318 
                                Private f32* %320 = OpAccessChain %315 %30 
                                         f32 %321 = OpLoad %320 
                                         f32 %322 = OpExtInst %1 43 %321 %110 %186 
                                Private f32* %323 = OpAccessChain %315 %30 
                                                      OpStore %323 %322 
                                Private f32* %324 = OpAccessChain %315 %30 
                                         f32 %325 = OpLoad %324 
                                Private f32* %326 = OpAccessChain %290 %30 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpExtInst %1 37 %325 %327 
                                Private f32* %329 = OpAccessChain %290 %30 
                                                      OpStore %329 %328 
                                        bool %332 = OpLoad %188 
                                                      OpSelectionMerge %334 None 
                                                      OpBranchConditional %332 %333 %337 
                                             %333 = OpLabel 
                                Private f32* %335 = OpAccessChain %290 %30 
                                         f32 %336 = OpLoad %335 
                                                      OpStore %331 %336 
                                                      OpBranch %334 
                                             %337 = OpLabel 
                                Private f32* %338 = OpAccessChain %315 %30 
                                         f32 %339 = OpLoad %338 
                                                      OpStore %331 %339 
                                                      OpBranch %334 
                                             %334 = OpLabel 
                                         f32 %340 = OpLoad %331 
                                Private f32* %341 = OpAccessChain %290 %30 
                                                      OpStore %341 %340 
                                       f32_3 %342 = OpLoad %53 
                              Uniform f32_4* %344 = OpAccessChain %78 %343 
                                       f32_4 %345 = OpLoad %344 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_3 %347 = OpFMul %342 %346 
                                                      OpStore %315 %347 
                                       f32_3 %348 = OpLoad %290 
                                       f32_3 %349 = OpVectorShuffle %348 %348 0 0 0 
                                       f32_3 %350 = OpLoad %315 
                                       f32_3 %351 = OpFMul %349 %350 
                                                      OpStore %290 %351 
                                       f32_3 %352 = OpLoad %53 
                                       f32_3 %354 = OpLoad %353 
                                       f32_3 %355 = OpFMul %352 %354 
                                       f32_3 %356 = OpLoad %290 
                                       f32_3 %357 = OpFAdd %355 %356 
                                                      OpStore %290 %357 
                                Private f32* %360 = OpAccessChain %9 %96 
                                         f32 %361 = OpLoad %360 
                                 Output f32* %363 = OpAccessChain %359 %96 
                                                      OpStore %363 %361 
                                Uniform f32* %365 = OpAccessChain %78 %364 
                                         f32 %366 = OpLoad %365 
                                       f32_3 %367 = OpCompositeConstruct %366 %366 %366 
                                       f32_3 %368 = OpLoad %71 
                                       f32_3 %369 = OpFMul %367 %368 
                                       f32_3 %370 = OpLoad %290 
                                       f32_3 %371 = OpFAdd %369 %370 
                                       f32_4 %372 = OpLoad %359 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %359 %373 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
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
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat21;
float u_xlat23;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat21 = u_xlat2.y * u_xlat2.y;
    u_xlat21 = u_xlat2.x * u_xlat2.x + (-u_xlat21);
    u_xlat3 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat3);
    u_xlat4.y = dot(unity_SHBg, u_xlat3);
    u_xlat4.z = dot(unity_SHBb, u_xlat3);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat21) + u_xlat4.xyz;
    u_xlat2.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat2);
    u_xlat4.y = dot(unity_SHAg, u_xlat2);
    u_xlat4.z = dot(unity_SHAb, u_xlat2);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat6 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat6 * u_xlat2.xxxx + u_xlat5;
    u_xlat2 = u_xlat0 * u_xlat2.zzzz + u_xlat5;
    u_xlat4 = u_xlat6 * u_xlat6 + u_xlat4;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat4;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat4 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat4;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
in  vec3 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat6;
vec3 u_xlat8;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat6.x = u_xlat1.x * u_xlat1.x;
    u_xlat6.x = u_xlat1.x * u_xlat6.x;
    u_xlat1.x = u_xlat1.x * u_xlat6.x;
    u_xlat6.xyz = u_xlat0.xyz + (-vs_COLOR0.xyz);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat6.xyz + vs_COLOR0.xyz;
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat16 = u_xlat0.w + (-_Cutoff);
    u_xlatb16 = u_xlat16<0.0;
    if((int(u_xlatb16) * int(0xffffffffu))!=0){discard;}
    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat17 = sqrt(u_xlat17);
    u_xlat17 = (-u_xlat16) + u_xlat17;
    u_xlat16 = unity_ShadowFadeCenterAndType.w * u_xlat17 + u_xlat16;
    u_xlat16 = u_xlat16 * _LightShadowData.z + _LightShadowData.w;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb3 = unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat8.xyz;
        u_xlat8.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb3)) ? u_xlat8.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat8.x = u_xlat3.y * 0.25 + 0.75;
        u_xlat4.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat8.x, u_xlat4.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat3.x = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat8.xy);
    u_xlat16 = u_xlat16 + u_xlat10_4.x;
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat3.x = min(u_xlat16, u_xlat3.x);
    u_xlat16 = (u_xlatb17) ? u_xlat3.x : u_xlat16;
    u_xlat3.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat3;
    SV_Target0.xyz = vec3(_EmissivePower) * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 424
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %98 %99 %113 %152 %155 %158 %159 %161 %384 %405 %417 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
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
                                                      OpMemberDecorate %21 12 RelaxedPrecision 
                                                      OpMemberDecorate %21 12 Offset 21 
                                                      OpMemberDecorate %21 13 Offset 21 
                                                      OpMemberDecorate %21 14 Offset 21 
                                                      OpMemberDecorate %21 15 Offset 21 
                                                      OpMemberDecorate %21 16 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %113 Location 113 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %155 Location 155 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %159 Location 159 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %161 Location 161 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %358 RelaxedPrecision 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %384 Location 384 
                                                      OpDecorate %405 Location 405 
                                                      OpDecorate %417 Location 417 
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
                                              %21 = OpTypeStruct %7 %7 %7 %7 %7 %16 %7 %7 %7 %7 %7 %7 %7 %18 %19 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 13 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 0 
                                          i32 %39 = OpConstant 2 
                               Private f32_4* %47 = OpVariable Private 
                                          i32 %49 = OpConstant 3 
                               Private f32_4* %60 = OpVariable Private 
                                          i32 %63 = OpConstant 15 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                              %94 = OpTypePointer Output %7 
                                              %96 = OpTypeVector %6 2 
                                              %97 = OpTypePointer Output %96 
                                Output f32_2* %98 = OpVariable Output 
                                 Input f32_4* %99 = OpVariable Input 
                                         i32 %102 = OpConstant 16 
                                             %111 = OpTypeVector %6 3 
                                             %112 = OpTypePointer Input %111 
                                Input f32_3* %113 = OpVariable Input 
                                         i32 %115 = OpConstant 14 
                                         u32 %120 = OpConstant 0 
                                             %121 = OpTypePointer Private %6 
                                         u32 %134 = OpConstant 2 
                                Private f32* %136 = OpVariable Private 
                                             %151 = OpTypePointer Output %111 
                               Output f32_3* %152 = OpVariable Output 
                               Output f32_3* %155 = OpVariable Output 
                               Output f32_4* %158 = OpVariable Output 
                                Input f32_4* %159 = OpVariable Input 
                               Output f32_4* %161 = OpVariable Output 
                                             %163 = OpTypePointer Private %111 
                              Private f32_3* %164 = OpVariable Private 
                              Private f32_4* %181 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         i32 %188 = OpConstant 9 
                                         i32 %194 = OpConstant 10 
                                         i32 %200 = OpConstant 11 
                                         i32 %206 = OpConstant 12 
                                         f32 %215 = OpConstant 3.67402E-40 
                                         u32 %216 = OpConstant 3 
                                         i32 %218 = OpConstant 6 
                                         i32 %224 = OpConstant 7 
                                         i32 %230 = OpConstant 8 
                                         f32 %241 = OpConstant 3.67402E-40 
                                       f32_3 %242 = OpConstantComposite %241 %241 %241 
                              Private f32_3* %244 = OpVariable Private 
                                         f32 %248 = OpConstant 3.67402E-40 
                                       f32_3 %249 = OpConstantComposite %248 %248 %248 
                                         f32 %254 = OpConstant 3.67402E-40 
                                       f32_3 %255 = OpConstantComposite %254 %254 %254 
                                         f32 %257 = OpConstant 3.67402E-40 
                                       f32_3 %258 = OpConstantComposite %257 %257 %257 
                              Private f32_4* %262 = OpVariable Private 
                              Private f32_4* %269 = OpVariable Private 
                              Private f32_4* %277 = OpVariable Private 
                                         f32 %313 = OpConstant 3.67402E-40 
                                       f32_4 %314 = OpConstantComposite %313 %313 %313 %313 
                                         i32 %319 = OpConstant 4 
                                       f32_4 %323 = OpConstantComposite %215 %215 %215 %215 
                                       f32_4 %331 = OpConstantComposite %241 %241 %241 %241 
                                         i32 %338 = OpConstant 5 
                               Output f32_3* %384 = OpVariable Output 
                                             %389 = OpTypePointer Uniform %6 
                                         f32 %396 = OpConstant 3.67402E-40 
                                       f32_2 %401 = OpConstantComposite %396 %396 
                               Output f32_4* %405 = OpVariable Output 
                               Output f32_4* %417 = OpVariable Output 
                                             %418 = OpTypePointer Output %6 
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
                               Uniform f32_4* %53 = OpAccessChain %23 %25 %49 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %11 
                                        f32_4 %56 = OpVectorShuffle %55 %55 3 3 3 3 
                                        f32_4 %57 = OpFMul %54 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpFAdd %57 %58 
                                                      OpStore %9 %59 
                                        f32_4 %61 = OpLoad %47 
                                        f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %23 %63 %26 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %62 %65 
                                                      OpStore %60 %66 
                               Uniform f32_4* %67 = OpAccessChain %23 %63 %31 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %47 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %60 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %60 %73 
                               Uniform f32_4* %74 = OpAccessChain %23 %63 %39 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %60 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %60 %80 
                               Uniform f32_4* %81 = OpAccessChain %23 %63 %49 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %47 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %60 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %47 %87 
                                        f32_4 %93 = OpLoad %47 
                                Output f32_4* %95 = OpAccessChain %92 %31 
                                                      OpStore %95 %93 
                                       f32_4 %100 = OpLoad %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                              Uniform f32_4* %103 = OpAccessChain %23 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %101 %105 
                              Uniform f32_4* %107 = OpAccessChain %23 %102 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 3 
                                       f32_2 %110 = OpFAdd %106 %109 
                                                      OpStore %98 %110 
                                       f32_3 %114 = OpLoad %113 
                              Uniform f32_4* %116 = OpAccessChain %23 %115 %31 
                                       f32_4 %117 = OpLoad %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                         f32 %119 = OpDot %114 %118 
                                Private f32* %122 = OpAccessChain %60 %120 
                                                      OpStore %122 %119 
                                       f32_3 %123 = OpLoad %113 
                              Uniform f32_4* %124 = OpAccessChain %23 %115 %26 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                         f32 %127 = OpDot %123 %126 
                                Private f32* %128 = OpAccessChain %60 %88 
                                                      OpStore %128 %127 
                                       f32_3 %129 = OpLoad %113 
                              Uniform f32_4* %130 = OpAccessChain %23 %115 %39 
                                       f32_4 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                         f32 %133 = OpDot %129 %132 
                                Private f32* %135 = OpAccessChain %60 %134 
                                                      OpStore %135 %133 
                                       f32_4 %137 = OpLoad %60 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_4 %139 = OpLoad %60 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                         f32 %141 = OpDot %138 %140 
                                                      OpStore %136 %141 
                                         f32 %142 = OpLoad %136 
                                         f32 %143 = OpExtInst %1 32 %142 
                                                      OpStore %136 %143 
                                         f32 %144 = OpLoad %136 
                                       f32_3 %145 = OpCompositeConstruct %144 %144 %144 
                                       f32_4 %146 = OpLoad %60 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %60 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %60 %150 
                                       f32_4 %153 = OpLoad %60 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                                      OpStore %152 %154 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                                      OpStore %155 %157 
                                       f32_4 %160 = OpLoad %159 
                                                      OpStore %158 %160 
                                       f32_4 %162 = OpLoad %9 
                                                      OpStore %161 %162 
                                Private f32* %165 = OpAccessChain %60 %88 
                                         f32 %166 = OpLoad %165 
                                Private f32* %167 = OpAccessChain %60 %88 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFMul %166 %168 
                                Private f32* %170 = OpAccessChain %164 %120 
                                                      OpStore %170 %169 
                                Private f32* %171 = OpAccessChain %60 %120 
                                         f32 %172 = OpLoad %171 
                                Private f32* %173 = OpAccessChain %60 %120 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFMul %172 %174 
                                Private f32* %176 = OpAccessChain %164 %120 
                                         f32 %177 = OpLoad %176 
                                         f32 %178 = OpFNegate %177 
                                         f32 %179 = OpFAdd %175 %178 
                                Private f32* %180 = OpAccessChain %164 %120 
                                                      OpStore %180 %179 
                                       f32_4 %182 = OpLoad %60 
                                       f32_4 %183 = OpVectorShuffle %182 %182 1 2 2 0 
                                       f32_4 %184 = OpLoad %60 
                                       f32_4 %185 = OpVectorShuffle %184 %184 0 1 2 2 
                                       f32_4 %186 = OpFMul %183 %185 
                                                      OpStore %181 %186 
                              Uniform f32_4* %189 = OpAccessChain %23 %188 
                                       f32_4 %190 = OpLoad %189 
                                       f32_4 %191 = OpLoad %181 
                                         f32 %192 = OpDot %190 %191 
                                Private f32* %193 = OpAccessChain %187 %120 
                                                      OpStore %193 %192 
                              Uniform f32_4* %195 = OpAccessChain %23 %194 
                                       f32_4 %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %181 
                                         f32 %198 = OpDot %196 %197 
                                Private f32* %199 = OpAccessChain %187 %88 
                                                      OpStore %199 %198 
                              Uniform f32_4* %201 = OpAccessChain %23 %200 
                                       f32_4 %202 = OpLoad %201 
                                       f32_4 %203 = OpLoad %181 
                                         f32 %204 = OpDot %202 %203 
                                Private f32* %205 = OpAccessChain %187 %134 
                                                      OpStore %205 %204 
                              Uniform f32_4* %207 = OpAccessChain %23 %206 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                       f32_3 %210 = OpLoad %164 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 0 0 
                                       f32_3 %212 = OpFMul %209 %211 
                                       f32_3 %213 = OpLoad %187 
                                       f32_3 %214 = OpFAdd %212 %213 
                                                      OpStore %164 %214 
                                Private f32* %217 = OpAccessChain %60 %216 
                                                      OpStore %217 %215 
                              Uniform f32_4* %219 = OpAccessChain %23 %218 
                                       f32_4 %220 = OpLoad %219 
                                       f32_4 %221 = OpLoad %60 
                                         f32 %222 = OpDot %220 %221 
                                Private f32* %223 = OpAccessChain %181 %120 
                                                      OpStore %223 %222 
                              Uniform f32_4* %225 = OpAccessChain %23 %224 
                                       f32_4 %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %60 
                                         f32 %228 = OpDot %226 %227 
                                Private f32* %229 = OpAccessChain %181 %88 
                                                      OpStore %229 %228 
                              Uniform f32_4* %231 = OpAccessChain %23 %230 
                                       f32_4 %232 = OpLoad %231 
                                       f32_4 %233 = OpLoad %60 
                                         f32 %234 = OpDot %232 %233 
                                Private f32* %235 = OpAccessChain %181 %134 
                                                      OpStore %235 %234 
                                       f32_3 %236 = OpLoad %164 
                                       f32_4 %237 = OpLoad %181 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %239 = OpFAdd %236 %238 
                                                      OpStore %164 %239 
                                       f32_3 %240 = OpLoad %164 
                                       f32_3 %243 = OpExtInst %1 40 %240 %242 
                                                      OpStore %164 %243 
                                       f32_3 %245 = OpLoad %164 
                                       f32_3 %246 = OpExtInst %1 30 %245 
                                                      OpStore %244 %246 
                                       f32_3 %247 = OpLoad %244 
                                       f32_3 %250 = OpFMul %247 %249 
                                                      OpStore %244 %250 
                                       f32_3 %251 = OpLoad %244 
                                       f32_3 %252 = OpExtInst %1 29 %251 
                                                      OpStore %244 %252 
                                       f32_3 %253 = OpLoad %244 
                                       f32_3 %256 = OpFMul %253 %255 
                                       f32_3 %259 = OpFAdd %256 %258 
                                                      OpStore %244 %259 
                                       f32_3 %260 = OpLoad %244 
                                       f32_3 %261 = OpExtInst %1 40 %260 %242 
                                                      OpStore %244 %261 
                                       f32_4 %263 = OpLoad %9 
                                       f32_4 %264 = OpVectorShuffle %263 %263 1 1 1 1 
                                       f32_4 %265 = OpFNegate %264 
                              Uniform f32_4* %266 = OpAccessChain %23 %39 
                                       f32_4 %267 = OpLoad %266 
                                       f32_4 %268 = OpFAdd %265 %267 
                                                      OpStore %262 %268 
                                       f32_4 %270 = OpLoad %60 
                                       f32_4 %271 = OpVectorShuffle %270 %270 1 1 1 1 
                                       f32_4 %272 = OpLoad %262 
                                       f32_4 %273 = OpFMul %271 %272 
                                                      OpStore %269 %273 
                                       f32_4 %274 = OpLoad %262 
                                       f32_4 %275 = OpLoad %262 
                                       f32_4 %276 = OpFMul %274 %275 
                                                      OpStore %262 %276 
                                       f32_4 %278 = OpLoad %9 
                                       f32_4 %279 = OpVectorShuffle %278 %278 0 0 0 0 
                                       f32_4 %280 = OpFNegate %279 
                              Uniform f32_4* %281 = OpAccessChain %23 %26 
                                       f32_4 %282 = OpLoad %281 
                                       f32_4 %283 = OpFAdd %280 %282 
                                                      OpStore %277 %283 
                                       f32_4 %284 = OpLoad %9 
                                       f32_4 %285 = OpVectorShuffle %284 %284 2 2 2 2 
                                       f32_4 %286 = OpFNegate %285 
                              Uniform f32_4* %287 = OpAccessChain %23 %49 
                                       f32_4 %288 = OpLoad %287 
                                       f32_4 %289 = OpFAdd %286 %288 
                                                      OpStore %9 %289 
                                       f32_4 %290 = OpLoad %277 
                                       f32_4 %291 = OpLoad %60 
                                       f32_4 %292 = OpVectorShuffle %291 %291 0 0 0 0 
                                       f32_4 %293 = OpFMul %290 %292 
                                       f32_4 %294 = OpLoad %269 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %269 %295 
                                       f32_4 %296 = OpLoad %9 
                                       f32_4 %297 = OpLoad %60 
                                       f32_4 %298 = OpVectorShuffle %297 %297 2 2 2 2 
                                       f32_4 %299 = OpFMul %296 %298 
                                       f32_4 %300 = OpLoad %269 
                                       f32_4 %301 = OpFAdd %299 %300 
                                                      OpStore %60 %301 
                                       f32_4 %302 = OpLoad %277 
                                       f32_4 %303 = OpLoad %277 
                                       f32_4 %304 = OpFMul %302 %303 
                                       f32_4 %305 = OpLoad %262 
                                       f32_4 %306 = OpFAdd %304 %305 
                                                      OpStore %262 %306 
                                       f32_4 %307 = OpLoad %9 
                                       f32_4 %308 = OpLoad %9 
                                       f32_4 %309 = OpFMul %307 %308 
                                       f32_4 %310 = OpLoad %262 
                                       f32_4 %311 = OpFAdd %309 %310 
                                                      OpStore %9 %311 
                                       f32_4 %312 = OpLoad %9 
                                       f32_4 %315 = OpExtInst %1 40 %312 %314 
                                                      OpStore %9 %315 
                                       f32_4 %316 = OpLoad %9 
                                       f32_4 %317 = OpExtInst %1 32 %316 
                                                      OpStore %262 %317 
                                       f32_4 %318 = OpLoad %9 
                              Uniform f32_4* %320 = OpAccessChain %23 %319 
                                       f32_4 %321 = OpLoad %320 
                                       f32_4 %322 = OpFMul %318 %321 
                                       f32_4 %324 = OpFAdd %322 %323 
                                                      OpStore %9 %324 
                                       f32_4 %325 = OpLoad %9 
                                       f32_4 %326 = OpFDiv %323 %325 
                                                      OpStore %9 %326 
                                       f32_4 %327 = OpLoad %60 
                                       f32_4 %328 = OpLoad %262 
                                       f32_4 %329 = OpFMul %327 %328 
                                                      OpStore %60 %329 
                                       f32_4 %330 = OpLoad %60 
                                       f32_4 %332 = OpExtInst %1 40 %330 %331 
                                                      OpStore %60 %332 
                                       f32_4 %333 = OpLoad %9 
                                       f32_4 %334 = OpLoad %60 
                                       f32_4 %335 = OpFMul %333 %334 
                                                      OpStore %9 %335 
                                       f32_4 %336 = OpLoad %9 
                                       f32_3 %337 = OpVectorShuffle %336 %336 1 1 1 
                              Uniform f32_4* %339 = OpAccessChain %23 %338 %26 
                                       f32_4 %340 = OpLoad %339 
                                       f32_3 %341 = OpVectorShuffle %340 %340 0 1 2 
                                       f32_3 %342 = OpFMul %337 %341 
                                       f32_4 %343 = OpLoad %60 
                                       f32_4 %344 = OpVectorShuffle %343 %342 4 5 6 3 
                                                      OpStore %60 %344 
                              Uniform f32_4* %345 = OpAccessChain %23 %338 %31 
                                       f32_4 %346 = OpLoad %345 
                                       f32_3 %347 = OpVectorShuffle %346 %346 0 1 2 
                                       f32_4 %348 = OpLoad %9 
                                       f32_3 %349 = OpVectorShuffle %348 %348 0 0 0 
                                       f32_3 %350 = OpFMul %347 %349 
                                       f32_4 %351 = OpLoad %60 
                                       f32_3 %352 = OpVectorShuffle %351 %351 0 1 2 
                                       f32_3 %353 = OpFAdd %350 %352 
                                       f32_4 %354 = OpLoad %60 
                                       f32_4 %355 = OpVectorShuffle %354 %353 4 5 6 3 
                                                      OpStore %60 %355 
                              Uniform f32_4* %356 = OpAccessChain %23 %338 %39 
                                       f32_4 %357 = OpLoad %356 
                                       f32_3 %358 = OpVectorShuffle %357 %357 0 1 2 
                                       f32_4 %359 = OpLoad %9 
                                       f32_3 %360 = OpVectorShuffle %359 %359 2 2 2 
                                       f32_3 %361 = OpFMul %358 %360 
                                       f32_4 %362 = OpLoad %60 
                                       f32_3 %363 = OpVectorShuffle %362 %362 0 1 2 
                                       f32_3 %364 = OpFAdd %361 %363 
                                       f32_4 %365 = OpLoad %9 
                                       f32_4 %366 = OpVectorShuffle %365 %364 4 5 6 3 
                                                      OpStore %9 %366 
                              Uniform f32_4* %367 = OpAccessChain %23 %338 %49 
                                       f32_4 %368 = OpLoad %367 
                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
                                       f32_4 %370 = OpLoad %9 
                                       f32_3 %371 = OpVectorShuffle %370 %370 3 3 3 
                                       f32_3 %372 = OpFMul %369 %371 
                                       f32_4 %373 = OpLoad %9 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                                       f32_3 %375 = OpFAdd %372 %374 
                                       f32_4 %376 = OpLoad %9 
                                       f32_4 %377 = OpVectorShuffle %376 %375 4 5 6 3 
                                                      OpStore %9 %377 
                                       f32_4 %378 = OpLoad %9 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                                       f32_3 %380 = OpLoad %244 
                                       f32_3 %381 = OpFAdd %379 %380 
                                       f32_4 %382 = OpLoad %9 
                                       f32_4 %383 = OpVectorShuffle %382 %381 4 5 6 3 
                                                      OpStore %9 %383 
                                       f32_4 %385 = OpLoad %9 
                                       f32_3 %386 = OpVectorShuffle %385 %385 0 1 2 
                                                      OpStore %384 %386 
                                Private f32* %387 = OpAccessChain %47 %88 
                                         f32 %388 = OpLoad %387 
                                Uniform f32* %390 = OpAccessChain %23 %31 %120 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpFMul %388 %391 
                                Private f32* %393 = OpAccessChain %9 %120 
                                                      OpStore %393 %392 
                                Private f32* %394 = OpAccessChain %9 %120 
                                         f32 %395 = OpLoad %394 
                                         f32 %397 = OpFMul %395 %396 
                                Private f32* %398 = OpAccessChain %9 %216 
                                                      OpStore %398 %397 
                                       f32_4 %399 = OpLoad %47 
                                       f32_2 %400 = OpVectorShuffle %399 %399 0 3 
                                       f32_2 %402 = OpFMul %400 %401 
                                       f32_4 %403 = OpLoad %9 
                                       f32_4 %404 = OpVectorShuffle %403 %402 4 1 5 3 
                                                      OpStore %9 %404 
                                       f32_4 %406 = OpLoad %47 
                                       f32_2 %407 = OpVectorShuffle %406 %406 2 3 
                                       f32_4 %408 = OpLoad %405 
                                       f32_4 %409 = OpVectorShuffle %408 %407 0 1 4 5 
                                                      OpStore %405 %409 
                                       f32_4 %410 = OpLoad %9 
                                       f32_2 %411 = OpVectorShuffle %410 %410 2 2 
                                       f32_4 %412 = OpLoad %9 
                                       f32_2 %413 = OpVectorShuffle %412 %412 0 3 
                                       f32_2 %414 = OpFAdd %411 %413 
                                       f32_4 %415 = OpLoad %405 
                                       f32_4 %416 = OpVectorShuffle %415 %414 4 5 2 3 
                                                      OpStore %405 %416 
                                                      OpStore %417 %331 
                                 Output f32* %419 = OpAccessChain %92 %31 %88 
                                         f32 %420 = OpLoad %419 
                                         f32 %421 = OpFNegate %420 
                                 Output f32* %422 = OpAccessChain %92 %31 %88 
                                                      OpStore %422 %421 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 375
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %57 %124 %300 %353 %359 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %74 ArrayStride 74 
                                                      OpDecorate %75 ArrayStride 75 
                                                      OpMemberDecorate %76 0 Offset 76 
                                                      OpMemberDecorate %76 1 RelaxedPrecision 
                                                      OpMemberDecorate %76 1 Offset 76 
                                                      OpMemberDecorate %76 2 RelaxedPrecision 
                                                      OpMemberDecorate %76 2 Offset 76 
                                                      OpMemberDecorate %76 3 Offset 76 
                                                      OpMemberDecorate %76 4 Offset 76 
                                                      OpMemberDecorate %76 5 Offset 76 
                                                      OpMemberDecorate %76 6 Offset 76 
                                                      OpMemberDecorate %76 7 Offset 76 
                                                      OpMemberDecorate %76 8 Offset 76 
                                                      OpMemberDecorate %76 9 RelaxedPrecision 
                                                      OpMemberDecorate %76 9 Offset 76 
                                                      OpMemberDecorate %76 10 Offset 76 
                                                      OpMemberDecorate %76 11 Offset 76 
                                                      OpMemberDecorate %76 12 RelaxedPrecision 
                                                      OpMemberDecorate %76 12 Offset 76 
                                                      OpDecorate %76 Block 
                                                      OpDecorate %78 DescriptorSet 78 
                                                      OpDecorate %78 Binding 78 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %199 SpecId 199 
                                                      OpDecorate %279 DescriptorSet 279 
                                                      OpDecorate %279 Binding 279 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %300 Location 300 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %309 DescriptorSet 309 
                                                      OpDecorate %309 Binding 309 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %353 Location 353 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %359 Location 359 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                               Private f32_3* %53 = OpVariable Private 
                                              %56 = OpTypePointer Input %7 
                                 Input f32_4* %57 = OpVariable Input 
                               Private f32_3* %71 = OpVariable Private 
                                          u32 %73 = OpConstant 4 
                                              %74 = OpTypeArray %7 %73 
                                              %75 = OpTypeArray %7 %73 
                                              %76 = OpTypeStruct %21 %7 %7 %7 %74 %7 %75 %21 %21 %7 %6 %6 %6 
                                              %77 = OpTypePointer Uniform %76 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32;}* %78 = OpVariable Uniform 
                                              %79 = OpTypeInt 32 1 
                                          i32 %80 = OpConstant 11 
                                              %81 = OpTypePointer Uniform %6 
                                          u32 %96 = OpConstant 3 
                                          i32 %99 = OpConstant 12 
                                             %105 = OpTypeBool 
                                             %106 = OpTypePointer Private %105 
                               Private bool* %107 = OpVariable Private 
                                         f32 %110 = OpConstant 3.67402E-40 
                                         i32 %113 = OpConstant 0 
                                         i32 %114 = OpConstant 1 
                                         i32 %116 = OpConstant -1 
                              Private f32_3* %122 = OpVariable Private 
                                             %123 = OpTypePointer Input %21 
                                Input f32_3* %124 = OpVariable Input 
                                             %127 = OpTypePointer Uniform %21 
                              Private f32_3* %131 = OpVariable Private 
                                         i32 %132 = OpConstant 4 
                                         u32 %133 = OpConstant 2 
                                         u32 %139 = OpConstant 1 
                                         i32 %141 = OpConstant 2 
                                Private f32* %145 = OpVariable Private 
                                         i32 %150 = OpConstant 3 
                                             %151 = OpTypePointer Uniform %7 
                                         f32 %186 = OpConstant 3.67402E-40 
                               Private bool* %188 = OpVariable Private 
                                         i32 %189 = OpConstant 5 
                                        bool %193 = OpConstantFalse 
                                        bool %199 = OpSpecConstantFalse 
                               Private bool* %202 = OpVariable Private 
                                         i32 %208 = OpConstant 6 
                              Private f32_3* %234 = OpVariable Private 
                                             %235 = OpTypePointer Function %21 
                                         i32 %245 = OpConstant 8 
                              Private f32_4* %250 = OpVariable Private 
                                         i32 %252 = OpConstant 7 
                                         f32 %260 = OpConstant 3.67402E-40 
                                         f32 %262 = OpConstant 3.67402E-40 
                                Private f32* %265 = OpVariable Private 
                                         f32 %268 = OpConstant 3.67402E-40 
                                             %276 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %277 = OpTypeSampledImage %276 
                                             %278 = OpTypePointer UniformConstant %277 
 UniformConstant read_only Texture3DSampled* %279 = OpVariable UniformConstant 
                              Private f32_3* %290 = OpVariable Private 
                                Input f32_4* %300 = OpVariable Input 
                                Private f32* %308 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %309 = OpVariable UniformConstant 
                              Private f32_3* %315 = OpVariable Private 
                                             %330 = OpTypePointer Function %6 
                                         i32 %343 = OpConstant 9 
                                Input f32_3* %353 = OpVariable Input 
                                             %358 = OpTypePointer Output %7 
                               Output f32_4* %359 = OpVariable Output 
                                             %362 = OpTypePointer Output %6 
                                         i32 %364 = OpConstant 10 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %236 = OpVariable Function 
                               Function f32* %331 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                 Private f32* %35 = OpAccessChain %20 %30 
                                          f32 %36 = OpLoad %35 
                                 Private f32* %37 = OpAccessChain %20 %30 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFMul %36 %38 
                                 Private f32* %40 = OpAccessChain %34 %30 
                                                      OpStore %40 %39 
                                 Private f32* %41 = OpAccessChain %20 %30 
                                          f32 %42 = OpLoad %41 
                                 Private f32* %43 = OpAccessChain %34 %30 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFMul %42 %44 
                                 Private f32* %46 = OpAccessChain %34 %30 
                                                      OpStore %46 %45 
                                 Private f32* %47 = OpAccessChain %20 %30 
                                          f32 %48 = OpLoad %47 
                                 Private f32* %49 = OpAccessChain %34 %30 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFMul %48 %50 
                                 Private f32* %52 = OpAccessChain %34 %30 
                                                      OpStore %52 %51 
                                        f32_4 %54 = OpLoad %9 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFNegate %59 
                                        f32_3 %61 = OpFAdd %55 %60 
                                                      OpStore %53 %61 
                                        f32_3 %62 = OpLoad %34 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 0 0 
                                        f32_3 %64 = OpLoad %53 
                                        f32_3 %65 = OpFMul %63 %64 
                                        f32_4 %66 = OpLoad %57 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFAdd %65 %67 
                                                      OpStore %53 %68 
                                        f32_3 %69 = OpLoad %53 
                                        f32_3 %70 = OpExtInst %1 30 %69 
                                                      OpStore %34 %70 
                                        f32_3 %72 = OpLoad %34 
                                 Uniform f32* %82 = OpAccessChain %78 %80 
                                          f32 %83 = OpLoad %82 
                                 Uniform f32* %84 = OpAccessChain %78 %80 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %86 = OpAccessChain %78 %80 
                                          f32 %87 = OpLoad %86 
                                        f32_3 %88 = OpCompositeConstruct %83 %85 %87 
                                          f32 %89 = OpCompositeExtract %88 0 
                                          f32 %90 = OpCompositeExtract %88 1 
                                          f32 %91 = OpCompositeExtract %88 2 
                                        f32_3 %92 = OpCompositeConstruct %89 %90 %91 
                                        f32_3 %93 = OpFMul %72 %92 
                                                      OpStore %71 %93 
                                        f32_3 %94 = OpLoad %71 
                                        f32_3 %95 = OpExtInst %1 29 %94 
                                                      OpStore %71 %95 
                                 Private f32* %97 = OpAccessChain %9 %96 
                                          f32 %98 = OpLoad %97 
                                Uniform f32* %100 = OpAccessChain %78 %99 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFNegate %101 
                                         f32 %103 = OpFAdd %98 %102 
                                Private f32* %104 = OpAccessChain %20 %30 
                                                      OpStore %104 %103 
                                Private f32* %108 = OpAccessChain %20 %30 
                                         f32 %109 = OpLoad %108 
                                        bool %111 = OpFOrdLessThan %109 %110 
                                                      OpStore %107 %111 
                                        bool %112 = OpLoad %107 
                                         i32 %115 = OpSelect %112 %114 %113 
                                         i32 %117 = OpIMul %115 %116 
                                        bool %118 = OpINotEqual %117 %113 
                                                      OpSelectionMerge %120 None 
                                                      OpBranchConditional %118 %119 %120 
                                             %119 = OpLabel 
                                                      OpKill
                                             %120 = OpLabel 
                                       f32_3 %125 = OpLoad %124 
                                       f32_3 %126 = OpFNegate %125 
                              Uniform f32_3* %128 = OpAccessChain %78 %113 
                                       f32_3 %129 = OpLoad %128 
                                       f32_3 %130 = OpFAdd %126 %129 
                                                      OpStore %122 %130 
                                Uniform f32* %134 = OpAccessChain %78 %132 %113 %133 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %131 %30 
                                                      OpStore %136 %135 
                                Uniform f32* %137 = OpAccessChain %78 %132 %114 %133 
                                         f32 %138 = OpLoad %137 
                                Private f32* %140 = OpAccessChain %131 %139 
                                                      OpStore %140 %138 
                                Uniform f32* %142 = OpAccessChain %78 %132 %141 %133 
                                         f32 %143 = OpLoad %142 
                                Private f32* %144 = OpAccessChain %131 %133 
                                                      OpStore %144 %143 
                                       f32_3 %146 = OpLoad %122 
                                       f32_3 %147 = OpLoad %131 
                                         f32 %148 = OpDot %146 %147 
                                                      OpStore %145 %148 
                                       f32_3 %149 = OpLoad %124 
                              Uniform f32_4* %152 = OpAccessChain %78 %150 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFNegate %154 
                                       f32_3 %156 = OpFAdd %149 %155 
                                                      OpStore %122 %156 
                                       f32_3 %157 = OpLoad %122 
                                       f32_3 %158 = OpLoad %122 
                                         f32 %159 = OpDot %157 %158 
                                Private f32* %160 = OpAccessChain %122 %30 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %122 %30 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpExtInst %1 31 %162 
                                Private f32* %164 = OpAccessChain %122 %30 
                                                      OpStore %164 %163 
                                         f32 %165 = OpLoad %145 
                                         f32 %166 = OpFNegate %165 
                                Private f32* %167 = OpAccessChain %122 %30 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFAdd %166 %168 
                                Private f32* %170 = OpAccessChain %122 %30 
                                                      OpStore %170 %169 
                                Uniform f32* %171 = OpAccessChain %78 %150 %96 
                                         f32 %172 = OpLoad %171 
                                Private f32* %173 = OpAccessChain %122 %30 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFMul %172 %174 
                                         f32 %176 = OpLoad %145 
                                         f32 %177 = OpFAdd %175 %176 
                                                      OpStore %145 %177 
                                         f32 %178 = OpLoad %145 
                                Uniform f32* %179 = OpAccessChain %78 %141 %133 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFMul %178 %180 
                                Uniform f32* %182 = OpAccessChain %78 %141 %96 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpFAdd %181 %183 
                                                      OpStore %145 %184 
                                         f32 %185 = OpLoad %145 
                                         f32 %187 = OpExtInst %1 43 %185 %110 %186 
                                                      OpStore %145 %187 
                                Uniform f32* %190 = OpAccessChain %78 %189 %30 
                                         f32 %191 = OpLoad %190 
                                        bool %192 = OpFOrdEqual %191 %186 
                                                      OpStore %188 %192 
                                                      OpSelectionMerge %195 None 
                                                      OpBranchConditional %193 %194 %195 
                                             %194 = OpLabel 
                                        bool %196 = OpLoad %188 
                                                      OpSelectionMerge %198 None 
                                                      OpBranchConditional %196 %197 %198 
                                             %197 = OpLabel 
                                                      OpBranch %198 
                                             %198 = OpLabel 
                                                      OpBranch %195 
                                             %195 = OpLabel 
                                                      OpSelectionMerge %201 None 
                                                      OpBranchConditional %199 %200 %285 
                                             %200 = OpLabel 
                                Uniform f32* %203 = OpAccessChain %78 %189 %139 
                                         f32 %204 = OpLoad %203 
                                        bool %205 = OpFOrdEqual %204 %186 
                                                      OpStore %202 %205 
                                       f32_3 %206 = OpLoad %124 
                                       f32_3 %207 = OpVectorShuffle %206 %206 1 1 1 
                              Uniform f32_4* %209 = OpAccessChain %78 %208 %114 
                                       f32_4 %210 = OpLoad %209 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                                       f32_3 %212 = OpFMul %207 %211 
                                                      OpStore %131 %212 
                              Uniform f32_4* %213 = OpAccessChain %78 %208 %113 
                                       f32_4 %214 = OpLoad %213 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpLoad %124 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 0 0 
                                       f32_3 %218 = OpFMul %215 %217 
                                       f32_3 %219 = OpLoad %131 
                                       f32_3 %220 = OpFAdd %218 %219 
                                                      OpStore %131 %220 
                              Uniform f32_4* %221 = OpAccessChain %78 %208 %141 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                       f32_3 %224 = OpLoad %124 
                                       f32_3 %225 = OpVectorShuffle %224 %224 2 2 2 
                                       f32_3 %226 = OpFMul %223 %225 
                                       f32_3 %227 = OpLoad %131 
                                       f32_3 %228 = OpFAdd %226 %227 
                                                      OpStore %131 %228 
                                       f32_3 %229 = OpLoad %131 
                              Uniform f32_4* %230 = OpAccessChain %78 %208 %150 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpFAdd %229 %232 
                                                      OpStore %131 %233 
                                        bool %237 = OpLoad %202 
                                                      OpSelectionMerge %239 None 
                                                      OpBranchConditional %237 %238 %241 
                                             %238 = OpLabel 
                                       f32_3 %240 = OpLoad %131 
                                                      OpStore %236 %240 
                                                      OpBranch %239 
                                             %241 = OpLabel 
                                       f32_3 %242 = OpLoad %124 
                                                      OpStore %236 %242 
                                                      OpBranch %239 
                                             %239 = OpLabel 
                                       f32_3 %243 = OpLoad %236 
                                                      OpStore %234 %243 
                                       f32_3 %244 = OpLoad %234 
                              Uniform f32_3* %246 = OpAccessChain %78 %245 
                                       f32_3 %247 = OpLoad %246 
                                       f32_3 %248 = OpFNegate %247 
                                       f32_3 %249 = OpFAdd %244 %248 
                                                      OpStore %234 %249 
                                       f32_3 %251 = OpLoad %234 
                              Uniform f32_3* %253 = OpAccessChain %78 %252 
                                       f32_3 %254 = OpLoad %253 
                                       f32_3 %255 = OpFMul %251 %254 
                                       f32_4 %256 = OpLoad %250 
                                       f32_4 %257 = OpVectorShuffle %256 %255 0 4 5 6 
                                                      OpStore %250 %257 
                                Private f32* %258 = OpAccessChain %250 %139 
                                         f32 %259 = OpLoad %258 
                                         f32 %261 = OpFMul %259 %260 
                                         f32 %263 = OpFAdd %261 %262 
                                Private f32* %264 = OpAccessChain %234 %30 
                                                      OpStore %264 %263 
                                Uniform f32* %266 = OpAccessChain %78 %189 %133 
                                         f32 %267 = OpLoad %266 
                                         f32 %269 = OpFMul %267 %268 
                                         f32 %270 = OpFAdd %269 %262 
                                                      OpStore %265 %270 
                                         f32 %271 = OpLoad %265 
                                Private f32* %272 = OpAccessChain %234 %30 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpExtInst %1 40 %271 %273 
                                Private f32* %275 = OpAccessChain %250 %30 
                                                      OpStore %275 %274 
                  read_only Texture3DSampled %280 = OpLoad %279 
                                       f32_4 %281 = OpLoad %250 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 2 3 
                                       f32_4 %283 = OpImageSampleImplicitLod %280 %282 
                                                      OpStore %250 %283 
                                       f32_4 %284 = OpLoad %250 
                                                      OpStore %20 %284 
                                                      OpBranch %201 
                                             %285 = OpLabel 
                                Private f32* %286 = OpAccessChain %20 %30 
                                                      OpStore %286 %186 
                                Private f32* %287 = OpAccessChain %20 %139 
                                                      OpStore %287 %186 
                                Private f32* %288 = OpAccessChain %20 %133 
                                                      OpStore %288 %186 
                                Private f32* %289 = OpAccessChain %20 %96 
                                                      OpStore %289 %186 
                                                      OpBranch %201 
                                             %201 = OpLabel 
                                       f32_4 %291 = OpLoad %20 
                              Uniform f32_4* %292 = OpAccessChain %78 %114 
                                       f32_4 %293 = OpLoad %292 
                                         f32 %294 = OpDot %291 %293 
                                Private f32* %295 = OpAccessChain %290 %30 
                                                      OpStore %295 %294 
                                Private f32* %296 = OpAccessChain %290 %30 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpExtInst %1 43 %297 %110 %186 
                                Private f32* %299 = OpAccessChain %290 %30 
                                                      OpStore %299 %298 
                                       f32_4 %301 = OpLoad %300 
                                       f32_2 %302 = OpVectorShuffle %301 %301 0 1 
                                       f32_4 %303 = OpLoad %300 
                                       f32_2 %304 = OpVectorShuffle %303 %303 3 3 
                                       f32_2 %305 = OpFDiv %302 %304 
                                       f32_3 %306 = OpLoad %234 
                                       f32_3 %307 = OpVectorShuffle %306 %305 3 4 2 
                                                      OpStore %234 %307 
                  read_only Texture2DSampled %310 = OpLoad %309 
                                       f32_3 %311 = OpLoad %234 
                                       f32_2 %312 = OpVectorShuffle %311 %311 0 1 
                                       f32_4 %313 = OpImageSampleImplicitLod %310 %312 
                                         f32 %314 = OpCompositeExtract %313 0 
                                                      OpStore %308 %314 
                                         f32 %316 = OpLoad %145 
                                         f32 %317 = OpLoad %308 
                                         f32 %318 = OpFAdd %316 %317 
                                Private f32* %319 = OpAccessChain %315 %30 
                                                      OpStore %319 %318 
                                Private f32* %320 = OpAccessChain %315 %30 
                                         f32 %321 = OpLoad %320 
                                         f32 %322 = OpExtInst %1 43 %321 %110 %186 
                                Private f32* %323 = OpAccessChain %315 %30 
                                                      OpStore %323 %322 
                                Private f32* %324 = OpAccessChain %315 %30 
                                         f32 %325 = OpLoad %324 
                                Private f32* %326 = OpAccessChain %290 %30 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpExtInst %1 37 %325 %327 
                                Private f32* %329 = OpAccessChain %290 %30 
                                                      OpStore %329 %328 
                                        bool %332 = OpLoad %188 
                                                      OpSelectionMerge %334 None 
                                                      OpBranchConditional %332 %333 %337 
                                             %333 = OpLabel 
                                Private f32* %335 = OpAccessChain %290 %30 
                                         f32 %336 = OpLoad %335 
                                                      OpStore %331 %336 
                                                      OpBranch %334 
                                             %337 = OpLabel 
                                Private f32* %338 = OpAccessChain %315 %30 
                                         f32 %339 = OpLoad %338 
                                                      OpStore %331 %339 
                                                      OpBranch %334 
                                             %334 = OpLabel 
                                         f32 %340 = OpLoad %331 
                                Private f32* %341 = OpAccessChain %290 %30 
                                                      OpStore %341 %340 
                                       f32_3 %342 = OpLoad %53 
                              Uniform f32_4* %344 = OpAccessChain %78 %343 
                                       f32_4 %345 = OpLoad %344 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_3 %347 = OpFMul %342 %346 
                                                      OpStore %315 %347 
                                       f32_3 %348 = OpLoad %290 
                                       f32_3 %349 = OpVectorShuffle %348 %348 0 0 0 
                                       f32_3 %350 = OpLoad %315 
                                       f32_3 %351 = OpFMul %349 %350 
                                                      OpStore %290 %351 
                                       f32_3 %352 = OpLoad %53 
                                       f32_3 %354 = OpLoad %353 
                                       f32_3 %355 = OpFMul %352 %354 
                                       f32_3 %356 = OpLoad %290 
                                       f32_3 %357 = OpFAdd %355 %356 
                                                      OpStore %290 %357 
                                Private f32* %360 = OpAccessChain %9 %96 
                                         f32 %361 = OpLoad %360 
                                 Output f32* %363 = OpAccessChain %359 %96 
                                                      OpStore %363 %361 
                                Uniform f32* %365 = OpAccessChain %78 %364 
                                         f32 %366 = OpLoad %365 
                                       f32_3 %367 = OpCompositeConstruct %366 %366 %366 
                                       f32_3 %368 = OpLoad %71 
                                       f32_3 %369 = OpFMul %367 %368 
                                       f32_3 %370 = OpLoad %290 
                                       f32_3 %371 = OpFAdd %369 %370 
                                       f32_4 %372 = OpLoad %359 
                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
                                                      OpStore %359 %373 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
""
}
}
}
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Blend One One, One One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 122432
Program "vp" {
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat16_4;
float u_xlat5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_4 = u_xlat16_1 * u_xlat16_4;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat0.xyz = u_xlat10_0.xyz + (-vs_COLOR0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_1) * u_xlat0.xyz + vs_COLOR0.xyz;
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb10 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb10){
        u_xlatb10 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat10 = u_xlat2.y * 0.25 + 0.75;
        u_xlat5 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat10, u_xlat5);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat10 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat1.xx);
    u_xlat1.x = u_xlat10 * u_xlat10_2.w;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 158
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %150 
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
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %151 RelaxedPrecision 
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
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                               Output f32_4* %149 = OpVariable Output 
                                Input f32_4* %150 = OpVariable Input 
                                             %152 = OpTypePointer Output %6 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                       f32_4 %151 = OpLoad %150 
                                                      OpStore %149 %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                 Output f32* %156 = OpAccessChain %81 %23 %77 
                                                      OpStore %156 %155 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %52 %100 %268 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %52 Location 52 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %68 ArrayStride 68 
                                                      OpDecorate %69 ArrayStride 69 
                                                      OpMemberDecorate %70 0 RelaxedPrecision 
                                                      OpMemberDecorate %70 0 Offset 70 
                                                      OpMemberDecorate %70 1 Offset 70 
                                                      OpMemberDecorate %70 2 Offset 70 
                                                      OpMemberDecorate %70 3 Offset 70 
                                                      OpMemberDecorate %70 4 Offset 70 
                                                      OpMemberDecorate %70 5 RelaxedPrecision 
                                                      OpMemberDecorate %70 5 Offset 70 
                                                      OpMemberDecorate %70 6 Offset 70 
                                                      OpMemberDecorate %70 7 RelaxedPrecision 
                                                      OpMemberDecorate %70 7 Offset 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %72 DescriptorSet 72 
                                                      OpDecorate %72 Binding 72 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %100 Location 100 
                                                      OpDecorate %143 SpecId 143 
                                                      OpDecorate %223 DescriptorSet 223 
                                                      OpDecorate %223 Binding 223 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %248 DescriptorSet 248 
                                                      OpDecorate %248 Binding 248 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %268 Location 268 
                                                      OpDecorate %271 RelaxedPrecision 
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
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                 Private f32* %33 = OpVariable Private 
                                              %47 = OpTypePointer Private %21 
                               Private f32_3* %48 = OpVariable Private 
                                              %51 = OpTypePointer Input %7 
                                 Input f32_4* %52 = OpVariable Input 
                                          u32 %64 = OpConstant 3 
                                          u32 %67 = OpConstant 4 
                                              %68 = OpTypeArray %7 %67 
                                              %69 = OpTypeArray %7 %67 
                                              %70 = OpTypeStruct %7 %7 %68 %21 %21 %7 %69 %6 
                                              %71 = OpTypePointer Uniform %70 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32;}* %72 = OpVariable Uniform 
                                              %73 = OpTypeInt 32 1 
                                          i32 %74 = OpConstant 7 
                                              %75 = OpTypePointer Uniform %6 
                                              %81 = OpTypeBool 
                                              %82 = OpTypePointer Private %81 
                                Private bool* %83 = OpVariable Private 
                                          f32 %86 = OpConstant 3.67402E-40 
                                          i32 %89 = OpConstant 0 
                                          i32 %90 = OpConstant 1 
                                          i32 %92 = OpConstant -1 
                               Private f32_3* %98 = OpVariable Private 
                                              %99 = OpTypePointer Input %21 
                                Input f32_3* %100 = OpVariable Input 
                                         i32 %103 = OpConstant 6 
                                             %104 = OpTypePointer Uniform %7 
                                         i32 %117 = OpConstant 2 
                                         i32 %127 = OpConstant 3 
                               Private bool* %132 = OpVariable Private 
                                         f32 %135 = OpConstant 3.67402E-40 
                                        bool %137 = OpConstantFalse 
                                        bool %143 = OpSpecConstantFalse 
                                         u32 %146 = OpConstant 1 
                              Private f32_3* %150 = OpVariable Private 
                                             %178 = OpTypePointer Function %21 
                                         i32 %188 = OpConstant 4 
                                             %189 = OpTypePointer Uniform %21 
                              Private f32_4* %194 = OpVariable Private 
                                Private f32* %201 = OpVariable Private 
                                         f32 %204 = OpConstant 3.67402E-40 
                                         f32 %206 = OpConstant 3.67402E-40 
                                         u32 %208 = OpConstant 2 
                                         f32 %211 = OpConstant 3.67402E-40 
                                             %220 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %221 = OpTypeSampledImage %220 
                                             %222 = OpTypePointer UniformConstant %221 
 UniformConstant read_only Texture3DSampled* %223 = OpVariable UniformConstant 
                              Private f32_3* %234 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %248 = OpVariable UniformConstant 
                                         i32 %262 = OpConstant 5 
                                             %267 = OpTypePointer Output %7 
                               Output f32_4* %268 = OpVariable Output 
                                             %277 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %179 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                 Private f32* %34 = OpAccessChain %20 %30 
                                          f32 %35 = OpLoad %34 
                                 Private f32* %36 = OpAccessChain %20 %30 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFMul %35 %37 
                                                      OpStore %33 %38 
                                 Private f32* %39 = OpAccessChain %20 %30 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpLoad %33 
                                          f32 %42 = OpFMul %40 %41 
                                                      OpStore %33 %42 
                                 Private f32* %43 = OpAccessChain %20 %30 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpLoad %33 
                                          f32 %46 = OpFMul %44 %45 
                                                      OpStore %33 %46 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpFNegate %54 
                                        f32_3 %56 = OpFAdd %50 %55 
                                                      OpStore %48 %56 
                                          f32 %57 = OpLoad %33 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_3 %59 = OpLoad %48 
                                        f32_3 %60 = OpFMul %58 %59 
                                        f32_4 %61 = OpLoad %52 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                                      OpStore %48 %63 
                                 Private f32* %65 = OpAccessChain %9 %64 
                                          f32 %66 = OpLoad %65 
                                 Uniform f32* %76 = OpAccessChain %72 %74 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpFNegate %77 
                                          f32 %79 = OpFAdd %66 %78 
                                 Private f32* %80 = OpAccessChain %20 %30 
                                                      OpStore %80 %79 
                                 Private f32* %84 = OpAccessChain %20 %30 
                                          f32 %85 = OpLoad %84 
                                         bool %87 = OpFOrdLessThan %85 %86 
                                                      OpStore %83 %87 
                                         bool %88 = OpLoad %83 
                                          i32 %91 = OpSelect %88 %90 %89 
                                          i32 %93 = OpIMul %91 %92 
                                         bool %94 = OpINotEqual %93 %89 
                                                      OpSelectionMerge %96 None 
                                                      OpBranchConditional %94 %95 %96 
                                              %95 = OpLabel 
                                                      OpKill
                                              %96 = OpLabel 
                                       f32_3 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 1 1 1 
                              Uniform f32_4* %105 = OpAccessChain %72 %103 %90 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFMul %102 %107 
                                                      OpStore %98 %108 
                              Uniform f32_4* %109 = OpAccessChain %72 %103 %89 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                       f32_3 %112 = OpLoad %100 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 0 0 
                                       f32_3 %114 = OpFMul %111 %113 
                                       f32_3 %115 = OpLoad %98 
                                       f32_3 %116 = OpFAdd %114 %115 
                                                      OpStore %98 %116 
                              Uniform f32_4* %118 = OpAccessChain %72 %103 %117 
                                       f32_4 %119 = OpLoad %118 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpLoad %100 
                                       f32_3 %122 = OpVectorShuffle %121 %121 2 2 2 
                                       f32_3 %123 = OpFMul %120 %122 
                                       f32_3 %124 = OpLoad %98 
                                       f32_3 %125 = OpFAdd %123 %124 
                                                      OpStore %98 %125 
                                       f32_3 %126 = OpLoad %98 
                              Uniform f32_4* %128 = OpAccessChain %72 %103 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFAdd %126 %130 
                                                      OpStore %98 %131 
                                Uniform f32* %133 = OpAccessChain %72 %90 %30 
                                         f32 %134 = OpLoad %133 
                                        bool %136 = OpFOrdEqual %134 %135 
                                                      OpStore %132 %136 
                                                      OpSelectionMerge %139 None 
                                                      OpBranchConditional %137 %138 %139 
                                             %138 = OpLabel 
                                        bool %140 = OpLoad %132 
                                                      OpSelectionMerge %142 None 
                                                      OpBranchConditional %140 %141 %142 
                                             %141 = OpLabel 
                                                      OpBranch %142 
                                             %142 = OpLabel 
                                                      OpBranch %139 
                                             %139 = OpLabel 
                                                      OpSelectionMerge %145 None 
                                                      OpBranchConditional %143 %144 %229 
                                             %144 = OpLabel 
                                Uniform f32* %147 = OpAccessChain %72 %90 %146 
                                         f32 %148 = OpLoad %147 
                                        bool %149 = OpFOrdEqual %148 %135 
                                                      OpStore %132 %149 
                                       f32_3 %151 = OpLoad %100 
                                       f32_3 %152 = OpVectorShuffle %151 %151 1 1 1 
                              Uniform f32_4* %153 = OpAccessChain %72 %117 %90 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpFMul %152 %155 
                                                      OpStore %150 %156 
                              Uniform f32_4* %157 = OpAccessChain %72 %117 %89 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpLoad %100 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 0 0 
                                       f32_3 %162 = OpFMul %159 %161 
                                       f32_3 %163 = OpLoad %150 
                                       f32_3 %164 = OpFAdd %162 %163 
                                                      OpStore %150 %164 
                              Uniform f32_4* %165 = OpAccessChain %72 %117 %117 
                                       f32_4 %166 = OpLoad %165 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_3 %168 = OpLoad %100 
                                       f32_3 %169 = OpVectorShuffle %168 %168 2 2 2 
                                       f32_3 %170 = OpFMul %167 %169 
                                       f32_3 %171 = OpLoad %150 
                                       f32_3 %172 = OpFAdd %170 %171 
                                                      OpStore %150 %172 
                                       f32_3 %173 = OpLoad %150 
                              Uniform f32_4* %174 = OpAccessChain %72 %117 %127 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFAdd %173 %176 
                                                      OpStore %150 %177 
                                        bool %180 = OpLoad %132 
                                                      OpSelectionMerge %182 None 
                                                      OpBranchConditional %180 %181 %184 
                                             %181 = OpLabel 
                                       f32_3 %183 = OpLoad %150 
                                                      OpStore %179 %183 
                                                      OpBranch %182 
                                             %184 = OpLabel 
                                       f32_3 %185 = OpLoad %100 
                                                      OpStore %179 %185 
                                                      OpBranch %182 
                                             %182 = OpLabel 
                                       f32_3 %186 = OpLoad %179 
                                                      OpStore %150 %186 
                                       f32_3 %187 = OpLoad %150 
                              Uniform f32_3* %190 = OpAccessChain %72 %188 
                                       f32_3 %191 = OpLoad %190 
                                       f32_3 %192 = OpFNegate %191 
                                       f32_3 %193 = OpFAdd %187 %192 
                                                      OpStore %150 %193 
                                       f32_3 %195 = OpLoad %150 
                              Uniform f32_3* %196 = OpAccessChain %72 %127 
                                       f32_3 %197 = OpLoad %196 
                                       f32_3 %198 = OpFMul %195 %197 
                                       f32_4 %199 = OpLoad %194 
                                       f32_4 %200 = OpVectorShuffle %199 %198 0 4 5 6 
                                                      OpStore %194 %200 
                                Private f32* %202 = OpAccessChain %194 %146 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %207 = OpFAdd %205 %206 
                                                      OpStore %201 %207 
                                Uniform f32* %209 = OpAccessChain %72 %90 %208 
                                         f32 %210 = OpLoad %209 
                                         f32 %212 = OpFMul %210 %211 
                                         f32 %213 = OpFAdd %212 %206 
                                Private f32* %214 = OpAccessChain %150 %30 
                                                      OpStore %214 %213 
                                         f32 %215 = OpLoad %201 
                                Private f32* %216 = OpAccessChain %150 %30 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpExtInst %1 40 %215 %217 
                                Private f32* %219 = OpAccessChain %194 %30 
                                                      OpStore %219 %218 
                  read_only Texture3DSampled %224 = OpLoad %223 
                                       f32_4 %225 = OpLoad %194 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 2 3 
                                       f32_4 %227 = OpImageSampleImplicitLod %224 %226 
                                                      OpStore %194 %227 
                                       f32_4 %228 = OpLoad %194 
                                                      OpStore %20 %228 
                                                      OpBranch %145 
                                             %229 = OpLabel 
                                Private f32* %230 = OpAccessChain %20 %30 
                                                      OpStore %230 %135 
                                Private f32* %231 = OpAccessChain %20 %146 
                                                      OpStore %231 %135 
                                Private f32* %232 = OpAccessChain %20 %208 
                                                      OpStore %232 %135 
                                Private f32* %233 = OpAccessChain %20 %64 
                                                      OpStore %233 %135 
                                                      OpBranch %145 
                                             %145 = OpLabel 
                                       f32_4 %235 = OpLoad %20 
                              Uniform f32_4* %236 = OpAccessChain %72 %89 
                                       f32_4 %237 = OpLoad %236 
                                         f32 %238 = OpDot %235 %237 
                                Private f32* %239 = OpAccessChain %234 %30 
                                                      OpStore %239 %238 
                                Private f32* %240 = OpAccessChain %234 %30 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpExtInst %1 43 %241 %86 %135 
                                Private f32* %243 = OpAccessChain %234 %30 
                                                      OpStore %243 %242 
                                       f32_3 %244 = OpLoad %98 
                                       f32_3 %245 = OpLoad %98 
                                         f32 %246 = OpDot %244 %245 
                                Private f32* %247 = OpAccessChain %98 %30 
                                                      OpStore %247 %246 
                  read_only Texture2DSampled %249 = OpLoad %248 
                                       f32_3 %250 = OpLoad %98 
                                       f32_2 %251 = OpVectorShuffle %250 %250 0 0 
                                       f32_4 %252 = OpImageSampleImplicitLod %249 %251 
                                         f32 %253 = OpCompositeExtract %252 3 
                                Private f32* %254 = OpAccessChain %98 %30 
                                                      OpStore %254 %253 
                                Private f32* %255 = OpAccessChain %234 %30 
                                         f32 %256 = OpLoad %255 
                                Private f32* %257 = OpAccessChain %98 %30 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpFMul %256 %258 
                                Private f32* %260 = OpAccessChain %98 %30 
                                                      OpStore %260 %259 
                                       f32_3 %261 = OpLoad %48 
                              Uniform f32_4* %263 = OpAccessChain %72 %262 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                                       f32_3 %266 = OpFMul %261 %265 
                                                      OpStore %234 %266 
                                       f32_3 %269 = OpLoad %98 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 0 0 
                                       f32_3 %271 = OpLoad %234 
                                       f32_3 %272 = OpFMul %270 %271 
                                       f32_4 %273 = OpLoad %268 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 6 3 
                                                      OpStore %268 %274 
                                Private f32* %275 = OpAccessChain %9 %64 
                                         f32 %276 = OpLoad %275 
                                 Output f32* %278 = OpAccessChain %268 %64 
                                                      OpStore %278 %276 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
float u_xlat16_1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_4 = u_xlat16_1 * u_xlat16_4;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat0.xyz = u_xlat10_0.xyz + (-vs_COLOR0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_1) * u_xlat0.xyz + vs_COLOR0.xyz;
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
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
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 158
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %150 
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
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %151 RelaxedPrecision 
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
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                               Output f32_4* %149 = OpVariable Output 
                                Input f32_4* %150 = OpVariable Input 
                                             %152 = OpTypePointer Output %6 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                       f32_4 %151 = OpLoad %150 
                                                      OpStore %149 %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                 Output f32* %156 = OpAccessChain %81 %23 %77 
                                                      OpStore %156 %155 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 232
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %52 %116 %220 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %52 Location 52 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %68 ArrayStride 68 
                                                      OpMemberDecorate %69 0 RelaxedPrecision 
                                                      OpMemberDecorate %69 0 Offset 69 
                                                      OpMemberDecorate %69 1 Offset 69 
                                                      OpMemberDecorate %69 2 Offset 69 
                                                      OpMemberDecorate %69 3 Offset 69 
                                                      OpMemberDecorate %69 4 Offset 69 
                                                      OpMemberDecorate %69 5 RelaxedPrecision 
                                                      OpMemberDecorate %69 5 Offset 69 
                                                      OpMemberDecorate %69 6 RelaxedPrecision 
                                                      OpMemberDecorate %69 6 Offset 69 
                                                      OpDecorate %69 Block 
                                                      OpDecorate %71 DescriptorSet 71 
                                                      OpDecorate %71 Binding 71 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %107 SpecId 107 
                                                      OpDecorate %116 Location 116 
                                                      OpDecorate %194 DescriptorSet 194 
                                                      OpDecorate %194 Binding 194 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %220 Location 220 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                 Private f32* %33 = OpVariable Private 
                                              %47 = OpTypePointer Private %21 
                               Private f32_3* %48 = OpVariable Private 
                                              %51 = OpTypePointer Input %7 
                                 Input f32_4* %52 = OpVariable Input 
                                          u32 %64 = OpConstant 3 
                                          u32 %67 = OpConstant 4 
                                              %68 = OpTypeArray %7 %67 
                                              %69 = OpTypeStruct %7 %7 %68 %21 %21 %7 %6 
                                              %70 = OpTypePointer Uniform %69 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32;}* %71 = OpVariable Uniform 
                                              %72 = OpTypeInt 32 1 
                                          i32 %73 = OpConstant 6 
                                              %74 = OpTypePointer Uniform %6 
                                              %80 = OpTypeBool 
                                              %81 = OpTypePointer Private %80 
                                Private bool* %82 = OpVariable Private 
                                          f32 %85 = OpConstant 3.67402E-40 
                                          i32 %88 = OpConstant 0 
                                          i32 %89 = OpConstant 1 
                                          i32 %91 = OpConstant -1 
                                          f32 %99 = OpConstant 3.67402E-40 
                                        bool %101 = OpConstantFalse 
                                        bool %107 = OpSpecConstantFalse 
                                         u32 %110 = OpConstant 1 
                              Private f32_3* %114 = OpVariable Private 
                                             %115 = OpTypePointer Input %21 
                                Input f32_3* %116 = OpVariable Input 
                                         i32 %119 = OpConstant 2 
                                             %120 = OpTypePointer Uniform %7 
                                         i32 %142 = OpConstant 3 
                              Private f32_3* %147 = OpVariable Private 
                                             %148 = OpTypePointer Function %21 
                                         i32 %158 = OpConstant 4 
                                             %159 = OpTypePointer Uniform %21 
                              Private f32_4* %164 = OpVariable Private 
                                         f32 %173 = OpConstant 3.67402E-40 
                                         f32 %175 = OpConstant 3.67402E-40 
                                         u32 %178 = OpConstant 2 
                                         f32 %181 = OpConstant 3.67402E-40 
                                             %191 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %192 = OpTypeSampledImage %191 
                                             %193 = OpTypePointer UniformConstant %192 
 UniformConstant read_only Texture3DSampled* %194 = OpVariable UniformConstant 
                                Private f32* %205 = OpVariable Private 
                              Private f32_3* %212 = OpVariable Private 
                                         i32 %214 = OpConstant 5 
                                             %219 = OpTypePointer Output %7 
                               Output f32_4* %220 = OpVariable Output 
                                             %229 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %149 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                 Private f32* %34 = OpAccessChain %20 %30 
                                          f32 %35 = OpLoad %34 
                                 Private f32* %36 = OpAccessChain %20 %30 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFMul %35 %37 
                                                      OpStore %33 %38 
                                 Private f32* %39 = OpAccessChain %20 %30 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpLoad %33 
                                          f32 %42 = OpFMul %40 %41 
                                                      OpStore %33 %42 
                                 Private f32* %43 = OpAccessChain %20 %30 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpLoad %33 
                                          f32 %46 = OpFMul %44 %45 
                                                      OpStore %33 %46 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpFNegate %54 
                                        f32_3 %56 = OpFAdd %50 %55 
                                                      OpStore %48 %56 
                                          f32 %57 = OpLoad %33 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_3 %59 = OpLoad %48 
                                        f32_3 %60 = OpFMul %58 %59 
                                        f32_4 %61 = OpLoad %52 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                                      OpStore %48 %63 
                                 Private f32* %65 = OpAccessChain %9 %64 
                                          f32 %66 = OpLoad %65 
                                 Uniform f32* %75 = OpAccessChain %71 %73 
                                          f32 %76 = OpLoad %75 
                                          f32 %77 = OpFNegate %76 
                                          f32 %78 = OpFAdd %66 %77 
                                 Private f32* %79 = OpAccessChain %20 %30 
                                                      OpStore %79 %78 
                                 Private f32* %83 = OpAccessChain %20 %30 
                                          f32 %84 = OpLoad %83 
                                         bool %86 = OpFOrdLessThan %84 %85 
                                                      OpStore %82 %86 
                                         bool %87 = OpLoad %82 
                                          i32 %90 = OpSelect %87 %89 %88 
                                          i32 %92 = OpIMul %90 %91 
                                         bool %93 = OpINotEqual %92 %88 
                                                      OpSelectionMerge %95 None 
                                                      OpBranchConditional %93 %94 %95 
                                              %94 = OpLabel 
                                                      OpKill
                                              %95 = OpLabel 
                                 Uniform f32* %97 = OpAccessChain %71 %89 %30 
                                          f32 %98 = OpLoad %97 
                                        bool %100 = OpFOrdEqual %98 %99 
                                                      OpStore %82 %100 
                                                      OpSelectionMerge %103 None 
                                                      OpBranchConditional %101 %102 %103 
                                             %102 = OpLabel 
                                        bool %104 = OpLoad %82 
                                                      OpSelectionMerge %106 None 
                                                      OpBranchConditional %104 %105 %106 
                                             %105 = OpLabel 
                                                      OpBranch %106 
                                             %106 = OpLabel 
                                                      OpBranch %103 
                                             %103 = OpLabel 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %200 
                                             %108 = OpLabel 
                                Uniform f32* %111 = OpAccessChain %71 %89 %110 
                                         f32 %112 = OpLoad %111 
                                        bool %113 = OpFOrdEqual %112 %99 
                                                      OpStore %82 %113 
                                       f32_3 %117 = OpLoad %116 
                                       f32_3 %118 = OpVectorShuffle %117 %117 1 1 1 
                              Uniform f32_4* %121 = OpAccessChain %71 %119 %89 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFMul %118 %123 
                                                      OpStore %114 %124 
                              Uniform f32_4* %125 = OpAccessChain %71 %119 %88 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_3 %128 = OpLoad %116 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 0 0 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_3 %131 = OpLoad %114 
                                       f32_3 %132 = OpFAdd %130 %131 
                                                      OpStore %114 %132 
                              Uniform f32_4* %133 = OpAccessChain %71 %119 %119 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_3 %136 = OpLoad %116 
                                       f32_3 %137 = OpVectorShuffle %136 %136 2 2 2 
                                       f32_3 %138 = OpFMul %135 %137 
                                       f32_3 %139 = OpLoad %114 
                                       f32_3 %140 = OpFAdd %138 %139 
                                                      OpStore %114 %140 
                                       f32_3 %141 = OpLoad %114 
                              Uniform f32_4* %143 = OpAccessChain %71 %119 %142 
                                       f32_4 %144 = OpLoad %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_3 %146 = OpFAdd %141 %145 
                                                      OpStore %114 %146 
                                        bool %150 = OpLoad %82 
                                                      OpSelectionMerge %152 None 
                                                      OpBranchConditional %150 %151 %154 
                                             %151 = OpLabel 
                                       f32_3 %153 = OpLoad %114 
                                                      OpStore %149 %153 
                                                      OpBranch %152 
                                             %154 = OpLabel 
                                       f32_3 %155 = OpLoad %116 
                                                      OpStore %149 %155 
                                                      OpBranch %152 
                                             %152 = OpLabel 
                                       f32_3 %156 = OpLoad %149 
                                                      OpStore %147 %156 
                                       f32_3 %157 = OpLoad %147 
                              Uniform f32_3* %160 = OpAccessChain %71 %158 
                                       f32_3 %161 = OpLoad %160 
                                       f32_3 %162 = OpFNegate %161 
                                       f32_3 %163 = OpFAdd %157 %162 
                                                      OpStore %147 %163 
                                       f32_3 %165 = OpLoad %147 
                              Uniform f32_3* %166 = OpAccessChain %71 %142 
                                       f32_3 %167 = OpLoad %166 
                                       f32_3 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %164 
                                       f32_4 %170 = OpVectorShuffle %169 %168 0 4 5 6 
                                                      OpStore %164 %170 
                                Private f32* %171 = OpAccessChain %164 %110 
                                         f32 %172 = OpLoad %171 
                                         f32 %174 = OpFMul %172 %173 
                                         f32 %176 = OpFAdd %174 %175 
                                Private f32* %177 = OpAccessChain %147 %30 
                                                      OpStore %177 %176 
                                Uniform f32* %179 = OpAccessChain %71 %89 %178 
                                         f32 %180 = OpLoad %179 
                                         f32 %182 = OpFMul %180 %181 
                                         f32 %183 = OpFAdd %182 %175 
                                Private f32* %184 = OpAccessChain %114 %30 
                                                      OpStore %184 %183 
                                Private f32* %185 = OpAccessChain %114 %30 
                                         f32 %186 = OpLoad %185 
                                Private f32* %187 = OpAccessChain %147 %30 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpExtInst %1 40 %186 %188 
                                Private f32* %190 = OpAccessChain %164 %30 
                                                      OpStore %190 %189 
                  read_only Texture3DSampled %195 = OpLoad %194 
                                       f32_4 %196 = OpLoad %164 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 2 3 
                                       f32_4 %198 = OpImageSampleImplicitLod %195 %197 
                                                      OpStore %164 %198 
                                       f32_4 %199 = OpLoad %164 
                                                      OpStore %20 %199 
                                                      OpBranch %109 
                                             %200 = OpLabel 
                                Private f32* %201 = OpAccessChain %20 %30 
                                                      OpStore %201 %99 
                                Private f32* %202 = OpAccessChain %20 %110 
                                                      OpStore %202 %99 
                                Private f32* %203 = OpAccessChain %20 %178 
                                                      OpStore %203 %99 
                                Private f32* %204 = OpAccessChain %20 %64 
                                                      OpStore %204 %99 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                       f32_4 %206 = OpLoad %20 
                              Uniform f32_4* %207 = OpAccessChain %71 %88 
                                       f32_4 %208 = OpLoad %207 
                                         f32 %209 = OpDot %206 %208 
                                                      OpStore %205 %209 
                                         f32 %210 = OpLoad %205 
                                         f32 %211 = OpExtInst %1 43 %210 %85 %99 
                                                      OpStore %205 %211 
                                       f32_3 %213 = OpLoad %48 
                              Uniform f32_4* %215 = OpAccessChain %71 %214 
                                       f32_4 %216 = OpLoad %215 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
                                       f32_3 %218 = OpFMul %213 %217 
                                                      OpStore %212 %218 
                                         f32 %221 = OpLoad %205 
                                       f32_3 %222 = OpCompositeConstruct %221 %221 %221 
                                       f32_3 %223 = OpLoad %212 
                                       f32_3 %224 = OpFMul %222 %223 
                                       f32_4 %225 = OpLoad %220 
                                       f32_4 %226 = OpVectorShuffle %225 %224 4 5 6 3 
                                                      OpStore %220 %226 
                                Private f32* %227 = OpAccessChain %9 %64 
                                         f32 %228 = OpLoad %227 
                                 Output f32* %230 = OpAccessChain %220 %64 
                                                      OpStore %230 %228 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
float u_xlat3;
vec4 u_xlat10_3;
float u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat10;
float u_xlat13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_5 = u_xlat16_1 * u_xlat16_5;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_5;
    u_xlat0.xyz = u_xlat10_0.xyz + (-vs_COLOR0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_1) * u_xlat0.xyz + vs_COLOR0.xyz;
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat6.x = u_xlat2.y * 0.25 + 0.75;
        u_xlat3 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat6.x, u_xlat3);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat2.x = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlatb6 = 0.0<u_xlat1.z;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat10.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat10.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat10_3 = texture(_LightTexture0, u_xlat10.xy);
    u_xlat13 = u_xlat6.x * u_xlat10_3.w;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_3 = texture(_LightTextureB0, u_xlat1.xx);
    u_xlat1.x = u_xlat13 * u_xlat10_3.w;
    u_xlat1.x = u_xlat2.x * u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SPOT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 158
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %150 
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
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %151 RelaxedPrecision 
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
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                               Output f32_4* %149 = OpVariable Output 
                                Input f32_4* %150 = OpVariable Input 
                                             %152 = OpTypePointer Output %6 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                       f32_4 %151 = OpLoad %150 
                                                      OpStore %149 %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                 Output f32* %156 = OpAccessChain %81 %23 %77 
                                                      OpStore %156 %155 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 318
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %52 %98 %306 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %52 Location 52 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %68 ArrayStride 68 
                                                      OpDecorate %69 ArrayStride 69 
                                                      OpMemberDecorate %70 0 RelaxedPrecision 
                                                      OpMemberDecorate %70 0 Offset 70 
                                                      OpMemberDecorate %70 1 Offset 70 
                                                      OpMemberDecorate %70 2 Offset 70 
                                                      OpMemberDecorate %70 3 Offset 70 
                                                      OpMemberDecorate %70 4 Offset 70 
                                                      OpMemberDecorate %70 5 RelaxedPrecision 
                                                      OpMemberDecorate %70 5 Offset 70 
                                                      OpMemberDecorate %70 6 Offset 70 
                                                      OpMemberDecorate %70 7 RelaxedPrecision 
                                                      OpMemberDecorate %70 7 Offset 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %72 DescriptorSet 72 
                                                      OpDecorate %72 Binding 72 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %136 SpecId 136 
                                                      OpDecorate %225 DescriptorSet 225 
                                                      OpDecorate %225 Binding 225 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %264 DescriptorSet 264 
                                                      OpDecorate %264 Binding 264 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %282 DescriptorSet 282 
                                                      OpDecorate %282 Binding 282 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %306 Location 306 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
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
                                              %20 = OpTypePointer Private %6 
                                 Private f32* %21 = OpVariable Private 
                                              %22 = OpTypeVector %6 3 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                        f32_3 %28 = OpConstantComposite %25 %26 %27 
                               Private f32_4* %30 = OpVariable Private 
                                              %34 = OpTypeInt 32 0 
                                          u32 %35 = OpConstant 0 
                                              %47 = OpTypePointer Private %22 
                               Private f32_3* %48 = OpVariable Private 
                                              %51 = OpTypePointer Input %7 
                                 Input f32_4* %52 = OpVariable Input 
                                          u32 %64 = OpConstant 3 
                                          u32 %67 = OpConstant 4 
                                              %68 = OpTypeArray %7 %67 
                                              %69 = OpTypeArray %7 %67 
                                              %70 = OpTypeStruct %7 %7 %68 %22 %22 %7 %69 %6 
                                              %71 = OpTypePointer Uniform %70 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32;}* %72 = OpVariable Uniform 
                                              %73 = OpTypeInt 32 1 
                                          i32 %74 = OpConstant 7 
                                              %75 = OpTypePointer Uniform %6 
                                              %80 = OpTypeBool 
                                              %81 = OpTypePointer Private %80 
                                Private bool* %82 = OpVariable Private 
                                          f32 %84 = OpConstant 3.67402E-40 
                                          i32 %87 = OpConstant 0 
                                          i32 %88 = OpConstant 1 
                                          i32 %90 = OpConstant -1 
                               Private f32_4* %96 = OpVariable Private 
                                              %97 = OpTypePointer Input %22 
                                 Input f32_3* %98 = OpVariable Input 
                                         i32 %101 = OpConstant 6 
                                             %102 = OpTypePointer Uniform %7 
                                         i32 %113 = OpConstant 2 
                                         i32 %122 = OpConstant 3 
                                         f32 %128 = OpConstant 3.67402E-40 
                                        bool %130 = OpConstantFalse 
                                        bool %136 = OpSpecConstantFalse 
                                         u32 %139 = OpConstant 1 
                              Private f32_3* %143 = OpVariable Private 
                              Private f32_4* %171 = OpVariable Private 
                                             %172 = OpTypePointer Function %22 
                                         i32 %185 = OpConstant 4 
                                             %186 = OpTypePointer Uniform %22 
                                         f32 %202 = OpConstant 3.67402E-40 
                                         f32 %204 = OpConstant 3.67402E-40 
                                             %207 = OpTypePointer Private %15 
                              Private f32_2* %208 = OpVariable Private 
                                         u32 %209 = OpConstant 2 
                                         f32 %212 = OpConstant 3.67402E-40 
                                             %222 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %223 = OpTypeSampledImage %222 
                                             %224 = OpTypePointer UniformConstant %223 
 UniformConstant read_only Texture3DSampled* %225 = OpVariable UniformConstant 
                                Private f32* %236 = OpVariable Private 
                               Private bool* %243 = OpVariable Private 
                              Private f32_3* %247 = OpVariable Private 
                                             %248 = OpTypePointer Function %6 
                                       f32_2 %262 = OpConstantComposite %212 %212 
 UniformConstant read_only Texture2DSampled* %264 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %282 = OpVariable UniformConstant 
                                         i32 %300 = OpConstant 5 
                                             %305 = OpTypePointer Output %7 
                               Output f32_4* %306 = OpVariable Output 
                                             %315 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %173 = OpVariable Function 
                               Function f32* %249 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %32 = OpLoad %21 
                                          f32 %33 = OpFMul %31 %32 
                                 Private f32* %36 = OpAccessChain %30 %35 
                                                      OpStore %36 %33 
                                          f32 %37 = OpLoad %21 
                                 Private f32* %38 = OpAccessChain %30 %35 
                                          f32 %39 = OpLoad %38 
                                          f32 %40 = OpFMul %37 %39 
                                 Private f32* %41 = OpAccessChain %30 %35 
                                                      OpStore %41 %40 
                                          f32 %42 = OpLoad %21 
                                 Private f32* %43 = OpAccessChain %30 %35 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpFMul %42 %44 
                                 Private f32* %46 = OpAccessChain %30 %35 
                                                      OpStore %46 %45 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpFNegate %54 
                                        f32_3 %56 = OpFAdd %50 %55 
                                                      OpStore %48 %56 
                                        f32_4 %57 = OpLoad %30 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 0 0 
                                        f32_3 %59 = OpLoad %48 
                                        f32_3 %60 = OpFMul %58 %59 
                                        f32_4 %61 = OpLoad %52 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                                      OpStore %48 %63 
                                 Private f32* %65 = OpAccessChain %9 %64 
                                          f32 %66 = OpLoad %65 
                                 Uniform f32* %76 = OpAccessChain %72 %74 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpFNegate %77 
                                          f32 %79 = OpFAdd %66 %78 
                                                      OpStore %21 %79 
                                          f32 %83 = OpLoad %21 
                                         bool %85 = OpFOrdLessThan %83 %84 
                                                      OpStore %82 %85 
                                         bool %86 = OpLoad %82 
                                          i32 %89 = OpSelect %86 %88 %87 
                                          i32 %91 = OpIMul %89 %90 
                                         bool %92 = OpINotEqual %91 %87 
                                                      OpSelectionMerge %94 None 
                                                      OpBranchConditional %92 %93 %94 
                                              %93 = OpLabel 
                                                      OpKill
                                              %94 = OpLabel 
                                        f32_3 %99 = OpLoad %98 
                                       f32_4 %100 = OpVectorShuffle %99 %99 1 1 1 1 
                              Uniform f32_4* %103 = OpAccessChain %72 %101 %88 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpFMul %100 %104 
                                                      OpStore %96 %105 
                              Uniform f32_4* %106 = OpAccessChain %72 %101 %87 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpLoad %98 
                                       f32_4 %109 = OpVectorShuffle %108 %108 0 0 0 0 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %96 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %96 %112 
                              Uniform f32_4* %114 = OpAccessChain %72 %101 %113 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpLoad %98 
                                       f32_4 %117 = OpVectorShuffle %116 %116 2 2 2 2 
                                       f32_4 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %96 
                                       f32_4 %120 = OpFAdd %118 %119 
                                                      OpStore %96 %120 
                                       f32_4 %121 = OpLoad %96 
                              Uniform f32_4* %123 = OpAccessChain %72 %101 %122 
                                       f32_4 %124 = OpLoad %123 
                                       f32_4 %125 = OpFAdd %121 %124 
                                                      OpStore %96 %125 
                                Uniform f32* %126 = OpAccessChain %72 %88 %35 
                                         f32 %127 = OpLoad %126 
                                        bool %129 = OpFOrdEqual %127 %128 
                                                      OpStore %82 %129 
                                                      OpSelectionMerge %132 None 
                                                      OpBranchConditional %130 %131 %132 
                                             %131 = OpLabel 
                                        bool %133 = OpLoad %82 
                                                      OpSelectionMerge %135 None 
                                                      OpBranchConditional %133 %134 %135 
                                             %134 = OpLabel 
                                                      OpBranch %135 
                                             %135 = OpLabel 
                                                      OpBranch %132 
                                             %132 = OpLabel 
                                                      OpSelectionMerge %138 None 
                                                      OpBranchConditional %136 %137 %231 
                                             %137 = OpLabel 
                                Uniform f32* %140 = OpAccessChain %72 %88 %139 
                                         f32 %141 = OpLoad %140 
                                        bool %142 = OpFOrdEqual %141 %128 
                                                      OpStore %82 %142 
                                       f32_3 %144 = OpLoad %98 
                                       f32_3 %145 = OpVectorShuffle %144 %144 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %72 %113 %88 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFMul %145 %148 
                                                      OpStore %143 %149 
                              Uniform f32_4* %150 = OpAccessChain %72 %113 %87 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpLoad %98 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 0 0 
                                       f32_3 %155 = OpFMul %152 %154 
                                       f32_3 %156 = OpLoad %143 
                                       f32_3 %157 = OpFAdd %155 %156 
                                                      OpStore %143 %157 
                              Uniform f32_4* %158 = OpAccessChain %72 %113 %113 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_3 %161 = OpLoad %98 
                                       f32_3 %162 = OpVectorShuffle %161 %161 2 2 2 
                                       f32_3 %163 = OpFMul %160 %162 
                                       f32_3 %164 = OpLoad %143 
                                       f32_3 %165 = OpFAdd %163 %164 
                                                      OpStore %143 %165 
                                       f32_3 %166 = OpLoad %143 
                              Uniform f32_4* %167 = OpAccessChain %72 %113 %122 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                       f32_3 %170 = OpFAdd %166 %169 
                                                      OpStore %143 %170 
                                        bool %174 = OpLoad %82 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %178 
                                             %175 = OpLabel 
                                       f32_3 %177 = OpLoad %143 
                                                      OpStore %173 %177 
                                                      OpBranch %176 
                                             %178 = OpLabel 
                                       f32_3 %179 = OpLoad %98 
                                                      OpStore %173 %179 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_3 %180 = OpLoad %173 
                                       f32_4 %181 = OpLoad %171 
                                       f32_4 %182 = OpVectorShuffle %181 %180 4 5 6 3 
                                                      OpStore %171 %182 
                                       f32_4 %183 = OpLoad %171 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                              Uniform f32_3* %187 = OpAccessChain %72 %185 
                                       f32_3 %188 = OpLoad %187 
                                       f32_3 %189 = OpFNegate %188 
                                       f32_3 %190 = OpFAdd %184 %189 
                                       f32_4 %191 = OpLoad %171 
                                       f32_4 %192 = OpVectorShuffle %191 %190 4 5 6 3 
                                                      OpStore %171 %192 
                                       f32_4 %193 = OpLoad %171 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                              Uniform f32_3* %195 = OpAccessChain %72 %122 
                                       f32_3 %196 = OpLoad %195 
                                       f32_3 %197 = OpFMul %194 %196 
                                       f32_4 %198 = OpLoad %171 
                                       f32_4 %199 = OpVectorShuffle %198 %197 0 4 5 6 
                                                      OpStore %171 %199 
                                Private f32* %200 = OpAccessChain %171 %139 
                                         f32 %201 = OpLoad %200 
                                         f32 %203 = OpFMul %201 %202 
                                         f32 %205 = OpFAdd %203 %204 
                                Private f32* %206 = OpAccessChain %143 %35 
                                                      OpStore %206 %205 
                                Uniform f32* %210 = OpAccessChain %72 %88 %209 
                                         f32 %211 = OpLoad %210 
                                         f32 %213 = OpFMul %211 %212 
                                         f32 %214 = OpFAdd %213 %204 
                                Private f32* %215 = OpAccessChain %208 %35 
                                                      OpStore %215 %214 
                                Private f32* %216 = OpAccessChain %143 %35 
                                         f32 %217 = OpLoad %216 
                                Private f32* %218 = OpAccessChain %208 %35 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpExtInst %1 40 %217 %219 
                                Private f32* %221 = OpAccessChain %171 %35 
                                                      OpStore %221 %220 
                  read_only Texture3DSampled %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %171 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 2 3 
                                       f32_4 %229 = OpImageSampleImplicitLod %226 %228 
                                                      OpStore %171 %229 
                                       f32_4 %230 = OpLoad %171 
                                                      OpStore %30 %230 
                                                      OpBranch %138 
                                             %231 = OpLabel 
                                Private f32* %232 = OpAccessChain %30 %35 
                                                      OpStore %232 %128 
                                Private f32* %233 = OpAccessChain %30 %139 
                                                      OpStore %233 %128 
                                Private f32* %234 = OpAccessChain %30 %209 
                                                      OpStore %234 %128 
                                Private f32* %235 = OpAccessChain %30 %64 
                                                      OpStore %235 %128 
                                                      OpBranch %138 
                                             %138 = OpLabel 
                                       f32_4 %237 = OpLoad %30 
                              Uniform f32_4* %238 = OpAccessChain %72 %87 
                                       f32_4 %239 = OpLoad %238 
                                         f32 %240 = OpDot %237 %239 
                                                      OpStore %236 %240 
                                         f32 %241 = OpLoad %236 
                                         f32 %242 = OpExtInst %1 43 %241 %84 %128 
                                                      OpStore %236 %242 
                                Private f32* %244 = OpAccessChain %96 %209 
                                         f32 %245 = OpLoad %244 
                                        bool %246 = OpFOrdLessThan %84 %245 
                                                      OpStore %243 %246 
                                        bool %250 = OpLoad %243 
                                                      OpSelectionMerge %252 None 
                                                      OpBranchConditional %250 %251 %253 
                                             %251 = OpLabel 
                                                      OpStore %249 %128 
                                                      OpBranch %252 
                                             %253 = OpLabel 
                                                      OpStore %249 %84 
                                                      OpBranch %252 
                                             %252 = OpLabel 
                                         f32 %254 = OpLoad %249 
                                Private f32* %255 = OpAccessChain %247 %35 
                                                      OpStore %255 %254 
                                       f32_4 %256 = OpLoad %96 
                                       f32_2 %257 = OpVectorShuffle %256 %256 0 1 
                                       f32_4 %258 = OpLoad %96 
                                       f32_2 %259 = OpVectorShuffle %258 %258 3 3 
                                       f32_2 %260 = OpFDiv %257 %259 
                                                      OpStore %208 %260 
                                       f32_2 %261 = OpLoad %208 
                                       f32_2 %263 = OpFAdd %261 %262 
                                                      OpStore %208 %263 
                  read_only Texture2DSampled %265 = OpLoad %264 
                                       f32_2 %266 = OpLoad %208 
                                       f32_4 %267 = OpImageSampleImplicitLod %265 %266 
                                         f32 %268 = OpCompositeExtract %267 3 
                                Private f32* %269 = OpAccessChain %208 %35 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %208 %35 
                                         f32 %271 = OpLoad %270 
                                Private f32* %272 = OpAccessChain %247 %35 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpFMul %271 %273 
                                Private f32* %275 = OpAccessChain %247 %35 
                                                      OpStore %275 %274 
                                       f32_4 %276 = OpLoad %96 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                       f32_4 %278 = OpLoad %96 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                         f32 %280 = OpDot %277 %279 
                                Private f32* %281 = OpAccessChain %208 %35 
                                                      OpStore %281 %280 
                  read_only Texture2DSampled %283 = OpLoad %282 
                                       f32_2 %284 = OpLoad %208 
                                       f32_2 %285 = OpVectorShuffle %284 %284 0 0 
                                       f32_4 %286 = OpImageSampleImplicitLod %283 %285 
                                         f32 %287 = OpCompositeExtract %286 3 
                                Private f32* %288 = OpAccessChain %208 %35 
                                                      OpStore %288 %287 
                                Private f32* %289 = OpAccessChain %208 %35 
                                         f32 %290 = OpLoad %289 
                                Private f32* %291 = OpAccessChain %247 %35 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFMul %290 %292 
                                Private f32* %294 = OpAccessChain %247 %35 
                                                      OpStore %294 %293 
                                         f32 %295 = OpLoad %236 
                                Private f32* %296 = OpAccessChain %247 %35 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpFMul %295 %297 
                                                      OpStore %236 %298 
                                       f32_3 %299 = OpLoad %48 
                              Uniform f32_4* %301 = OpAccessChain %72 %300 
                                       f32_4 %302 = OpLoad %301 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                       f32_3 %304 = OpFMul %299 %303 
                                                      OpStore %247 %304 
                                         f32 %307 = OpLoad %236 
                                       f32_3 %308 = OpCompositeConstruct %307 %307 %307 
                                       f32_3 %309 = OpLoad %247 
                                       f32_3 %310 = OpFMul %308 %309 
                                       f32_4 %311 = OpLoad %306 
                                       f32_4 %312 = OpVectorShuffle %311 %310 4 5 6 3 
                                                      OpStore %306 %312 
                                Private f32* %313 = OpAccessChain %9 %64 
                                         f32 %314 = OpLoad %313 
                                 Output f32* %316 = OpAccessChain %306 %64 
                                                      OpStore %316 %314 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat10_3;
float u_xlat16_5;
float u_xlat6;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_5 = u_xlat16_1 * u_xlat16_5;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_5;
    u_xlat0.xyz = u_xlat10_0.xyz + (-vs_COLOR0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_1) * u_xlat0.xyz + vs_COLOR0.xyz;
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb13 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb13){
        u_xlatb13 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb13)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat13 = u_xlat2.y * 0.25 + 0.75;
        u_xlat6 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat13, u_xlat6);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat13 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat2.xx);
    u_xlat10_3 = texture(_LightTexture0, u_xlat1.xyz);
    u_xlat16_1 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat1.x = u_xlat13 * u_xlat16_1;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 158
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %150 
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
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %151 RelaxedPrecision 
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
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                               Output f32_4* %149 = OpVariable Output 
                                Input f32_4* %150 = OpVariable Input 
                                             %152 = OpTypePointer Output %6 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                       f32_4 %151 = OpLoad %150 
                                                      OpStore %149 %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                 Output f32* %156 = OpAccessChain %81 %23 %77 
                                                      OpStore %156 %155 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 292
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %52 %100 %280 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %52 Location 52 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %68 ArrayStride 68 
                                                      OpDecorate %69 ArrayStride 69 
                                                      OpMemberDecorate %70 0 RelaxedPrecision 
                                                      OpMemberDecorate %70 0 Offset 70 
                                                      OpMemberDecorate %70 1 Offset 70 
                                                      OpMemberDecorate %70 2 Offset 70 
                                                      OpMemberDecorate %70 3 Offset 70 
                                                      OpMemberDecorate %70 4 Offset 70 
                                                      OpMemberDecorate %70 5 RelaxedPrecision 
                                                      OpMemberDecorate %70 5 Offset 70 
                                                      OpMemberDecorate %70 6 Offset 70 
                                                      OpMemberDecorate %70 7 RelaxedPrecision 
                                                      OpMemberDecorate %70 7 Offset 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %72 DescriptorSet 72 
                                                      OpDecorate %72 Binding 72 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %100 Location 100 
                                                      OpDecorate %143 SpecId 143 
                                                      OpDecorate %223 DescriptorSet 223 
                                                      OpDecorate %223 Binding 223 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %247 DescriptorSet 247 
                                                      OpDecorate %247 Binding 247 
                                                      OpDecorate %256 DescriptorSet 256 
                                                      OpDecorate %256 Binding 256 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %280 Location 280 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                 Private f32* %33 = OpVariable Private 
                                              %47 = OpTypePointer Private %21 
                               Private f32_3* %48 = OpVariable Private 
                                              %51 = OpTypePointer Input %7 
                                 Input f32_4* %52 = OpVariable Input 
                                          u32 %64 = OpConstant 3 
                                          u32 %67 = OpConstant 4 
                                              %68 = OpTypeArray %7 %67 
                                              %69 = OpTypeArray %7 %67 
                                              %70 = OpTypeStruct %7 %7 %68 %21 %21 %7 %69 %6 
                                              %71 = OpTypePointer Uniform %70 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32;}* %72 = OpVariable Uniform 
                                              %73 = OpTypeInt 32 1 
                                          i32 %74 = OpConstant 7 
                                              %75 = OpTypePointer Uniform %6 
                                              %81 = OpTypeBool 
                                              %82 = OpTypePointer Private %81 
                                Private bool* %83 = OpVariable Private 
                                          f32 %86 = OpConstant 3.67402E-40 
                                          i32 %89 = OpConstant 0 
                                          i32 %90 = OpConstant 1 
                                          i32 %92 = OpConstant -1 
                               Private f32_3* %98 = OpVariable Private 
                                              %99 = OpTypePointer Input %21 
                                Input f32_3* %100 = OpVariable Input 
                                         i32 %103 = OpConstant 6 
                                             %104 = OpTypePointer Uniform %7 
                                         i32 %117 = OpConstant 2 
                                         i32 %127 = OpConstant 3 
                               Private bool* %132 = OpVariable Private 
                                         f32 %135 = OpConstant 3.67402E-40 
                                        bool %137 = OpConstantFalse 
                                        bool %143 = OpSpecConstantFalse 
                                         u32 %146 = OpConstant 1 
                              Private f32_3* %150 = OpVariable Private 
                                             %178 = OpTypePointer Function %21 
                                         i32 %188 = OpConstant 4 
                                             %189 = OpTypePointer Uniform %21 
                              Private f32_4* %194 = OpVariable Private 
                                Private f32* %201 = OpVariable Private 
                                         f32 %204 = OpConstant 3.67402E-40 
                                         f32 %206 = OpConstant 3.67402E-40 
                                         u32 %208 = OpConstant 2 
                                         f32 %211 = OpConstant 3.67402E-40 
                                             %220 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %221 = OpTypeSampledImage %220 
                                             %222 = OpTypePointer UniformConstant %221 
 UniformConstant read_only Texture3DSampled* %223 = OpVariable UniformConstant 
                              Private f32_3* %234 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %247 = OpVariable UniformConstant 
                                             %253 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %254 = OpTypeSampledImage %253 
                                             %255 = OpTypePointer UniformConstant %254 
UniformConstant read_only TextureCubeSampled* %256 = OpVariable UniformConstant 
                                         i32 %274 = OpConstant 5 
                                             %279 = OpTypePointer Output %7 
                               Output f32_4* %280 = OpVariable Output 
                                             %289 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %179 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                 Private f32* %34 = OpAccessChain %20 %30 
                                          f32 %35 = OpLoad %34 
                                 Private f32* %36 = OpAccessChain %20 %30 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFMul %35 %37 
                                                      OpStore %33 %38 
                                 Private f32* %39 = OpAccessChain %20 %30 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpLoad %33 
                                          f32 %42 = OpFMul %40 %41 
                                                      OpStore %33 %42 
                                 Private f32* %43 = OpAccessChain %20 %30 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpLoad %33 
                                          f32 %46 = OpFMul %44 %45 
                                                      OpStore %33 %46 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpFNegate %54 
                                        f32_3 %56 = OpFAdd %50 %55 
                                                      OpStore %48 %56 
                                          f32 %57 = OpLoad %33 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_3 %59 = OpLoad %48 
                                        f32_3 %60 = OpFMul %58 %59 
                                        f32_4 %61 = OpLoad %52 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                                      OpStore %48 %63 
                                 Private f32* %65 = OpAccessChain %9 %64 
                                          f32 %66 = OpLoad %65 
                                 Uniform f32* %76 = OpAccessChain %72 %74 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpFNegate %77 
                                          f32 %79 = OpFAdd %66 %78 
                                 Private f32* %80 = OpAccessChain %20 %30 
                                                      OpStore %80 %79 
                                 Private f32* %84 = OpAccessChain %20 %30 
                                          f32 %85 = OpLoad %84 
                                         bool %87 = OpFOrdLessThan %85 %86 
                                                      OpStore %83 %87 
                                         bool %88 = OpLoad %83 
                                          i32 %91 = OpSelect %88 %90 %89 
                                          i32 %93 = OpIMul %91 %92 
                                         bool %94 = OpINotEqual %93 %89 
                                                      OpSelectionMerge %96 None 
                                                      OpBranchConditional %94 %95 %96 
                                              %95 = OpLabel 
                                                      OpKill
                                              %96 = OpLabel 
                                       f32_3 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 1 1 1 
                              Uniform f32_4* %105 = OpAccessChain %72 %103 %90 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFMul %102 %107 
                                                      OpStore %98 %108 
                              Uniform f32_4* %109 = OpAccessChain %72 %103 %89 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                       f32_3 %112 = OpLoad %100 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 0 0 
                                       f32_3 %114 = OpFMul %111 %113 
                                       f32_3 %115 = OpLoad %98 
                                       f32_3 %116 = OpFAdd %114 %115 
                                                      OpStore %98 %116 
                              Uniform f32_4* %118 = OpAccessChain %72 %103 %117 
                                       f32_4 %119 = OpLoad %118 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpLoad %100 
                                       f32_3 %122 = OpVectorShuffle %121 %121 2 2 2 
                                       f32_3 %123 = OpFMul %120 %122 
                                       f32_3 %124 = OpLoad %98 
                                       f32_3 %125 = OpFAdd %123 %124 
                                                      OpStore %98 %125 
                                       f32_3 %126 = OpLoad %98 
                              Uniform f32_4* %128 = OpAccessChain %72 %103 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFAdd %126 %130 
                                                      OpStore %98 %131 
                                Uniform f32* %133 = OpAccessChain %72 %90 %30 
                                         f32 %134 = OpLoad %133 
                                        bool %136 = OpFOrdEqual %134 %135 
                                                      OpStore %132 %136 
                                                      OpSelectionMerge %139 None 
                                                      OpBranchConditional %137 %138 %139 
                                             %138 = OpLabel 
                                        bool %140 = OpLoad %132 
                                                      OpSelectionMerge %142 None 
                                                      OpBranchConditional %140 %141 %142 
                                             %141 = OpLabel 
                                                      OpBranch %142 
                                             %142 = OpLabel 
                                                      OpBranch %139 
                                             %139 = OpLabel 
                                                      OpSelectionMerge %145 None 
                                                      OpBranchConditional %143 %144 %229 
                                             %144 = OpLabel 
                                Uniform f32* %147 = OpAccessChain %72 %90 %146 
                                         f32 %148 = OpLoad %147 
                                        bool %149 = OpFOrdEqual %148 %135 
                                                      OpStore %132 %149 
                                       f32_3 %151 = OpLoad %100 
                                       f32_3 %152 = OpVectorShuffle %151 %151 1 1 1 
                              Uniform f32_4* %153 = OpAccessChain %72 %117 %90 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpFMul %152 %155 
                                                      OpStore %150 %156 
                              Uniform f32_4* %157 = OpAccessChain %72 %117 %89 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpLoad %100 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 0 0 
                                       f32_3 %162 = OpFMul %159 %161 
                                       f32_3 %163 = OpLoad %150 
                                       f32_3 %164 = OpFAdd %162 %163 
                                                      OpStore %150 %164 
                              Uniform f32_4* %165 = OpAccessChain %72 %117 %117 
                                       f32_4 %166 = OpLoad %165 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_3 %168 = OpLoad %100 
                                       f32_3 %169 = OpVectorShuffle %168 %168 2 2 2 
                                       f32_3 %170 = OpFMul %167 %169 
                                       f32_3 %171 = OpLoad %150 
                                       f32_3 %172 = OpFAdd %170 %171 
                                                      OpStore %150 %172 
                                       f32_3 %173 = OpLoad %150 
                              Uniform f32_4* %174 = OpAccessChain %72 %117 %127 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFAdd %173 %176 
                                                      OpStore %150 %177 
                                        bool %180 = OpLoad %132 
                                                      OpSelectionMerge %182 None 
                                                      OpBranchConditional %180 %181 %184 
                                             %181 = OpLabel 
                                       f32_3 %183 = OpLoad %150 
                                                      OpStore %179 %183 
                                                      OpBranch %182 
                                             %184 = OpLabel 
                                       f32_3 %185 = OpLoad %100 
                                                      OpStore %179 %185 
                                                      OpBranch %182 
                                             %182 = OpLabel 
                                       f32_3 %186 = OpLoad %179 
                                                      OpStore %150 %186 
                                       f32_3 %187 = OpLoad %150 
                              Uniform f32_3* %190 = OpAccessChain %72 %188 
                                       f32_3 %191 = OpLoad %190 
                                       f32_3 %192 = OpFNegate %191 
                                       f32_3 %193 = OpFAdd %187 %192 
                                                      OpStore %150 %193 
                                       f32_3 %195 = OpLoad %150 
                              Uniform f32_3* %196 = OpAccessChain %72 %127 
                                       f32_3 %197 = OpLoad %196 
                                       f32_3 %198 = OpFMul %195 %197 
                                       f32_4 %199 = OpLoad %194 
                                       f32_4 %200 = OpVectorShuffle %199 %198 0 4 5 6 
                                                      OpStore %194 %200 
                                Private f32* %202 = OpAccessChain %194 %146 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %207 = OpFAdd %205 %206 
                                                      OpStore %201 %207 
                                Uniform f32* %209 = OpAccessChain %72 %90 %208 
                                         f32 %210 = OpLoad %209 
                                         f32 %212 = OpFMul %210 %211 
                                         f32 %213 = OpFAdd %212 %206 
                                Private f32* %214 = OpAccessChain %150 %30 
                                                      OpStore %214 %213 
                                         f32 %215 = OpLoad %201 
                                Private f32* %216 = OpAccessChain %150 %30 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpExtInst %1 40 %215 %217 
                                Private f32* %219 = OpAccessChain %194 %30 
                                                      OpStore %219 %218 
                  read_only Texture3DSampled %224 = OpLoad %223 
                                       f32_4 %225 = OpLoad %194 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 2 3 
                                       f32_4 %227 = OpImageSampleImplicitLod %224 %226 
                                                      OpStore %194 %227 
                                       f32_4 %228 = OpLoad %194 
                                                      OpStore %20 %228 
                                                      OpBranch %145 
                                             %229 = OpLabel 
                                Private f32* %230 = OpAccessChain %20 %30 
                                                      OpStore %230 %135 
                                Private f32* %231 = OpAccessChain %20 %146 
                                                      OpStore %231 %135 
                                Private f32* %232 = OpAccessChain %20 %208 
                                                      OpStore %232 %135 
                                Private f32* %233 = OpAccessChain %20 %64 
                                                      OpStore %233 %135 
                                                      OpBranch %145 
                                             %145 = OpLabel 
                                       f32_4 %235 = OpLoad %20 
                              Uniform f32_4* %236 = OpAccessChain %72 %89 
                                       f32_4 %237 = OpLoad %236 
                                         f32 %238 = OpDot %235 %237 
                                Private f32* %239 = OpAccessChain %234 %30 
                                                      OpStore %239 %238 
                                Private f32* %240 = OpAccessChain %234 %30 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpExtInst %1 43 %241 %86 %135 
                                Private f32* %243 = OpAccessChain %234 %30 
                                                      OpStore %243 %242 
                                       f32_3 %244 = OpLoad %98 
                                       f32_3 %245 = OpLoad %98 
                                         f32 %246 = OpDot %244 %245 
                                                      OpStore %201 %246 
                  read_only Texture2DSampled %248 = OpLoad %247 
                                         f32 %249 = OpLoad %201 
                                       f32_2 %250 = OpCompositeConstruct %249 %249 
                                       f32_4 %251 = OpImageSampleImplicitLod %248 %250 
                                         f32 %252 = OpCompositeExtract %251 3 
                                                      OpStore %201 %252 
                read_only TextureCubeSampled %257 = OpLoad %256 
                                       f32_3 %258 = OpLoad %98 
                                       f32_4 %259 = OpImageSampleImplicitLod %257 %258 
                                         f32 %260 = OpCompositeExtract %259 3 
                                Private f32* %261 = OpAccessChain %98 %30 
                                                      OpStore %261 %260 
                                Private f32* %262 = OpAccessChain %98 %30 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpLoad %201 
                                         f32 %265 = OpFMul %263 %264 
                                Private f32* %266 = OpAccessChain %98 %30 
                                                      OpStore %266 %265 
                                Private f32* %267 = OpAccessChain %234 %30 
                                         f32 %268 = OpLoad %267 
                                Private f32* %269 = OpAccessChain %98 %30 
                                         f32 %270 = OpLoad %269 
                                         f32 %271 = OpFMul %268 %270 
                                Private f32* %272 = OpAccessChain %98 %30 
                                                      OpStore %272 %271 
                                       f32_3 %273 = OpLoad %48 
                              Uniform f32_4* %275 = OpAccessChain %72 %274 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                       f32_3 %278 = OpFMul %273 %277 
                                                      OpStore %234 %278 
                                       f32_3 %281 = OpLoad %98 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 0 
                                       f32_3 %283 = OpLoad %234 
                                       f32_3 %284 = OpFMul %282 %283 
                                       f32_4 %285 = OpLoad %280 
                                       f32_4 %286 = OpVectorShuffle %285 %284 4 5 6 3 
                                                      OpStore %280 %286 
                                Private f32* %287 = OpAccessChain %9 %64 
                                         f32 %288 = OpLoad %287 
                                 Output f32* %290 = OpAccessChain %280 %64 
                                                      OpStore %290 %288 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec2 u_xlat1;
float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat16_4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_4 = u_xlat16_1 * u_xlat16_4;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat0.xyz = u_xlat10_0.xyz + (-vs_COLOR0.xyz);
    u_xlat0.xyz = vec3(u_xlat16_1) * u_xlat0.xyz + vs_COLOR0.xyz;
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
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
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 158
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %150 
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
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate %151 RelaxedPrecision 
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
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                               Output f32_4* %149 = OpVariable Output 
                                Input f32_4* %150 = OpVariable Input 
                                             %152 = OpTypePointer Output %6 
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
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                       f32_4 %151 = OpLoad %150 
                                                      OpStore %149 %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                 Output f32* %156 = OpAccessChain %81 %23 %77 
                                                      OpStore %156 %155 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 275
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %52 %101 %263 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %52 Location 52 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %68 ArrayStride 68 
                                                      OpDecorate %69 ArrayStride 69 
                                                      OpMemberDecorate %70 0 RelaxedPrecision 
                                                      OpMemberDecorate %70 0 Offset 70 
                                                      OpMemberDecorate %70 1 Offset 70 
                                                      OpMemberDecorate %70 2 Offset 70 
                                                      OpMemberDecorate %70 3 Offset 70 
                                                      OpMemberDecorate %70 4 Offset 70 
                                                      OpMemberDecorate %70 5 RelaxedPrecision 
                                                      OpMemberDecorate %70 5 Offset 70 
                                                      OpMemberDecorate %70 6 Offset 70 
                                                      OpMemberDecorate %70 7 RelaxedPrecision 
                                                      OpMemberDecorate %70 7 Offset 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %72 DescriptorSet 72 
                                                      OpDecorate %72 Binding 72 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %101 Location 101 
                                                      OpDecorate %144 SpecId 144 
                                                      OpDecorate %223 DescriptorSet 223 
                                                      OpDecorate %223 Binding 223 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %244 DescriptorSet 244 
                                                      OpDecorate %244 Binding 244 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %263 Location 263 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
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
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                 Private f32* %33 = OpVariable Private 
                                              %47 = OpTypePointer Private %21 
                               Private f32_3* %48 = OpVariable Private 
                                              %51 = OpTypePointer Input %7 
                                 Input f32_4* %52 = OpVariable Input 
                                          u32 %64 = OpConstant 3 
                                          u32 %67 = OpConstant 4 
                                              %68 = OpTypeArray %7 %67 
                                              %69 = OpTypeArray %7 %67 
                                              %70 = OpTypeStruct %7 %7 %68 %21 %21 %7 %69 %6 
                                              %71 = OpTypePointer Uniform %70 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32;}* %72 = OpVariable Uniform 
                                              %73 = OpTypeInt 32 1 
                                          i32 %74 = OpConstant 7 
                                              %75 = OpTypePointer Uniform %6 
                                              %81 = OpTypeBool 
                                              %82 = OpTypePointer Private %81 
                                Private bool* %83 = OpVariable Private 
                                          f32 %86 = OpConstant 3.67402E-40 
                                          i32 %89 = OpConstant 0 
                                          i32 %90 = OpConstant 1 
                                          i32 %92 = OpConstant -1 
                                              %98 = OpTypePointer Private %15 
                               Private f32_2* %99 = OpVariable Private 
                                             %100 = OpTypePointer Input %21 
                                Input f32_3* %101 = OpVariable Input 
                                         i32 %104 = OpConstant 6 
                                             %105 = OpTypePointer Uniform %7 
                                         i32 %118 = OpConstant 2 
                                         i32 %128 = OpConstant 3 
                               Private bool* %133 = OpVariable Private 
                                         f32 %136 = OpConstant 3.67402E-40 
                                        bool %138 = OpConstantFalse 
                                        bool %144 = OpSpecConstantFalse 
                                         u32 %147 = OpConstant 1 
                              Private f32_3* %151 = OpVariable Private 
                                             %179 = OpTypePointer Function %21 
                                         i32 %189 = OpConstant 4 
                                             %190 = OpTypePointer Uniform %21 
                              Private f32_4* %195 = OpVariable Private 
                                Private f32* %202 = OpVariable Private 
                                         f32 %205 = OpConstant 3.67402E-40 
                                         f32 %207 = OpConstant 3.67402E-40 
                                Private f32* %209 = OpVariable Private 
                                         u32 %210 = OpConstant 2 
                                         f32 %213 = OpConstant 3.67402E-40 
                                             %220 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %221 = OpTypeSampledImage %220 
                                             %222 = OpTypePointer UniformConstant %221 
 UniformConstant read_only Texture3DSampled* %223 = OpVariable UniformConstant 
                              Private f32_3* %234 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %244 = OpVariable UniformConstant 
                                         i32 %257 = OpConstant 5 
                                             %262 = OpTypePointer Output %7 
                               Output f32_4* %263 = OpVariable Output 
                                             %272 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %180 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                 Private f32* %34 = OpAccessChain %20 %30 
                                          f32 %35 = OpLoad %34 
                                 Private f32* %36 = OpAccessChain %20 %30 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFMul %35 %37 
                                                      OpStore %33 %38 
                                 Private f32* %39 = OpAccessChain %20 %30 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpLoad %33 
                                          f32 %42 = OpFMul %40 %41 
                                                      OpStore %33 %42 
                                 Private f32* %43 = OpAccessChain %20 %30 
                                          f32 %44 = OpLoad %43 
                                          f32 %45 = OpLoad %33 
                                          f32 %46 = OpFMul %44 %45 
                                                      OpStore %33 %46 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpFNegate %54 
                                        f32_3 %56 = OpFAdd %50 %55 
                                                      OpStore %48 %56 
                                          f32 %57 = OpLoad %33 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_3 %59 = OpLoad %48 
                                        f32_3 %60 = OpFMul %58 %59 
                                        f32_4 %61 = OpLoad %52 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                                      OpStore %48 %63 
                                 Private f32* %65 = OpAccessChain %9 %64 
                                          f32 %66 = OpLoad %65 
                                 Uniform f32* %76 = OpAccessChain %72 %74 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpFNegate %77 
                                          f32 %79 = OpFAdd %66 %78 
                                 Private f32* %80 = OpAccessChain %20 %30 
                                                      OpStore %80 %79 
                                 Private f32* %84 = OpAccessChain %20 %30 
                                          f32 %85 = OpLoad %84 
                                         bool %87 = OpFOrdLessThan %85 %86 
                                                      OpStore %83 %87 
                                         bool %88 = OpLoad %83 
                                          i32 %91 = OpSelect %88 %90 %89 
                                          i32 %93 = OpIMul %91 %92 
                                         bool %94 = OpINotEqual %93 %89 
                                                      OpSelectionMerge %96 None 
                                                      OpBranchConditional %94 %95 %96 
                                              %95 = OpLabel 
                                                      OpKill
                                              %96 = OpLabel 
                                       f32_3 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 1 1 
                              Uniform f32_4* %106 = OpAccessChain %72 %104 %90 
                                       f32_4 %107 = OpLoad %106 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpFMul %103 %108 
                                                      OpStore %99 %109 
                              Uniform f32_4* %110 = OpAccessChain %72 %104 %89 
                                       f32_4 %111 = OpLoad %110 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_3 %113 = OpLoad %101 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %112 %114 
                                       f32_2 %116 = OpLoad %99 
                                       f32_2 %117 = OpFAdd %115 %116 
                                                      OpStore %99 %117 
                              Uniform f32_4* %119 = OpAccessChain %72 %104 %118 
                                       f32_4 %120 = OpLoad %119 
                                       f32_2 %121 = OpVectorShuffle %120 %120 0 1 
                                       f32_3 %122 = OpLoad %101 
                                       f32_2 %123 = OpVectorShuffle %122 %122 2 2 
                                       f32_2 %124 = OpFMul %121 %123 
                                       f32_2 %125 = OpLoad %99 
                                       f32_2 %126 = OpFAdd %124 %125 
                                                      OpStore %99 %126 
                                       f32_2 %127 = OpLoad %99 
                              Uniform f32_4* %129 = OpAccessChain %72 %104 %128 
                                       f32_4 %130 = OpLoad %129 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                       f32_2 %132 = OpFAdd %127 %131 
                                                      OpStore %99 %132 
                                Uniform f32* %134 = OpAccessChain %72 %90 %30 
                                         f32 %135 = OpLoad %134 
                                        bool %137 = OpFOrdEqual %135 %136 
                                                      OpStore %133 %137 
                                                      OpSelectionMerge %140 None 
                                                      OpBranchConditional %138 %139 %140 
                                             %139 = OpLabel 
                                        bool %141 = OpLoad %133 
                                                      OpSelectionMerge %143 None 
                                                      OpBranchConditional %141 %142 %143 
                                             %142 = OpLabel 
                                                      OpBranch %143 
                                             %143 = OpLabel 
                                                      OpBranch %140 
                                             %140 = OpLabel 
                                                      OpSelectionMerge %146 None 
                                                      OpBranchConditional %144 %145 %229 
                                             %145 = OpLabel 
                                Uniform f32* %148 = OpAccessChain %72 %90 %147 
                                         f32 %149 = OpLoad %148 
                                        bool %150 = OpFOrdEqual %149 %136 
                                                      OpStore %133 %150 
                                       f32_3 %152 = OpLoad %101 
                                       f32_3 %153 = OpVectorShuffle %152 %152 1 1 1 
                              Uniform f32_4* %154 = OpAccessChain %72 %118 %90 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                       f32_3 %157 = OpFMul %153 %156 
                                                      OpStore %151 %157 
                              Uniform f32_4* %158 = OpAccessChain %72 %118 %89 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_3 %161 = OpLoad %101 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 0 0 
                                       f32_3 %163 = OpFMul %160 %162 
                                       f32_3 %164 = OpLoad %151 
                                       f32_3 %165 = OpFAdd %163 %164 
                                                      OpStore %151 %165 
                              Uniform f32_4* %166 = OpAccessChain %72 %118 %118 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpLoad %101 
                                       f32_3 %170 = OpVectorShuffle %169 %169 2 2 2 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_3 %172 = OpLoad %151 
                                       f32_3 %173 = OpFAdd %171 %172 
                                                      OpStore %151 %173 
                                       f32_3 %174 = OpLoad %151 
                              Uniform f32_4* %175 = OpAccessChain %72 %118 %128 
                                       f32_4 %176 = OpLoad %175 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %178 = OpFAdd %174 %177 
                                                      OpStore %151 %178 
                                        bool %181 = OpLoad %133 
                                                      OpSelectionMerge %183 None 
                                                      OpBranchConditional %181 %182 %185 
                                             %182 = OpLabel 
                                       f32_3 %184 = OpLoad %151 
                                                      OpStore %180 %184 
                                                      OpBranch %183 
                                             %185 = OpLabel 
                                       f32_3 %186 = OpLoad %101 
                                                      OpStore %180 %186 
                                                      OpBranch %183 
                                             %183 = OpLabel 
                                       f32_3 %187 = OpLoad %180 
                                                      OpStore %151 %187 
                                       f32_3 %188 = OpLoad %151 
                              Uniform f32_3* %191 = OpAccessChain %72 %189 
                                       f32_3 %192 = OpLoad %191 
                                       f32_3 %193 = OpFNegate %192 
                                       f32_3 %194 = OpFAdd %188 %193 
                                                      OpStore %151 %194 
                                       f32_3 %196 = OpLoad %151 
                              Uniform f32_3* %197 = OpAccessChain %72 %128 
                                       f32_3 %198 = OpLoad %197 
                                       f32_3 %199 = OpFMul %196 %198 
                                       f32_4 %200 = OpLoad %195 
                                       f32_4 %201 = OpVectorShuffle %200 %199 0 4 5 6 
                                                      OpStore %195 %201 
                                Private f32* %203 = OpAccessChain %195 %147 
                                         f32 %204 = OpLoad %203 
                                         f32 %206 = OpFMul %204 %205 
                                         f32 %208 = OpFAdd %206 %207 
                                                      OpStore %202 %208 
                                Uniform f32* %211 = OpAccessChain %72 %90 %210 
                                         f32 %212 = OpLoad %211 
                                         f32 %214 = OpFMul %212 %213 
                                         f32 %215 = OpFAdd %214 %207 
                                                      OpStore %209 %215 
                                         f32 %216 = OpLoad %209 
                                         f32 %217 = OpLoad %202 
                                         f32 %218 = OpExtInst %1 40 %216 %217 
                                Private f32* %219 = OpAccessChain %195 %30 
                                                      OpStore %219 %218 
                  read_only Texture3DSampled %224 = OpLoad %223 
                                       f32_4 %225 = OpLoad %195 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 2 3 
                                       f32_4 %227 = OpImageSampleImplicitLod %224 %226 
                                                      OpStore %195 %227 
                                       f32_4 %228 = OpLoad %195 
                                                      OpStore %20 %228 
                                                      OpBranch %146 
                                             %229 = OpLabel 
                                Private f32* %230 = OpAccessChain %20 %30 
                                                      OpStore %230 %136 
                                Private f32* %231 = OpAccessChain %20 %147 
                                                      OpStore %231 %136 
                                Private f32* %232 = OpAccessChain %20 %210 
                                                      OpStore %232 %136 
                                Private f32* %233 = OpAccessChain %20 %64 
                                                      OpStore %233 %136 
                                                      OpBranch %146 
                                             %146 = OpLabel 
                                       f32_4 %235 = OpLoad %20 
                              Uniform f32_4* %236 = OpAccessChain %72 %89 
                                       f32_4 %237 = OpLoad %236 
                                         f32 %238 = OpDot %235 %237 
                                Private f32* %239 = OpAccessChain %234 %30 
                                                      OpStore %239 %238 
                                Private f32* %240 = OpAccessChain %234 %30 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpExtInst %1 43 %241 %86 %136 
                                Private f32* %243 = OpAccessChain %234 %30 
                                                      OpStore %243 %242 
                  read_only Texture2DSampled %245 = OpLoad %244 
                                       f32_2 %246 = OpLoad %99 
                                       f32_4 %247 = OpImageSampleImplicitLod %245 %246 
                                         f32 %248 = OpCompositeExtract %247 3 
                                Private f32* %249 = OpAccessChain %99 %30 
                                                      OpStore %249 %248 
                                Private f32* %250 = OpAccessChain %234 %30 
                                         f32 %251 = OpLoad %250 
                                Private f32* %252 = OpAccessChain %99 %30 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFMul %251 %253 
                                Private f32* %255 = OpAccessChain %99 %30 
                                                      OpStore %255 %254 
                                       f32_3 %256 = OpLoad %48 
                              Uniform f32_4* %258 = OpAccessChain %72 %257 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_3 %261 = OpFMul %256 %260 
                                                      OpStore %234 %261 
                                       f32_2 %264 = OpLoad %99 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 0 0 
                                       f32_3 %266 = OpLoad %234 
                                       f32_3 %267 = OpFMul %265 %266 
                                       f32_4 %268 = OpLoad %263 
                                       f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
                                                      OpStore %263 %269 
                                Private f32* %270 = OpAccessChain %9 %64 
                                         f32 %271 = OpLoad %270 
                                 Output f32* %273 = OpAccessChain %263 %64 
                                                      OpStore %273 %271 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
""
}
SubProgram "vulkan " {
Keywords { "POINT" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
""
}
SubProgram "vulkan " {
Keywords { "SPOT" }
""
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
}
}
 Pass {
  Name "META"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 164711
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
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
in  vec4 in_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform 	float unity_UseLinearSpace;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
float u_xlat16_1;
vec3 u_xlat2;
float u_xlat9;
float u_xlat16_9;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat9 = u_xlat10_0.w + (-_Cutoff);
    u_xlatb9 = u_xlat9<0.0;
    if((int(u_xlatb9) * int(0xffffffffu))!=0){discard;}
    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat0.xyz = u_xlat10_0.xyz + (-vs_COLOR0.xyz);
    u_xlat16_1 = u_xlat16_9 * u_xlat16_9;
    u_xlat16_1 = u_xlat16_9 * u_xlat16_1;
    u_xlat16_9 = u_xlat16_9 * u_xlat16_1;
    u_xlat0.xyz = vec3(u_xlat16_9) * u_xlat0.xyz + vs_COLOR0.xyz;
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat9 = unity_OneOverOutputBoost;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xyz * vec3(u_xlat9);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(_EmissivePower);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = min(u_xlat1.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
    u_xlat1.w = 1.0;
    u_xlat1 = (unity_MetaFragmentControl.x) ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlatb9 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(unity_UseLinearSpace);
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat2.xyz;
    u_xlat0.w = 1.0;
    SV_Target0 = (unity_MetaFragmentControl.y) ? u_xlat0 : u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 226
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %32 %89 %166 %177 %178 %190 %191 %212 
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
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %190 Location 190 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %191 Location 191 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %212 Location 212 
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
                               Output f32_4* %190 = OpVariable Output 
                                Input f32_4* %191 = OpVariable Input 
                               Output f32_4* %212 = OpVariable Output 
                                             %220 = OpTypePointer Output %9 
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
                                       f32_4 %192 = OpLoad %191 
                                                      OpStore %190 %192 
                                       f32_4 %193 = OpLoad %13 
                                       f32_4 %194 = OpVectorShuffle %193 %193 1 1 1 1 
                              Uniform f32_4* %195 = OpAccessChain %42 %120 %121 
                                       f32_4 %196 = OpLoad %195 
                                       f32_4 %197 = OpFMul %194 %196 
                                                      OpStore %21 %197 
                              Uniform f32_4* %198 = OpAccessChain %42 %120 %120 
                                       f32_4 %199 = OpLoad %198 
                                       f32_4 %200 = OpLoad %13 
                                       f32_4 %201 = OpVectorShuffle %200 %200 0 0 0 0 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %21 
                                       f32_4 %204 = OpFAdd %202 %203 
                                                      OpStore %21 %204 
                              Uniform f32_4* %205 = OpAccessChain %42 %120 %44 
                                       f32_4 %206 = OpLoad %205 
                                       f32_4 %207 = OpLoad %13 
                                       f32_4 %208 = OpVectorShuffle %207 %207 2 2 2 2 
                                       f32_4 %209 = OpFMul %206 %208 
                                       f32_4 %210 = OpLoad %21 
                                       f32_4 %211 = OpFAdd %209 %210 
                                                      OpStore %21 %211 
                              Uniform f32_4* %213 = OpAccessChain %42 %120 %92 
                                       f32_4 %214 = OpLoad %213 
                                       f32_4 %215 = OpLoad %13 
                                       f32_4 %216 = OpVectorShuffle %215 %215 3 3 3 3 
                                       f32_4 %217 = OpFMul %214 %216 
                                       f32_4 %218 = OpLoad %21 
                                       f32_4 %219 = OpFAdd %217 %218 
                                                      OpStore %212 %219 
                                 Output f32* %221 = OpAccessChain %166 %120 %162 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFNegate %222 
                                 Output f32* %224 = OpAccessChain %166 %120 %162 
                                                      OpStore %224 %223 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %69 %220 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpMemberDecorate %27 6 RelaxedPrecision 
                                                      OpMemberDecorate %27 6 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %69 Location 69 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %95 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %117 RelaxedPrecision 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %121 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %129 RelaxedPrecision 
                                                      OpDecorate %130 RelaxedPrecision 
                                                      OpDecorate %131 RelaxedPrecision 
                                                      OpDecorate %132 RelaxedPrecision 
                                                      OpDecorate %133 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %220 Location 220 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
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
                                          u32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Private %6 
                                              %26 = OpTypeVector %21 4 
                                              %27 = OpTypeStruct %6 %6 %26 %6 %6 %6 %6 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32; f32; u32_4; f32; f32; f32; f32;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 6 
                                              %32 = OpTypePointer Uniform %6 
                                          u32 %37 = OpConstant 0 
                                              %39 = OpTypeBool 
                                              %40 = OpTypePointer Private %39 
                                Private bool* %41 = OpVariable Private 
                                          f32 %44 = OpConstant 3.67402E-40 
                                          i32 %47 = OpConstant 0 
                                          i32 %48 = OpConstant 1 
                                          i32 %50 = OpConstant -1 
                                              %56 = OpTypeVector %6 3 
                                          f32 %59 = OpConstant 3.67402E-40 
                                          f32 %60 = OpConstant 3.67402E-40 
                                          f32 %61 = OpConstant 3.67402E-40 
                                        f32_3 %62 = OpConstantComposite %59 %60 %61 
                               Private f32_4* %65 = OpVariable Private 
                                              %68 = OpTypePointer Input %7 
                                 Input f32_4* %69 = OpVariable Input 
                                 Private f32* %76 = OpVariable Private 
                                Private f32* %105 = OpVariable Private 
                                         i32 %106 = OpConstant 3 
                                         f32 %110 = OpConstant 3.67402E-40 
                                             %112 = OpTypePointer Private %56 
                              Private f32_3* %113 = OpVariable Private 
                              Private f32_3* %119 = OpVariable Private 
                                         i32 %144 = OpConstant 4 
                                             %157 = OpTypePointer Function %56 
                                         i32 %159 = OpConstant 2 
                                             %160 = OpTypeVector %39 4 
                                             %161 = OpTypePointer Uniform %26 
                                       f32_3 %170 = OpConstantComposite %44 %44 %44 
                                         f32 %175 = OpConstant 3.67402E-40 
                                       f32_3 %176 = OpConstantComposite %175 %175 %175 
                                         f32 %178 = OpConstant 3.67402E-40 
                                       f32_3 %179 = OpConstantComposite %178 %178 %178 
                                         f32 %184 = OpConstant 3.67402E-40 
                                       f32_3 %185 = OpConstantComposite %184 %184 %184 
                                       f32_4 %190 = OpConstantComposite %44 %44 %44 %44 
                                         i32 %191 = OpConstant 5 
                                             %207 = OpTypePointer Function %6 
                                             %219 = OpTypePointer Output %7 
                               Output f32_4* %220 = OpVariable Output 
                                             %221 = OpTypePointer Function %7 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %158 = OpVariable Function 
                             Function f32_3* %197 = OpVariable Function 
                               Function f32* %208 = OpVariable Function 
                             Function f32_4* %222 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %24 = OpAccessChain %9 %22 
                                          f32 %25 = OpLoad %24 
                                 Uniform f32* %33 = OpAccessChain %29 %31 
                                          f32 %34 = OpLoad %33 
                                          f32 %35 = OpFNegate %34 
                                          f32 %36 = OpFAdd %25 %35 
                                 Private f32* %38 = OpAccessChain %20 %37 
                                                      OpStore %38 %36 
                                 Private f32* %42 = OpAccessChain %20 %37 
                                          f32 %43 = OpLoad %42 
                                         bool %45 = OpFOrdLessThan %43 %44 
                                                      OpStore %41 %45 
                                         bool %46 = OpLoad %41 
                                          i32 %49 = OpSelect %46 %48 %47 
                                          i32 %51 = OpIMul %49 %50 
                                         bool %52 = OpINotEqual %51 %47 
                                                      OpSelectionMerge %54 None 
                                                      OpBranchConditional %52 %53 %54 
                                              %53 = OpLabel 
                                                      OpKill
                                              %54 = OpLabel 
                                        f32_4 %57 = OpLoad %9 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                          f32 %63 = OpDot %58 %62 
                                 Private f32* %64 = OpAccessChain %20 %37 
                                                      OpStore %64 %63 
                                        f32_4 %66 = OpLoad %9 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFNegate %71 
                                        f32_3 %73 = OpFAdd %67 %72 
                                        f32_4 %74 = OpLoad %65 
                                        f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                                      OpStore %65 %75 
                                 Private f32* %77 = OpAccessChain %20 %37 
                                          f32 %78 = OpLoad %77 
                                 Private f32* %79 = OpAccessChain %20 %37 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFMul %78 %80 
                                                      OpStore %76 %81 
                                 Private f32* %82 = OpAccessChain %20 %37 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpLoad %76 
                                          f32 %85 = OpFMul %83 %84 
                                                      OpStore %76 %85 
                                 Private f32* %86 = OpAccessChain %20 %37 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpLoad %76 
                                          f32 %89 = OpFMul %87 %88 
                                                      OpStore %76 %89 
                                          f32 %90 = OpLoad %76 
                                        f32_3 %91 = OpCompositeConstruct %90 %90 %90 
                                        f32_4 %92 = OpLoad %65 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpFMul %91 %93 
                                        f32_4 %95 = OpLoad %69 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                        f32_4 %98 = OpLoad %65 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                      OpStore %65 %99 
                                       f32_4 %100 = OpLoad %65 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpExtInst %1 30 %101 
                                       f32_4 %103 = OpLoad %65 
                                       f32_4 %104 = OpVectorShuffle %103 %102 4 5 6 3 
                                                      OpStore %65 %104 
                                Uniform f32* %107 = OpAccessChain %29 %106 
                                         f32 %108 = OpLoad %107 
                                                      OpStore %105 %108 
                                         f32 %109 = OpLoad %105 
                                         f32 %111 = OpExtInst %1 43 %109 %44 %110 
                                                      OpStore %105 %111 
                                       f32_4 %114 = OpLoad %65 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                         f32 %116 = OpLoad %105 
                                       f32_3 %117 = OpCompositeConstruct %116 %116 %116 
                                       f32_3 %118 = OpFMul %115 %117 
                                                      OpStore %113 %118 
                                       f32_4 %120 = OpLoad %65 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                Uniform f32* %122 = OpAccessChain %29 %48 
                                         f32 %123 = OpLoad %122 
                                Uniform f32* %124 = OpAccessChain %29 %48 
                                         f32 %125 = OpLoad %124 
                                Uniform f32* %126 = OpAccessChain %29 %48 
                                         f32 %127 = OpLoad %126 
                                       f32_3 %128 = OpCompositeConstruct %123 %125 %127 
                                         f32 %129 = OpCompositeExtract %128 0 
                                         f32 %130 = OpCompositeExtract %128 1 
                                         f32 %131 = OpCompositeExtract %128 2 
                                       f32_3 %132 = OpCompositeConstruct %129 %130 %131 
                                       f32_3 %133 = OpFMul %121 %132 
                                                      OpStore %119 %133 
                                       f32_3 %134 = OpLoad %119 
                                       f32_3 %135 = OpExtInst %1 29 %134 
                                                      OpStore %119 %135 
                                       f32_3 %136 = OpLoad %119 
                                Uniform f32* %137 = OpAccessChain %29 %47 
                                         f32 %138 = OpLoad %137 
                                       f32_3 %139 = OpCompositeConstruct %138 %138 %138 
                                       f32_3 %140 = OpFMul %136 %139 
                                                      OpStore %119 %140 
                                       f32_3 %141 = OpLoad %113 
                                       f32_3 %142 = OpExtInst %1 29 %141 
                                                      OpStore %113 %142 
                                       f32_3 %143 = OpLoad %113 
                                Uniform f32* %145 = OpAccessChain %29 %144 
                                         f32 %146 = OpLoad %145 
                                Uniform f32* %147 = OpAccessChain %29 %144 
                                         f32 %148 = OpLoad %147 
                                Uniform f32* %149 = OpAccessChain %29 %144 
                                         f32 %150 = OpLoad %149 
                                       f32_3 %151 = OpCompositeConstruct %146 %148 %150 
                                         f32 %152 = OpCompositeExtract %151 0 
                                         f32 %153 = OpCompositeExtract %151 1 
                                         f32 %154 = OpCompositeExtract %151 2 
                                       f32_3 %155 = OpCompositeConstruct %152 %153 %154 
                                       f32_3 %156 = OpExtInst %1 37 %143 %155 
                                                      OpStore %113 %156 
                              Uniform u32_4* %162 = OpAccessChain %29 %159 
                                       u32_4 %163 = OpLoad %162 
                                         u32 %164 = OpCompositeExtract %163 0 
                                        bool %165 = OpINotEqual %164 %37 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %165 %166 %169 
                                             %166 = OpLabel 
                                       f32_3 %168 = OpLoad %113 
                                                      OpStore %158 %168 
                                                      OpBranch %167 
                                             %169 = OpLabel 
                                                      OpStore %158 %170 
                                                      OpBranch %167 
                                             %167 = OpLabel 
                                       f32_3 %171 = OpLoad %158 
                                       f32_4 %172 = OpLoad %20 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %20 %173 
                                       f32_3 %174 = OpLoad %119 
                                       f32_3 %177 = OpFMul %174 %176 
                                       f32_3 %180 = OpFAdd %177 %179 
                                                      OpStore %113 %180 
                                       f32_3 %181 = OpLoad %119 
                                       f32_3 %182 = OpLoad %113 
                                       f32_3 %183 = OpFMul %181 %182 
                                       f32_3 %186 = OpFAdd %183 %185 
                                                      OpStore %113 %186 
                                       f32_3 %187 = OpLoad %119 
                                       f32_3 %188 = OpLoad %113 
                                       f32_3 %189 = OpFMul %187 %188 
                                                      OpStore %113 %189 
                                Uniform f32* %192 = OpAccessChain %29 %191 
                                         f32 %193 = OpLoad %192 
                                       f32_4 %194 = OpCompositeConstruct %193 %193 %193 %193 
                                      bool_4 %195 = OpFOrdNotEqual %190 %194 
                                        bool %196 = OpAny %195 
                                                      OpStore %41 %196 
                                        bool %198 = OpLoad %41 
                                                      OpSelectionMerge %200 None 
                                                      OpBranchConditional %198 %199 %202 
                                             %199 = OpLabel 
                                       f32_3 %201 = OpLoad %119 
                                                      OpStore %197 %201 
                                                      OpBranch %200 
                                             %202 = OpLabel 
                                       f32_3 %203 = OpLoad %113 
                                                      OpStore %197 %203 
                                                      OpBranch %200 
                                             %200 = OpLabel 
                                       f32_3 %204 = OpLoad %197 
                                       f32_4 %205 = OpLoad %65 
                                       f32_4 %206 = OpVectorShuffle %205 %204 4 5 6 3 
                                                      OpStore %65 %206 
                              Uniform u32_4* %209 = OpAccessChain %29 %159 
                                       u32_4 %210 = OpLoad %209 
                                         u32 %211 = OpCompositeExtract %210 0 
                                        bool %212 = OpINotEqual %211 %37 
                                                      OpSelectionMerge %214 None 
                                                      OpBranchConditional %212 %213 %215 
                                             %213 = OpLabel 
                                                      OpStore %208 %110 
                                                      OpBranch %214 
                                             %215 = OpLabel 
                                                      OpStore %208 %44 
                                                      OpBranch %214 
                                             %214 = OpLabel 
                                         f32 %216 = OpLoad %208 
                                Private f32* %217 = OpAccessChain %20 %22 
                                                      OpStore %217 %216 
                                Private f32* %218 = OpAccessChain %65 %22 
                                                      OpStore %218 %110 
                              Uniform u32_4* %223 = OpAccessChain %29 %159 
                                       u32_4 %224 = OpLoad %223 
                                         u32 %225 = OpCompositeExtract %224 1 
                                        bool %226 = OpINotEqual %225 %37 
                                                      OpSelectionMerge %228 None 
                                                      OpBranchConditional %226 %227 %230 
                                             %227 = OpLabel 
                                       f32_4 %229 = OpLoad %65 
                                                      OpStore %222 %229 
                                                      OpBranch %228 
                                             %230 = OpLabel 
                                       f32_4 %231 = OpLoad %20 
                                                      OpStore %222 %231 
                                                      OpBranch %228 
                                             %228 = OpLabel 
                                       f32_4 %232 = OpLoad %222 
                                                      OpStore %220 %232 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
Fallback "VertexLit"
}