//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/LitTk2dCustomFalloffTilted" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 36798
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
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
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
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
        u_xlat2.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2.x);
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat4.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat2.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat2;
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
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 
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
                               Output f32_3* %149 = OpVariable Output 
                                         f32 %150 = OpConstant 3.67402E-40 
                                       f32_3 %151 = OpConstantComposite %150 %150 %150 
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
; Bound: 190
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %175 %178 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpMemberDecorate %27 0 RelaxedPrecision 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 RelaxedPrecision 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %44 SpecId 44 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 4 
                                              %25 = OpTypeArray %7 %24 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypeStruct %7 %7 %25 %26 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 1 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Uniform %6 
                                          f32 %36 = OpConstant 3.67402E-40 
                                         bool %38 = OpConstantFalse 
                                         bool %44 = OpSpecConstantFalse 
                                          u32 %47 = OpConstant 1 
                                              %51 = OpTypePointer Private %26 
                               Private f32_3* %52 = OpVariable Private 
                                              %53 = OpTypePointer Input %26 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 2 
                                              %58 = OpTypePointer Uniform %7 
                                          i32 %63 = OpConstant 0 
                                          i32 %81 = OpConstant 3 
                               Private f32_4* %86 = OpVariable Private 
                                              %87 = OpTypePointer Function %26 
                                         i32 %100 = OpConstant 4 
                                             %101 = OpTypePointer Uniform %26 
                                             %115 = OpTypePointer Private %6 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %120 = OpConstant 3.67402E-40 
                                Private f32* %123 = OpVariable Private 
                                         u32 %124 = OpConstant 2 
                                         f32 %127 = OpConstant 3.67402E-40 
                                             %135 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %136 = OpTypeSampledImage %135 
                                             %137 = OpTypePointer UniformConstant %136 
 UniformConstant read_only Texture3DSampled* %138 = OpVariable UniformConstant 
                              Private f32_4* %143 = OpVariable Private 
                                         u32 %149 = OpConstant 3 
                              Private f32_3* %151 = OpVariable Private 
                                         f32 %159 = OpConstant 3.67402E-40 
                              Private f32_3* %162 = OpVariable Private 
                                         i32 %165 = OpConstant 5 
                                             %174 = OpTypePointer Output %7 
                               Output f32_4* %175 = OpVariable Output 
                                Input f32_3* %178 = OpVariable Input 
                                             %187 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %88 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %34 = OpAccessChain %29 %31 %32 
                                          f32 %35 = OpLoad %34 
                                         bool %37 = OpFOrdEqual %35 %36 
                                                      OpStore %22 %37 
                                                      OpSelectionMerge %40 None 
                                                      OpBranchConditional %38 %39 %40 
                                              %39 = OpLabel 
                                         bool %41 = OpLoad %22 
                                                      OpSelectionMerge %43 None 
                                                      OpBranchConditional %41 %42 %43 
                                              %42 = OpLabel 
                                                      OpBranch %43 
                                              %43 = OpLabel 
                                                      OpBranch %40 
                                              %40 = OpLabel 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %145 
                                              %45 = OpLabel 
                                 Uniform f32* %48 = OpAccessChain %29 %31 %47 
                                          f32 %49 = OpLoad %48 
                                         bool %50 = OpFOrdEqual %49 %36 
                                                      OpStore %22 %50 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %29 %57 %31 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFMul %56 %61 
                                                      OpStore %52 %62 
                               Uniform f32_4* %64 = OpAccessChain %29 %57 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                        f32_3 %67 = OpLoad %54 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 0 0 
                                        f32_3 %69 = OpFMul %66 %68 
                                        f32_3 %70 = OpLoad %52 
                                        f32_3 %71 = OpFAdd %69 %70 
                                                      OpStore %52 %71 
                               Uniform f32_4* %72 = OpAccessChain %29 %57 %57 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpLoad %54 
                                        f32_3 %76 = OpVectorShuffle %75 %75 2 2 2 
                                        f32_3 %77 = OpFMul %74 %76 
                                        f32_3 %78 = OpLoad %52 
                                        f32_3 %79 = OpFAdd %77 %78 
                                                      OpStore %52 %79 
                                        f32_3 %80 = OpLoad %52 
                               Uniform f32_4* %82 = OpAccessChain %29 %57 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFAdd %80 %84 
                                                      OpStore %52 %85 
                                         bool %89 = OpLoad %22 
                                                      OpSelectionMerge %91 None 
                                                      OpBranchConditional %89 %90 %93 
                                              %90 = OpLabel 
                                        f32_3 %92 = OpLoad %52 
                                                      OpStore %88 %92 
                                                      OpBranch %91 
                                              %93 = OpLabel 
                                        f32_3 %94 = OpLoad %54 
                                                      OpStore %88 %94 
                                                      OpBranch %91 
                                              %91 = OpLabel 
                                        f32_3 %95 = OpLoad %88 
                                        f32_4 %96 = OpLoad %86 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %86 %97 
                                        f32_4 %98 = OpLoad %86 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                              Uniform f32_3* %102 = OpAccessChain %29 %100 
                                       f32_3 %103 = OpLoad %102 
                                       f32_3 %104 = OpFNegate %103 
                                       f32_3 %105 = OpFAdd %99 %104 
                                       f32_4 %106 = OpLoad %86 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %86 %107 
                                       f32_4 %108 = OpLoad %86 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                              Uniform f32_3* %110 = OpAccessChain %29 %81 
                                       f32_3 %111 = OpLoad %110 
                                       f32_3 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %86 
                                       f32_4 %114 = OpVectorShuffle %113 %112 0 4 5 6 
                                                      OpStore %86 %114 
                                Private f32* %116 = OpAccessChain %86 %47 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %121 = OpFAdd %119 %120 
                                Private f32* %122 = OpAccessChain %52 %32 
                                                      OpStore %122 %121 
                                Uniform f32* %125 = OpAccessChain %29 %31 %124 
                                         f32 %126 = OpLoad %125 
                                         f32 %128 = OpFMul %126 %127 
                                         f32 %129 = OpFAdd %128 %120 
                                                      OpStore %123 %129 
                                Private f32* %130 = OpAccessChain %52 %32 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpLoad %123 
                                         f32 %133 = OpExtInst %1 40 %131 %132 
                                Private f32* %134 = OpAccessChain %86 %32 
                                                      OpStore %134 %133 
                  read_only Texture3DSampled %139 = OpLoad %138 
                                       f32_4 %140 = OpLoad %86 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 2 3 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                      OpStore %86 %142 
                                       f32_4 %144 = OpLoad %86 
                                                      OpStore %143 %144 
                                                      OpBranch %46 
                                             %145 = OpLabel 
                                Private f32* %146 = OpAccessChain %143 %32 
                                                      OpStore %146 %36 
                                Private f32* %147 = OpAccessChain %143 %47 
                                                      OpStore %147 %36 
                                Private f32* %148 = OpAccessChain %143 %124 
                                                      OpStore %148 %36 
                                Private f32* %150 = OpAccessChain %143 %149 
                                                      OpStore %150 %36 
                                                      OpBranch %46 
                                              %46 = OpLabel 
                                       f32_4 %152 = OpLoad %143 
                              Uniform f32_4* %153 = OpAccessChain %29 %63 
                                       f32_4 %154 = OpLoad %153 
                                         f32 %155 = OpDot %152 %154 
                                Private f32* %156 = OpAccessChain %151 %32 
                                                      OpStore %156 %155 
                                Private f32* %157 = OpAccessChain %151 %32 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpExtInst %1 43 %158 %159 %36 
                                Private f32* %161 = OpAccessChain %151 %32 
                                                      OpStore %161 %160 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %29 %165 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %164 %168 
                                                      OpStore %162 %169 
                                       f32_3 %170 = OpLoad %151 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 0 0 
                                       f32_3 %172 = OpLoad %162 
                                       f32_3 %173 = OpFMul %171 %172 
                                                      OpStore %151 %173 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %179 = OpLoad %178 
                                       f32_3 %180 = OpFMul %177 %179 
                                       f32_3 %181 = OpLoad %151 
                                       f32_3 %182 = OpFAdd %180 %181 
                                       f32_4 %183 = OpLoad %175 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %175 %184 
                                Private f32* %185 = OpAccessChain %9 %149 
                                         f32 %186 = OpLoad %185 
                                 Output f32* %188 = OpAccessChain %175 %149 
                                                      OpStore %188 %186 
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
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
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
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
        u_xlat2.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2.x);
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat4.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat2.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat2;
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
; Bound: 273
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %83 %95 %96 %110 %149 %152 %155 %264 
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
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
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
                                             %157 = OpTypePointer Private %108 
                              Private f32_3* %158 = OpVariable Private 
                              Private f32_4* %175 = OpVariable Private 
                              Private f32_3* %181 = OpVariable Private 
                                         i32 %187 = OpConstant 4 
                                         i32 %193 = OpConstant 5 
                                         i32 %199 = OpConstant 6 
                                         f32 %208 = OpConstant 3.67402E-40 
                                         u32 %209 = OpConstant 3 
                                         f32 %230 = OpConstant 3.67402E-40 
                                       f32_3 %231 = OpConstantComposite %230 %230 %230 
                                         f32 %239 = OpConstant 3.67402E-40 
                                       f32_3 %240 = OpConstantComposite %239 %239 %239 
                                         f32 %251 = OpConstant 3.67402E-40 
                                       f32_3 %252 = OpConstantComposite %251 %251 %251 
                                         f32 %254 = OpConstant 3.67402E-40 
                                       f32_3 %255 = OpConstantComposite %254 %254 %254 
                               Output f32_3* %264 = OpVariable Output 
                                             %267 = OpTypePointer Output %6 
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
                                Private f32* %159 = OpAccessChain %45 %79 
                                         f32 %160 = OpLoad %159 
                                Private f32* %161 = OpAccessChain %45 %79 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFMul %160 %162 
                                Private f32* %164 = OpAccessChain %158 %117 
                                                      OpStore %164 %163 
                                Private f32* %165 = OpAccessChain %45 %117 
                                         f32 %166 = OpLoad %165 
                                Private f32* %167 = OpAccessChain %45 %117 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFMul %166 %168 
                                Private f32* %170 = OpAccessChain %158 %117 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFNegate %171 
                                         f32 %173 = OpFAdd %169 %172 
                                Private f32* %174 = OpAccessChain %158 %117 
                                                      OpStore %174 %173 
                                       f32_4 %176 = OpLoad %45 
                                       f32_4 %177 = OpVectorShuffle %176 %176 1 2 2 0 
                                       f32_4 %178 = OpLoad %45 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 1 2 2 
                                       f32_4 %180 = OpFMul %177 %179 
                                                      OpStore %175 %180 
                              Uniform f32_4* %182 = OpAccessChain %21 %47 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpLoad %175 
                                         f32 %185 = OpDot %183 %184 
                                Private f32* %186 = OpAccessChain %181 %117 
                                                      OpStore %186 %185 
                              Uniform f32_4* %188 = OpAccessChain %21 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpLoad %175 
                                         f32 %191 = OpDot %189 %190 
                                Private f32* %192 = OpAccessChain %181 %79 
                                                      OpStore %192 %191 
                              Uniform f32_4* %194 = OpAccessChain %21 %193 
                                       f32_4 %195 = OpLoad %194 
                                       f32_4 %196 = OpLoad %175 
                                         f32 %197 = OpDot %195 %196 
                                Private f32* %198 = OpAccessChain %181 %131 
                                                      OpStore %198 %197 
                              Uniform f32_4* %200 = OpAccessChain %21 %199 
                                       f32_4 %201 = OpLoad %200 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 2 
                                       f32_3 %203 = OpLoad %158 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 0 0 
                                       f32_3 %205 = OpFMul %202 %204 
                                       f32_3 %206 = OpLoad %181 
                                       f32_3 %207 = OpFAdd %205 %206 
                                                      OpStore %158 %207 
                                Private f32* %210 = OpAccessChain %45 %209 
                                                      OpStore %210 %208 
                              Uniform f32_4* %211 = OpAccessChain %21 %29 
                                       f32_4 %212 = OpLoad %211 
                                       f32_4 %213 = OpLoad %45 
                                         f32 %214 = OpDot %212 %213 
                                Private f32* %215 = OpAccessChain %181 %117 
                                                      OpStore %215 %214 
                              Uniform f32_4* %216 = OpAccessChain %21 %24 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %45 
                                         f32 %219 = OpDot %217 %218 
                                Private f32* %220 = OpAccessChain %181 %79 
                                                      OpStore %220 %219 
                              Uniform f32_4* %221 = OpAccessChain %21 %37 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpLoad %45 
                                         f32 %224 = OpDot %222 %223 
                                Private f32* %225 = OpAccessChain %181 %131 
                                                      OpStore %225 %224 
                                       f32_3 %226 = OpLoad %158 
                                       f32_3 %227 = OpLoad %181 
                                       f32_3 %228 = OpFAdd %226 %227 
                                                      OpStore %158 %228 
                                       f32_3 %229 = OpLoad %158 
                                       f32_3 %232 = OpExtInst %1 40 %229 %231 
                                                      OpStore %158 %232 
                                       f32_3 %233 = OpLoad %158 
                                       f32_3 %234 = OpExtInst %1 30 %233 
                                       f32_4 %235 = OpLoad %45 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 6 3 
                                                      OpStore %45 %236 
                                       f32_4 %237 = OpLoad %45 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %241 = OpFMul %238 %240 
                                       f32_4 %242 = OpLoad %45 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 6 3 
                                                      OpStore %45 %243 
                                       f32_4 %244 = OpLoad %45 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                       f32_3 %246 = OpExtInst %1 29 %245 
                                       f32_4 %247 = OpLoad %45 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %45 %248 
                                       f32_4 %249 = OpLoad %45 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %253 = OpFMul %250 %252 
                                       f32_3 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %45 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                      OpStore %45 %258 
                                       f32_4 %259 = OpLoad %45 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_3 %261 = OpExtInst %1 40 %260 %231 
                                       f32_4 %262 = OpLoad %45 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %45 %263 
                                       f32_4 %265 = OpLoad %45 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                                      OpStore %264 %266 
                                 Output f32* %268 = OpAccessChain %83 %29 %79 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpFNegate %269 
                                 Output f32* %271 = OpAccessChain %83 %29 %79 
                                                      OpStore %271 %270 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 190
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %175 %178 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpMemberDecorate %27 0 RelaxedPrecision 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 RelaxedPrecision 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %44 SpecId 44 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 4 
                                              %25 = OpTypeArray %7 %24 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypeStruct %7 %7 %25 %26 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 1 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Uniform %6 
                                          f32 %36 = OpConstant 3.67402E-40 
                                         bool %38 = OpConstantFalse 
                                         bool %44 = OpSpecConstantFalse 
                                          u32 %47 = OpConstant 1 
                                              %51 = OpTypePointer Private %26 
                               Private f32_3* %52 = OpVariable Private 
                                              %53 = OpTypePointer Input %26 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 2 
                                              %58 = OpTypePointer Uniform %7 
                                          i32 %63 = OpConstant 0 
                                          i32 %81 = OpConstant 3 
                               Private f32_4* %86 = OpVariable Private 
                                              %87 = OpTypePointer Function %26 
                                         i32 %100 = OpConstant 4 
                                             %101 = OpTypePointer Uniform %26 
                                             %115 = OpTypePointer Private %6 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %120 = OpConstant 3.67402E-40 
                                Private f32* %123 = OpVariable Private 
                                         u32 %124 = OpConstant 2 
                                         f32 %127 = OpConstant 3.67402E-40 
                                             %135 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %136 = OpTypeSampledImage %135 
                                             %137 = OpTypePointer UniformConstant %136 
 UniformConstant read_only Texture3DSampled* %138 = OpVariable UniformConstant 
                              Private f32_4* %143 = OpVariable Private 
                                         u32 %149 = OpConstant 3 
                              Private f32_3* %151 = OpVariable Private 
                                         f32 %159 = OpConstant 3.67402E-40 
                              Private f32_3* %162 = OpVariable Private 
                                         i32 %165 = OpConstant 5 
                                             %174 = OpTypePointer Output %7 
                               Output f32_4* %175 = OpVariable Output 
                                Input f32_3* %178 = OpVariable Input 
                                             %187 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %88 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %34 = OpAccessChain %29 %31 %32 
                                          f32 %35 = OpLoad %34 
                                         bool %37 = OpFOrdEqual %35 %36 
                                                      OpStore %22 %37 
                                                      OpSelectionMerge %40 None 
                                                      OpBranchConditional %38 %39 %40 
                                              %39 = OpLabel 
                                         bool %41 = OpLoad %22 
                                                      OpSelectionMerge %43 None 
                                                      OpBranchConditional %41 %42 %43 
                                              %42 = OpLabel 
                                                      OpBranch %43 
                                              %43 = OpLabel 
                                                      OpBranch %40 
                                              %40 = OpLabel 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %145 
                                              %45 = OpLabel 
                                 Uniform f32* %48 = OpAccessChain %29 %31 %47 
                                          f32 %49 = OpLoad %48 
                                         bool %50 = OpFOrdEqual %49 %36 
                                                      OpStore %22 %50 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %29 %57 %31 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFMul %56 %61 
                                                      OpStore %52 %62 
                               Uniform f32_4* %64 = OpAccessChain %29 %57 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                        f32_3 %67 = OpLoad %54 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 0 0 
                                        f32_3 %69 = OpFMul %66 %68 
                                        f32_3 %70 = OpLoad %52 
                                        f32_3 %71 = OpFAdd %69 %70 
                                                      OpStore %52 %71 
                               Uniform f32_4* %72 = OpAccessChain %29 %57 %57 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpLoad %54 
                                        f32_3 %76 = OpVectorShuffle %75 %75 2 2 2 
                                        f32_3 %77 = OpFMul %74 %76 
                                        f32_3 %78 = OpLoad %52 
                                        f32_3 %79 = OpFAdd %77 %78 
                                                      OpStore %52 %79 
                                        f32_3 %80 = OpLoad %52 
                               Uniform f32_4* %82 = OpAccessChain %29 %57 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFAdd %80 %84 
                                                      OpStore %52 %85 
                                         bool %89 = OpLoad %22 
                                                      OpSelectionMerge %91 None 
                                                      OpBranchConditional %89 %90 %93 
                                              %90 = OpLabel 
                                        f32_3 %92 = OpLoad %52 
                                                      OpStore %88 %92 
                                                      OpBranch %91 
                                              %93 = OpLabel 
                                        f32_3 %94 = OpLoad %54 
                                                      OpStore %88 %94 
                                                      OpBranch %91 
                                              %91 = OpLabel 
                                        f32_3 %95 = OpLoad %88 
                                        f32_4 %96 = OpLoad %86 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %86 %97 
                                        f32_4 %98 = OpLoad %86 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                              Uniform f32_3* %102 = OpAccessChain %29 %100 
                                       f32_3 %103 = OpLoad %102 
                                       f32_3 %104 = OpFNegate %103 
                                       f32_3 %105 = OpFAdd %99 %104 
                                       f32_4 %106 = OpLoad %86 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %86 %107 
                                       f32_4 %108 = OpLoad %86 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                              Uniform f32_3* %110 = OpAccessChain %29 %81 
                                       f32_3 %111 = OpLoad %110 
                                       f32_3 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %86 
                                       f32_4 %114 = OpVectorShuffle %113 %112 0 4 5 6 
                                                      OpStore %86 %114 
                                Private f32* %116 = OpAccessChain %86 %47 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %121 = OpFAdd %119 %120 
                                Private f32* %122 = OpAccessChain %52 %32 
                                                      OpStore %122 %121 
                                Uniform f32* %125 = OpAccessChain %29 %31 %124 
                                         f32 %126 = OpLoad %125 
                                         f32 %128 = OpFMul %126 %127 
                                         f32 %129 = OpFAdd %128 %120 
                                                      OpStore %123 %129 
                                Private f32* %130 = OpAccessChain %52 %32 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpLoad %123 
                                         f32 %133 = OpExtInst %1 40 %131 %132 
                                Private f32* %134 = OpAccessChain %86 %32 
                                                      OpStore %134 %133 
                  read_only Texture3DSampled %139 = OpLoad %138 
                                       f32_4 %140 = OpLoad %86 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 2 3 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                      OpStore %86 %142 
                                       f32_4 %144 = OpLoad %86 
                                                      OpStore %143 %144 
                                                      OpBranch %46 
                                             %145 = OpLabel 
                                Private f32* %146 = OpAccessChain %143 %32 
                                                      OpStore %146 %36 
                                Private f32* %147 = OpAccessChain %143 %47 
                                                      OpStore %147 %36 
                                Private f32* %148 = OpAccessChain %143 %124 
                                                      OpStore %148 %36 
                                Private f32* %150 = OpAccessChain %143 %149 
                                                      OpStore %150 %36 
                                                      OpBranch %46 
                                              %46 = OpLabel 
                                       f32_4 %152 = OpLoad %143 
                              Uniform f32_4* %153 = OpAccessChain %29 %63 
                                       f32_4 %154 = OpLoad %153 
                                         f32 %155 = OpDot %152 %154 
                                Private f32* %156 = OpAccessChain %151 %32 
                                                      OpStore %156 %155 
                                Private f32* %157 = OpAccessChain %151 %32 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpExtInst %1 43 %158 %159 %36 
                                Private f32* %161 = OpAccessChain %151 %32 
                                                      OpStore %161 %160 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %29 %165 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %164 %168 
                                                      OpStore %162 %169 
                                       f32_3 %170 = OpLoad %151 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 0 0 
                                       f32_3 %172 = OpLoad %162 
                                       f32_3 %173 = OpFMul %171 %172 
                                                      OpStore %151 %173 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %179 = OpLoad %178 
                                       f32_3 %180 = OpFMul %177 %179 
                                       f32_3 %181 = OpLoad %151 
                                       f32_3 %182 = OpFAdd %180 %181 
                                       f32_4 %183 = OpLoad %175 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %175 %184 
                                Private f32* %185 = OpAccessChain %9 %149 
                                         f32 %186 = OpLoad %185 
                                 Output f32* %188 = OpAccessChain %175 %149 
                                                      OpStore %188 %186 
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
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
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
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
        u_xlat2.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2.x);
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
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat4.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat2.w = 0.0;
    SV_Target0 = u_xlat0 + u_xlat2;
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
; Bound: 386
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %85 %97 %98 %112 %151 %154 %157 %377 
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
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
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
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %362 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %377 Location 377 
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
                                             %159 = OpTypePointer Private %110 
                              Private f32_3* %160 = OpVariable Private 
                              Private f32_4* %177 = OpVariable Private 
                              Private f32_3* %183 = OpVariable Private 
                                         i32 %184 = OpConstant 8 
                                         i32 %190 = OpConstant 9 
                                         i32 %196 = OpConstant 10 
                                         i32 %202 = OpConstant 11 
                                         f32 %211 = OpConstant 3.67402E-40 
                                         u32 %212 = OpConstant 3 
                                         i32 %214 = OpConstant 5 
                                         i32 %220 = OpConstant 6 
                                         i32 %226 = OpConstant 7 
                                         f32 %236 = OpConstant 3.67402E-40 
                                       f32_3 %237 = OpConstantComposite %236 %236 %236 
                              Private f32_3* %239 = OpVariable Private 
                                         f32 %243 = OpConstant 3.67402E-40 
                                       f32_3 %244 = OpConstantComposite %243 %243 %243 
                                         f32 %249 = OpConstant 3.67402E-40 
                                       f32_3 %250 = OpConstantComposite %249 %249 %249 
                                         f32 %252 = OpConstant 3.67402E-40 
                                       f32_3 %253 = OpConstantComposite %252 %252 %252 
                              Private f32_4* %263 = OpVariable Private 
                              Private f32_4* %271 = OpVariable Private 
                                         f32 %307 = OpConstant 3.67402E-40 
                                       f32_4 %308 = OpConstantComposite %307 %307 %307 %307 
                                       f32_4 %316 = OpConstantComposite %211 %211 %211 %211 
                                       f32_4 %324 = OpConstantComposite %236 %236 %236 %236 
                                         i32 %331 = OpConstant 4 
                               Output f32_3* %377 = OpVariable Output 
                                             %380 = OpTypePointer Output %6 
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
                                       f32_4 %158 = OpLoad %9 
                                                      OpStore %157 %158 
                                Private f32* %161 = OpAccessChain %47 %81 
                                         f32 %162 = OpLoad %161 
                                Private f32* %163 = OpAccessChain %47 %81 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpFMul %162 %164 
                                Private f32* %166 = OpAccessChain %160 %119 
                                                      OpStore %166 %165 
                                Private f32* %167 = OpAccessChain %47 %119 
                                         f32 %168 = OpLoad %167 
                                Private f32* %169 = OpAccessChain %47 %119 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpFMul %168 %170 
                                Private f32* %172 = OpAccessChain %160 %119 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFNegate %173 
                                         f32 %175 = OpFAdd %171 %174 
                                Private f32* %176 = OpAccessChain %160 %119 
                                                      OpStore %176 %175 
                                       f32_4 %178 = OpLoad %47 
                                       f32_4 %179 = OpVectorShuffle %178 %178 1 2 2 0 
                                       f32_4 %180 = OpLoad %47 
                                       f32_4 %181 = OpVectorShuffle %180 %180 0 1 2 2 
                                       f32_4 %182 = OpFMul %179 %181 
                                                      OpStore %177 %182 
                              Uniform f32_4* %185 = OpAccessChain %23 %184 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %177 
                                         f32 %188 = OpDot %186 %187 
                                Private f32* %189 = OpAccessChain %183 %119 
                                                      OpStore %189 %188 
                              Uniform f32_4* %191 = OpAccessChain %23 %190 
                                       f32_4 %192 = OpLoad %191 
                                       f32_4 %193 = OpLoad %177 
                                         f32 %194 = OpDot %192 %193 
                                Private f32* %195 = OpAccessChain %183 %81 
                                                      OpStore %195 %194 
                              Uniform f32_4* %197 = OpAccessChain %23 %196 
                                       f32_4 %198 = OpLoad %197 
                                       f32_4 %199 = OpLoad %177 
                                         f32 %200 = OpDot %198 %199 
                                Private f32* %201 = OpAccessChain %183 %133 
                                                      OpStore %201 %200 
                              Uniform f32_4* %203 = OpAccessChain %23 %202 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpLoad %160 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 0 0 
                                       f32_3 %208 = OpFMul %205 %207 
                                       f32_3 %209 = OpLoad %183 
                                       f32_3 %210 = OpFAdd %208 %209 
                                                      OpStore %160 %210 
                                Private f32* %213 = OpAccessChain %47 %212 
                                                      OpStore %213 %211 
                              Uniform f32_4* %215 = OpAccessChain %23 %214 
                                       f32_4 %216 = OpLoad %215 
                                       f32_4 %217 = OpLoad %47 
                                         f32 %218 = OpDot %216 %217 
                                Private f32* %219 = OpAccessChain %183 %119 
                                                      OpStore %219 %218 
                              Uniform f32_4* %221 = OpAccessChain %23 %220 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpLoad %47 
                                         f32 %224 = OpDot %222 %223 
                                Private f32* %225 = OpAccessChain %183 %81 
                                                      OpStore %225 %224 
                              Uniform f32_4* %227 = OpAccessChain %23 %226 
                                       f32_4 %228 = OpLoad %227 
                                       f32_4 %229 = OpLoad %47 
                                         f32 %230 = OpDot %228 %229 
                                Private f32* %231 = OpAccessChain %183 %133 
                                                      OpStore %231 %230 
                                       f32_3 %232 = OpLoad %160 
                                       f32_3 %233 = OpLoad %183 
                                       f32_3 %234 = OpFAdd %232 %233 
                                                      OpStore %160 %234 
                                       f32_3 %235 = OpLoad %160 
                                       f32_3 %238 = OpExtInst %1 40 %235 %237 
                                                      OpStore %160 %238 
                                       f32_3 %240 = OpLoad %160 
                                       f32_3 %241 = OpExtInst %1 30 %240 
                                                      OpStore %239 %241 
                                       f32_3 %242 = OpLoad %239 
                                       f32_3 %245 = OpFMul %242 %244 
                                                      OpStore %239 %245 
                                       f32_3 %246 = OpLoad %239 
                                       f32_3 %247 = OpExtInst %1 29 %246 
                                                      OpStore %239 %247 
                                       f32_3 %248 = OpLoad %239 
                                       f32_3 %251 = OpFMul %248 %250 
                                       f32_3 %254 = OpFAdd %251 %253 
                                                      OpStore %239 %254 
                                       f32_3 %255 = OpLoad %239 
                                       f32_3 %256 = OpExtInst %1 40 %255 %237 
                                                      OpStore %239 %256 
                                       f32_4 %257 = OpLoad %9 
                                       f32_4 %258 = OpVectorShuffle %257 %257 1 1 1 1 
                                       f32_4 %259 = OpFNegate %258 
                              Uniform f32_4* %260 = OpAccessChain %23 %26 
                                       f32_4 %261 = OpLoad %260 
                                       f32_4 %262 = OpFAdd %259 %261 
                                                      OpStore %60 %262 
                                       f32_4 %264 = OpLoad %47 
                                       f32_4 %265 = OpVectorShuffle %264 %264 1 1 1 1 
                                       f32_4 %266 = OpLoad %60 
                                       f32_4 %267 = OpFMul %265 %266 
                                                      OpStore %263 %267 
                                       f32_4 %268 = OpLoad %60 
                                       f32_4 %269 = OpLoad %60 
                                       f32_4 %270 = OpFMul %268 %269 
                                                      OpStore %60 %270 
                                       f32_4 %272 = OpLoad %9 
                                       f32_4 %273 = OpVectorShuffle %272 %272 0 0 0 0 
                                       f32_4 %274 = OpFNegate %273 
                              Uniform f32_4* %275 = OpAccessChain %23 %31 
                                       f32_4 %276 = OpLoad %275 
                                       f32_4 %277 = OpFAdd %274 %276 
                                                      OpStore %271 %277 
                                       f32_4 %278 = OpLoad %9 
                                       f32_4 %279 = OpVectorShuffle %278 %278 2 2 2 2 
                                       f32_4 %280 = OpFNegate %279 
                              Uniform f32_4* %281 = OpAccessChain %23 %39 
                                       f32_4 %282 = OpLoad %281 
                                       f32_4 %283 = OpFAdd %280 %282 
                                                      OpStore %9 %283 
                                       f32_4 %284 = OpLoad %271 
                                       f32_4 %285 = OpLoad %47 
                                       f32_4 %286 = OpVectorShuffle %285 %285 0 0 0 0 
                                       f32_4 %287 = OpFMul %284 %286 
                                       f32_4 %288 = OpLoad %263 
                                       f32_4 %289 = OpFAdd %287 %288 
                                                      OpStore %263 %289 
                                       f32_4 %290 = OpLoad %9 
                                       f32_4 %291 = OpLoad %47 
                                       f32_4 %292 = OpVectorShuffle %291 %291 2 2 2 2 
                                       f32_4 %293 = OpFMul %290 %292 
                                       f32_4 %294 = OpLoad %263 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %47 %295 
                                       f32_4 %296 = OpLoad %271 
                                       f32_4 %297 = OpLoad %271 
                                       f32_4 %298 = OpFMul %296 %297 
                                       f32_4 %299 = OpLoad %60 
                                       f32_4 %300 = OpFAdd %298 %299 
                                                      OpStore %60 %300 
                                       f32_4 %301 = OpLoad %9 
                                       f32_4 %302 = OpLoad %9 
                                       f32_4 %303 = OpFMul %301 %302 
                                       f32_4 %304 = OpLoad %60 
                                       f32_4 %305 = OpFAdd %303 %304 
                                                      OpStore %9 %305 
                                       f32_4 %306 = OpLoad %9 
                                       f32_4 %309 = OpExtInst %1 40 %306 %308 
                                                      OpStore %9 %309 
                                       f32_4 %310 = OpLoad %9 
                                       f32_4 %311 = OpExtInst %1 32 %310 
                                                      OpStore %60 %311 
                                       f32_4 %312 = OpLoad %9 
                              Uniform f32_4* %313 = OpAccessChain %23 %49 
                                       f32_4 %314 = OpLoad %313 
                                       f32_4 %315 = OpFMul %312 %314 
                                       f32_4 %317 = OpFAdd %315 %316 
                                                      OpStore %9 %317 
                                       f32_4 %318 = OpLoad %9 
                                       f32_4 %319 = OpFDiv %316 %318 
                                                      OpStore %9 %319 
                                       f32_4 %320 = OpLoad %47 
                                       f32_4 %321 = OpLoad %60 
                                       f32_4 %322 = OpFMul %320 %321 
                                                      OpStore %47 %322 
                                       f32_4 %323 = OpLoad %47 
                                       f32_4 %325 = OpExtInst %1 40 %323 %324 
                                                      OpStore %47 %325 
                                       f32_4 %326 = OpLoad %9 
                                       f32_4 %327 = OpLoad %47 
                                       f32_4 %328 = OpFMul %326 %327 
                                                      OpStore %9 %328 
                                       f32_4 %329 = OpLoad %9 
                                       f32_3 %330 = OpVectorShuffle %329 %329 1 1 1 
                              Uniform f32_4* %332 = OpAccessChain %23 %331 %26 
                                       f32_4 %333 = OpLoad %332 
                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
                                       f32_3 %335 = OpFMul %330 %334 
                                       f32_4 %336 = OpLoad %47 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %47 %337 
                              Uniform f32_4* %338 = OpAccessChain %23 %331 %31 
                                       f32_4 %339 = OpLoad %338 
                                       f32_3 %340 = OpVectorShuffle %339 %339 0 1 2 
                                       f32_4 %341 = OpLoad %9 
                                       f32_3 %342 = OpVectorShuffle %341 %341 0 0 0 
                                       f32_3 %343 = OpFMul %340 %342 
                                       f32_4 %344 = OpLoad %47 
                                       f32_3 %345 = OpVectorShuffle %344 %344 0 1 2 
                                       f32_3 %346 = OpFAdd %343 %345 
                                       f32_4 %347 = OpLoad %47 
                                       f32_4 %348 = OpVectorShuffle %347 %346 4 5 6 3 
                                                      OpStore %47 %348 
                              Uniform f32_4* %349 = OpAccessChain %23 %331 %39 
                                       f32_4 %350 = OpLoad %349 
                                       f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
                                       f32_4 %352 = OpLoad %9 
                                       f32_3 %353 = OpVectorShuffle %352 %352 2 2 2 
                                       f32_3 %354 = OpFMul %351 %353 
                                       f32_4 %355 = OpLoad %47 
                                       f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
                                       f32_3 %357 = OpFAdd %354 %356 
                                       f32_4 %358 = OpLoad %9 
                                       f32_4 %359 = OpVectorShuffle %358 %357 4 5 6 3 
                                                      OpStore %9 %359 
                              Uniform f32_4* %360 = OpAccessChain %23 %331 %49 
                                       f32_4 %361 = OpLoad %360 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
                                       f32_4 %363 = OpLoad %9 
                                       f32_3 %364 = OpVectorShuffle %363 %363 3 3 3 
                                       f32_3 %365 = OpFMul %362 %364 
                                       f32_4 %366 = OpLoad %9 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_3 %368 = OpFAdd %365 %367 
                                       f32_4 %369 = OpLoad %9 
                                       f32_4 %370 = OpVectorShuffle %369 %368 4 5 6 3 
                                                      OpStore %9 %370 
                                       f32_4 %371 = OpLoad %9 
                                       f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                                       f32_3 %373 = OpLoad %239 
                                       f32_3 %374 = OpFAdd %372 %373 
                                       f32_4 %375 = OpLoad %9 
                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 6 3 
                                                      OpStore %9 %376 
                                       f32_4 %378 = OpLoad %9 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                                                      OpStore %377 %379 
                                 Output f32* %381 = OpAccessChain %85 %31 %81 
                                         f32 %382 = OpLoad %381 
                                         f32 %383 = OpFNegate %382 
                                 Output f32* %384 = OpAccessChain %85 %31 %81 
                                                      OpStore %384 %383 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 190
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %175 %178 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpMemberDecorate %27 0 RelaxedPrecision 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 RelaxedPrecision 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %44 SpecId 44 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 4 
                                              %25 = OpTypeArray %7 %24 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypeStruct %7 %7 %25 %26 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 1 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Uniform %6 
                                          f32 %36 = OpConstant 3.67402E-40 
                                         bool %38 = OpConstantFalse 
                                         bool %44 = OpSpecConstantFalse 
                                          u32 %47 = OpConstant 1 
                                              %51 = OpTypePointer Private %26 
                               Private f32_3* %52 = OpVariable Private 
                                              %53 = OpTypePointer Input %26 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 2 
                                              %58 = OpTypePointer Uniform %7 
                                          i32 %63 = OpConstant 0 
                                          i32 %81 = OpConstant 3 
                               Private f32_4* %86 = OpVariable Private 
                                              %87 = OpTypePointer Function %26 
                                         i32 %100 = OpConstant 4 
                                             %101 = OpTypePointer Uniform %26 
                                             %115 = OpTypePointer Private %6 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %120 = OpConstant 3.67402E-40 
                                Private f32* %123 = OpVariable Private 
                                         u32 %124 = OpConstant 2 
                                         f32 %127 = OpConstant 3.67402E-40 
                                             %135 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %136 = OpTypeSampledImage %135 
                                             %137 = OpTypePointer UniformConstant %136 
 UniformConstant read_only Texture3DSampled* %138 = OpVariable UniformConstant 
                              Private f32_4* %143 = OpVariable Private 
                                         u32 %149 = OpConstant 3 
                              Private f32_3* %151 = OpVariable Private 
                                         f32 %159 = OpConstant 3.67402E-40 
                              Private f32_3* %162 = OpVariable Private 
                                         i32 %165 = OpConstant 5 
                                             %174 = OpTypePointer Output %7 
                               Output f32_4* %175 = OpVariable Output 
                                Input f32_3* %178 = OpVariable Input 
                                             %187 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %88 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %34 = OpAccessChain %29 %31 %32 
                                          f32 %35 = OpLoad %34 
                                         bool %37 = OpFOrdEqual %35 %36 
                                                      OpStore %22 %37 
                                                      OpSelectionMerge %40 None 
                                                      OpBranchConditional %38 %39 %40 
                                              %39 = OpLabel 
                                         bool %41 = OpLoad %22 
                                                      OpSelectionMerge %43 None 
                                                      OpBranchConditional %41 %42 %43 
                                              %42 = OpLabel 
                                                      OpBranch %43 
                                              %43 = OpLabel 
                                                      OpBranch %40 
                                              %40 = OpLabel 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %145 
                                              %45 = OpLabel 
                                 Uniform f32* %48 = OpAccessChain %29 %31 %47 
                                          f32 %49 = OpLoad %48 
                                         bool %50 = OpFOrdEqual %49 %36 
                                                      OpStore %22 %50 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %29 %57 %31 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFMul %56 %61 
                                                      OpStore %52 %62 
                               Uniform f32_4* %64 = OpAccessChain %29 %57 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                        f32_3 %67 = OpLoad %54 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 0 0 
                                        f32_3 %69 = OpFMul %66 %68 
                                        f32_3 %70 = OpLoad %52 
                                        f32_3 %71 = OpFAdd %69 %70 
                                                      OpStore %52 %71 
                               Uniform f32_4* %72 = OpAccessChain %29 %57 %57 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpLoad %54 
                                        f32_3 %76 = OpVectorShuffle %75 %75 2 2 2 
                                        f32_3 %77 = OpFMul %74 %76 
                                        f32_3 %78 = OpLoad %52 
                                        f32_3 %79 = OpFAdd %77 %78 
                                                      OpStore %52 %79 
                                        f32_3 %80 = OpLoad %52 
                               Uniform f32_4* %82 = OpAccessChain %29 %57 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFAdd %80 %84 
                                                      OpStore %52 %85 
                                         bool %89 = OpLoad %22 
                                                      OpSelectionMerge %91 None 
                                                      OpBranchConditional %89 %90 %93 
                                              %90 = OpLabel 
                                        f32_3 %92 = OpLoad %52 
                                                      OpStore %88 %92 
                                                      OpBranch %91 
                                              %93 = OpLabel 
                                        f32_3 %94 = OpLoad %54 
                                                      OpStore %88 %94 
                                                      OpBranch %91 
                                              %91 = OpLabel 
                                        f32_3 %95 = OpLoad %88 
                                        f32_4 %96 = OpLoad %86 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %86 %97 
                                        f32_4 %98 = OpLoad %86 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                              Uniform f32_3* %102 = OpAccessChain %29 %100 
                                       f32_3 %103 = OpLoad %102 
                                       f32_3 %104 = OpFNegate %103 
                                       f32_3 %105 = OpFAdd %99 %104 
                                       f32_4 %106 = OpLoad %86 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %86 %107 
                                       f32_4 %108 = OpLoad %86 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                              Uniform f32_3* %110 = OpAccessChain %29 %81 
                                       f32_3 %111 = OpLoad %110 
                                       f32_3 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %86 
                                       f32_4 %114 = OpVectorShuffle %113 %112 0 4 5 6 
                                                      OpStore %86 %114 
                                Private f32* %116 = OpAccessChain %86 %47 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %121 = OpFAdd %119 %120 
                                Private f32* %122 = OpAccessChain %52 %32 
                                                      OpStore %122 %121 
                                Uniform f32* %125 = OpAccessChain %29 %31 %124 
                                         f32 %126 = OpLoad %125 
                                         f32 %128 = OpFMul %126 %127 
                                         f32 %129 = OpFAdd %128 %120 
                                                      OpStore %123 %129 
                                Private f32* %130 = OpAccessChain %52 %32 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpLoad %123 
                                         f32 %133 = OpExtInst %1 40 %131 %132 
                                Private f32* %134 = OpAccessChain %86 %32 
                                                      OpStore %134 %133 
                  read_only Texture3DSampled %139 = OpLoad %138 
                                       f32_4 %140 = OpLoad %86 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 2 3 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                      OpStore %86 %142 
                                       f32_4 %144 = OpLoad %86 
                                                      OpStore %143 %144 
                                                      OpBranch %46 
                                             %145 = OpLabel 
                                Private f32* %146 = OpAccessChain %143 %32 
                                                      OpStore %146 %36 
                                Private f32* %147 = OpAccessChain %143 %47 
                                                      OpStore %147 %36 
                                Private f32* %148 = OpAccessChain %143 %124 
                                                      OpStore %148 %36 
                                Private f32* %150 = OpAccessChain %143 %149 
                                                      OpStore %150 %36 
                                                      OpBranch %46 
                                              %46 = OpLabel 
                                       f32_4 %152 = OpLoad %143 
                              Uniform f32_4* %153 = OpAccessChain %29 %63 
                                       f32_4 %154 = OpLoad %153 
                                         f32 %155 = OpDot %152 %154 
                                Private f32* %156 = OpAccessChain %151 %32 
                                                      OpStore %156 %155 
                                Private f32* %157 = OpAccessChain %151 %32 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpExtInst %1 43 %158 %159 %36 
                                Private f32* %161 = OpAccessChain %151 %32 
                                                      OpStore %161 %160 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %29 %165 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %164 %168 
                                                      OpStore %162 %169 
                                       f32_3 %170 = OpLoad %151 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 0 0 
                                       f32_3 %172 = OpLoad %162 
                                       f32_3 %173 = OpFMul %171 %172 
                                                      OpStore %151 %173 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %179 = OpLoad %178 
                                       f32_3 %180 = OpFMul %177 %179 
                                       f32_3 %181 = OpLoad %151 
                                       f32_3 %182 = OpFAdd %180 %181 
                                       f32_4 %183 = OpLoad %175 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %175 %184 
                                Private f32* %185 = OpAccessChain %9 %149 
                                         f32 %186 = OpLoad %185 
                                 Output f32* %188 = OpAccessChain %175 %149 
                                                      OpStore %188 %186 
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
}
}
 Pass {
  Name "FORWARD"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 80312
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
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
    u_xlat0.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
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
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
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
                                             %149 = OpTypePointer Output %6 
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
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 239
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %24 %227 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %24 Location 24 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 RelaxedPrecision 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 RelaxedPrecision 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %178 DescriptorSet 178 
                                                      OpDecorate %178 Binding 178 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %206 DescriptorSet 206 
                                                      OpDecorate %206 Binding 206 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %227 Location 227 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
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
                                              %20 = OpTypeVector %6 3 
                                              %21 = OpTypePointer Private %20 
                               Private f32_3* %22 = OpVariable Private 
                                              %23 = OpTypePointer Input %20 
                                 Input f32_3* %24 = OpVariable Input 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 4 
                                              %29 = OpTypeArray %7 %28 
                                              %30 = OpTypeArray %7 %28 
                                              %31 = OpTypeStruct %7 %7 %29 %20 %20 %7 %30 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4];}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 6 
                                          i32 %36 = OpConstant 1 
                                              %37 = OpTypePointer Uniform %7 
                                          i32 %42 = OpConstant 0 
                                          i32 %51 = OpConstant 2 
                                          i32 %61 = OpConstant 3 
                                              %66 = OpTypeBool 
                                              %67 = OpTypePointer Private %66 
                                Private bool* %68 = OpVariable Private 
                                          u32 %69 = OpConstant 0 
                                              %70 = OpTypePointer Uniform %6 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                          u32 %84 = OpConstant 1 
                               Private f32_4* %88 = OpVariable Private 
                                             %127 = OpTypePointer Function %20 
                                         i32 %141 = OpConstant 4 
                                             %142 = OpTypePointer Uniform %20 
                                             %156 = OpTypePointer Private %6 
                                Private f32* %157 = OpVariable Private 
                                         f32 %160 = OpConstant 3.67402E-40 
                                         f32 %162 = OpConstant 3.67402E-40 
                                Private f32* %164 = OpVariable Private 
                                         u32 %165 = OpConstant 2 
                                         f32 %168 = OpConstant 3.67402E-40 
                                             %175 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %176 = OpTypeSampledImage %175 
                                             %177 = OpTypePointer UniformConstant %176 
 UniformConstant read_only Texture3DSampled* %178 = OpVariable UniformConstant 
                              Private f32_4* %183 = OpVariable Private 
                                         u32 %189 = OpConstant 3 
                              Private f32_3* %191 = OpVariable Private 
                                         f32 %199 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %206 = OpVariable UniformConstant 
                                         i32 %221 = OpConstant 5 
                                             %226 = OpTypePointer Output %7 
                               Output f32_4* %227 = OpVariable Output 
                                             %236 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %128 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_3 %25 = OpLoad %24 
                                        f32_3 %26 = OpVectorShuffle %25 %25 1 1 1 
                               Uniform f32_4* %38 = OpAccessChain %33 %35 %36 
                                        f32_4 %39 = OpLoad %38 
                                        f32_3 %40 = OpVectorShuffle %39 %39 0 1 2 
                                        f32_3 %41 = OpFMul %26 %40 
                                                      OpStore %22 %41 
                               Uniform f32_4* %43 = OpAccessChain %33 %35 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                        f32_3 %46 = OpLoad %24 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 0 0 
                                        f32_3 %48 = OpFMul %45 %47 
                                        f32_3 %49 = OpLoad %22 
                                        f32_3 %50 = OpFAdd %48 %49 
                                                      OpStore %22 %50 
                               Uniform f32_4* %52 = OpAccessChain %33 %35 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpLoad %24 
                                        f32_3 %56 = OpVectorShuffle %55 %55 2 2 2 
                                        f32_3 %57 = OpFMul %54 %56 
                                        f32_3 %58 = OpLoad %22 
                                        f32_3 %59 = OpFAdd %57 %58 
                                                      OpStore %22 %59 
                                        f32_3 %60 = OpLoad %22 
                               Uniform f32_4* %62 = OpAccessChain %33 %35 %61 
                                        f32_4 %63 = OpLoad %62 
                                        f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                                        f32_3 %65 = OpFAdd %60 %64 
                                                      OpStore %22 %65 
                                 Uniform f32* %71 = OpAccessChain %33 %36 %69 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %68 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %68 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %185 
                                              %82 = OpLabel 
                                 Uniform f32* %85 = OpAccessChain %33 %36 %84 
                                          f32 %86 = OpLoad %85 
                                         bool %87 = OpFOrdEqual %86 %73 
                                                      OpStore %68 %87 
                                        f32_3 %89 = OpLoad %24 
                                        f32_3 %90 = OpVectorShuffle %89 %89 1 1 1 
                               Uniform f32_4* %91 = OpAccessChain %33 %51 %36 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %88 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                                      OpStore %88 %96 
                               Uniform f32_4* %97 = OpAccessChain %33 %51 %42 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_3 %100 = OpLoad %24 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 0 0 
                                       f32_3 %102 = OpFMul %99 %101 
                                       f32_4 %103 = OpLoad %88 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpFAdd %102 %104 
                                       f32_4 %106 = OpLoad %88 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %88 %107 
                              Uniform f32_4* %108 = OpAccessChain %33 %51 %51 
                                       f32_4 %109 = OpLoad %108 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpLoad %24 
                                       f32_3 %112 = OpVectorShuffle %111 %111 2 2 2 
                                       f32_3 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %88 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFAdd %113 %115 
                                       f32_4 %117 = OpLoad %88 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                                      OpStore %88 %118 
                                       f32_4 %119 = OpLoad %88 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                              Uniform f32_4* %121 = OpAccessChain %33 %51 %61 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFAdd %120 %123 
                                       f32_4 %125 = OpLoad %88 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                      OpStore %88 %126 
                                        bool %129 = OpLoad %68 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %134 
                                             %130 = OpLabel 
                                       f32_4 %132 = OpLoad %88 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                                      OpStore %128 %133 
                                                      OpBranch %131 
                                             %134 = OpLabel 
                                       f32_3 %135 = OpLoad %24 
                                                      OpStore %128 %135 
                                                      OpBranch %131 
                                             %131 = OpLabel 
                                       f32_3 %136 = OpLoad %128 
                                       f32_4 %137 = OpLoad %88 
                                       f32_4 %138 = OpVectorShuffle %137 %136 4 5 6 3 
                                                      OpStore %88 %138 
                                       f32_4 %139 = OpLoad %88 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %33 %141 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFNegate %144 
                                       f32_3 %146 = OpFAdd %140 %145 
                                       f32_4 %147 = OpLoad %88 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %88 %148 
                                       f32_4 %149 = OpLoad %88 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                              Uniform f32_3* %151 = OpAccessChain %33 %61 
                                       f32_3 %152 = OpLoad %151 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %88 
                                       f32_4 %155 = OpVectorShuffle %154 %153 0 4 5 6 
                                                      OpStore %88 %155 
                                Private f32* %158 = OpAccessChain %88 %84 
                                         f32 %159 = OpLoad %158 
                                         f32 %161 = OpFMul %159 %160 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %157 %163 
                                Uniform f32* %166 = OpAccessChain %33 %36 %165 
                                         f32 %167 = OpLoad %166 
                                         f32 %169 = OpFMul %167 %168 
                                         f32 %170 = OpFAdd %169 %162 
                                                      OpStore %164 %170 
                                         f32 %171 = OpLoad %157 
                                         f32 %172 = OpLoad %164 
                                         f32 %173 = OpExtInst %1 40 %171 %172 
                                Private f32* %174 = OpAccessChain %88 %69 
                                                      OpStore %174 %173 
                  read_only Texture3DSampled %179 = OpLoad %178 
                                       f32_4 %180 = OpLoad %88 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 2 3 
                                       f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                                                      OpStore %88 %182 
                                       f32_4 %184 = OpLoad %88 
                                                      OpStore %183 %184 
                                                      OpBranch %83 
                                             %185 = OpLabel 
                                Private f32* %186 = OpAccessChain %183 %69 
                                                      OpStore %186 %73 
                                Private f32* %187 = OpAccessChain %183 %84 
                                                      OpStore %187 %73 
                                Private f32* %188 = OpAccessChain %183 %165 
                                                      OpStore %188 %73 
                                Private f32* %190 = OpAccessChain %183 %189 
                                                      OpStore %190 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %192 = OpLoad %183 
                              Uniform f32_4* %193 = OpAccessChain %33 %42 
                                       f32_4 %194 = OpLoad %193 
                                         f32 %195 = OpDot %192 %194 
                                Private f32* %196 = OpAccessChain %191 %69 
                                                      OpStore %196 %195 
                                Private f32* %197 = OpAccessChain %191 %69 
                                         f32 %198 = OpLoad %197 
                                         f32 %200 = OpExtInst %1 43 %198 %199 %73 
                                Private f32* %201 = OpAccessChain %191 %69 
                                                      OpStore %201 %200 
                                       f32_3 %202 = OpLoad %22 
                                       f32_3 %203 = OpLoad %22 
                                         f32 %204 = OpDot %202 %203 
                                Private f32* %205 = OpAccessChain %22 %69 
                                                      OpStore %205 %204 
                  read_only Texture2DSampled %207 = OpLoad %206 
                                       f32_3 %208 = OpLoad %22 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 0 
                                       f32_4 %210 = OpImageSampleImplicitLod %207 %209 
                                         f32 %211 = OpCompositeExtract %210 3 
                                Private f32* %212 = OpAccessChain %22 %69 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %191 %69 
                                         f32 %214 = OpLoad %213 
                                Private f32* %215 = OpAccessChain %22 %69 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFMul %214 %216 
                                Private f32* %218 = OpAccessChain %22 %69 
                                                      OpStore %218 %217 
                                       f32_4 %219 = OpLoad %9 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                              Uniform f32_4* %222 = OpAccessChain %33 %221 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                       f32_3 %225 = OpFMul %220 %224 
                                                      OpStore %191 %225 
                                       f32_3 %228 = OpLoad %22 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 0 0 
                                       f32_3 %230 = OpLoad %191 
                                       f32_3 %231 = OpFMul %229 %230 
                                       f32_4 %232 = OpLoad %227 
                                       f32_4 %233 = OpVectorShuffle %232 %231 4 5 6 3 
                                                      OpStore %227 %233 
                                Private f32* %234 = OpAccessChain %9 %189 
                                         f32 %235 = OpLoad %234 
                                 Output f32* %237 = OpAccessChain %227 %189 
                                                      OpStore %237 %235 
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
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
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
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
    u_xlat0.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
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
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
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
                                             %149 = OpTypePointer Output %6 
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
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 180
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %168 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %25 ArrayStride 25 
                                                      OpMemberDecorate %27 0 RelaxedPrecision 
                                                      OpMemberDecorate %27 0 Offset 27 
                                                      OpMemberDecorate %27 1 Offset 27 
                                                      OpMemberDecorate %27 2 Offset 27 
                                                      OpMemberDecorate %27 3 Offset 27 
                                                      OpMemberDecorate %27 4 Offset 27 
                                                      OpMemberDecorate %27 5 RelaxedPrecision 
                                                      OpMemberDecorate %27 5 Offset 27 
                                                      OpDecorate %27 Block 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %44 SpecId 44 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %156 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %168 Location 168 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 4 
                                              %25 = OpTypeArray %7 %24 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypeStruct %7 %7 %25 %26 %26 %7 
                                              %28 = OpTypePointer Uniform %27 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %29 = OpVariable Uniform 
                                              %30 = OpTypeInt 32 1 
                                          i32 %31 = OpConstant 1 
                                          u32 %32 = OpConstant 0 
                                              %33 = OpTypePointer Uniform %6 
                                          f32 %36 = OpConstant 3.67402E-40 
                                         bool %38 = OpConstantFalse 
                                         bool %44 = OpSpecConstantFalse 
                                          u32 %47 = OpConstant 1 
                                              %51 = OpTypePointer Private %26 
                               Private f32_3* %52 = OpVariable Private 
                                              %53 = OpTypePointer Input %26 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 2 
                                              %58 = OpTypePointer Uniform %7 
                                          i32 %63 = OpConstant 0 
                                          i32 %81 = OpConstant 3 
                               Private f32_4* %86 = OpVariable Private 
                                              %87 = OpTypePointer Function %26 
                                         i32 %100 = OpConstant 4 
                                             %101 = OpTypePointer Uniform %26 
                                             %115 = OpTypePointer Private %6 
                                         f32 %118 = OpConstant 3.67402E-40 
                                         f32 %120 = OpConstant 3.67402E-40 
                                Private f32* %123 = OpVariable Private 
                                         u32 %124 = OpConstant 2 
                                         f32 %127 = OpConstant 3.67402E-40 
                                             %135 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %136 = OpTypeSampledImage %135 
                                             %137 = OpTypePointer UniformConstant %136 
 UniformConstant read_only Texture3DSampled* %138 = OpVariable UniformConstant 
                              Private f32_4* %143 = OpVariable Private 
                                         u32 %149 = OpConstant 3 
                                Private f32* %151 = OpVariable Private 
                                         f32 %157 = OpConstant 3.67402E-40 
                              Private f32_3* %159 = OpVariable Private 
                                         i32 %162 = OpConstant 5 
                                             %167 = OpTypePointer Output %7 
                               Output f32_4* %168 = OpVariable Output 
                                             %177 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %88 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Uniform f32* %34 = OpAccessChain %29 %31 %32 
                                          f32 %35 = OpLoad %34 
                                         bool %37 = OpFOrdEqual %35 %36 
                                                      OpStore %22 %37 
                                                      OpSelectionMerge %40 None 
                                                      OpBranchConditional %38 %39 %40 
                                              %39 = OpLabel 
                                         bool %41 = OpLoad %22 
                                                      OpSelectionMerge %43 None 
                                                      OpBranchConditional %41 %42 %43 
                                              %42 = OpLabel 
                                                      OpBranch %43 
                                              %43 = OpLabel 
                                                      OpBranch %40 
                                              %40 = OpLabel 
                                                      OpSelectionMerge %46 None 
                                                      OpBranchConditional %44 %45 %145 
                                              %45 = OpLabel 
                                 Uniform f32* %48 = OpAccessChain %29 %31 %47 
                                          f32 %49 = OpLoad %48 
                                         bool %50 = OpFOrdEqual %49 %36 
                                                      OpStore %22 %50 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %29 %57 %31 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFMul %56 %61 
                                                      OpStore %52 %62 
                               Uniform f32_4* %64 = OpAccessChain %29 %57 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                        f32_3 %67 = OpLoad %54 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 0 0 
                                        f32_3 %69 = OpFMul %66 %68 
                                        f32_3 %70 = OpLoad %52 
                                        f32_3 %71 = OpFAdd %69 %70 
                                                      OpStore %52 %71 
                               Uniform f32_4* %72 = OpAccessChain %29 %57 %57 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpLoad %54 
                                        f32_3 %76 = OpVectorShuffle %75 %75 2 2 2 
                                        f32_3 %77 = OpFMul %74 %76 
                                        f32_3 %78 = OpLoad %52 
                                        f32_3 %79 = OpFAdd %77 %78 
                                                      OpStore %52 %79 
                                        f32_3 %80 = OpLoad %52 
                               Uniform f32_4* %82 = OpAccessChain %29 %57 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFAdd %80 %84 
                                                      OpStore %52 %85 
                                         bool %89 = OpLoad %22 
                                                      OpSelectionMerge %91 None 
                                                      OpBranchConditional %89 %90 %93 
                                              %90 = OpLabel 
                                        f32_3 %92 = OpLoad %52 
                                                      OpStore %88 %92 
                                                      OpBranch %91 
                                              %93 = OpLabel 
                                        f32_3 %94 = OpLoad %54 
                                                      OpStore %88 %94 
                                                      OpBranch %91 
                                              %91 = OpLabel 
                                        f32_3 %95 = OpLoad %88 
                                        f32_4 %96 = OpLoad %86 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %86 %97 
                                        f32_4 %98 = OpLoad %86 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                              Uniform f32_3* %102 = OpAccessChain %29 %100 
                                       f32_3 %103 = OpLoad %102 
                                       f32_3 %104 = OpFNegate %103 
                                       f32_3 %105 = OpFAdd %99 %104 
                                       f32_4 %106 = OpLoad %86 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %86 %107 
                                       f32_4 %108 = OpLoad %86 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                              Uniform f32_3* %110 = OpAccessChain %29 %81 
                                       f32_3 %111 = OpLoad %110 
                                       f32_3 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %86 
                                       f32_4 %114 = OpVectorShuffle %113 %112 0 4 5 6 
                                                      OpStore %86 %114 
                                Private f32* %116 = OpAccessChain %86 %47 
                                         f32 %117 = OpLoad %116 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %121 = OpFAdd %119 %120 
                                Private f32* %122 = OpAccessChain %52 %32 
                                                      OpStore %122 %121 
                                Uniform f32* %125 = OpAccessChain %29 %31 %124 
                                         f32 %126 = OpLoad %125 
                                         f32 %128 = OpFMul %126 %127 
                                         f32 %129 = OpFAdd %128 %120 
                                                      OpStore %123 %129 
                                Private f32* %130 = OpAccessChain %52 %32 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpLoad %123 
                                         f32 %133 = OpExtInst %1 40 %131 %132 
                                Private f32* %134 = OpAccessChain %86 %32 
                                                      OpStore %134 %133 
                  read_only Texture3DSampled %139 = OpLoad %138 
                                       f32_4 %140 = OpLoad %86 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 2 3 
                                       f32_4 %142 = OpImageSampleImplicitLod %139 %141 
                                                      OpStore %86 %142 
                                       f32_4 %144 = OpLoad %86 
                                                      OpStore %143 %144 
                                                      OpBranch %46 
                                             %145 = OpLabel 
                                Private f32* %146 = OpAccessChain %143 %32 
                                                      OpStore %146 %36 
                                Private f32* %147 = OpAccessChain %143 %47 
                                                      OpStore %147 %36 
                                Private f32* %148 = OpAccessChain %143 %124 
                                                      OpStore %148 %36 
                                Private f32* %150 = OpAccessChain %143 %149 
                                                      OpStore %150 %36 
                                                      OpBranch %46 
                                              %46 = OpLabel 
                                       f32_4 %152 = OpLoad %143 
                              Uniform f32_4* %153 = OpAccessChain %29 %63 
                                       f32_4 %154 = OpLoad %153 
                                         f32 %155 = OpDot %152 %154 
                                                      OpStore %151 %155 
                                         f32 %156 = OpLoad %151 
                                         f32 %158 = OpExtInst %1 43 %156 %157 %36 
                                                      OpStore %151 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                              Uniform f32_4* %163 = OpAccessChain %29 %162 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFMul %161 %165 
                                                      OpStore %159 %166 
                                         f32 %169 = OpLoad %151 
                                       f32_3 %170 = OpCompositeConstruct %169 %169 %169 
                                       f32_3 %171 = OpLoad %159 
                                       f32_3 %172 = OpFMul %170 %171 
                                       f32_4 %173 = OpLoad %168 
                                       f32_4 %174 = OpVectorShuffle %173 %172 4 5 6 3 
                                                      OpStore %168 %174 
                                Private f32* %175 = OpAccessChain %9 %149 
                                         f32 %176 = OpLoad %175 
                                 Output f32* %178 = OpAccessChain %168 %149 
                                                      OpStore %178 %176 
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
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
float u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat10;
float u_xlat13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
    u_xlat0.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
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
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
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
                                             %149 = OpTypePointer Output %6 
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
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 263
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %251 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %23 Location 23 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpMemberDecorate %30 0 RelaxedPrecision 
                                                      OpMemberDecorate %30 0 Offset 30 
                                                      OpMemberDecorate %30 1 Offset 30 
                                                      OpMemberDecorate %30 2 Offset 30 
                                                      OpMemberDecorate %30 3 Offset 30 
                                                      OpMemberDecorate %30 4 Offset 30 
                                                      OpMemberDecorate %30 5 RelaxedPrecision 
                                                      OpMemberDecorate %30 5 Offset 30 
                                                      OpMemberDecorate %30 6 Offset 30 
                                                      OpDecorate %30 Block 
                                                      OpDecorate %32 DescriptorSet 32 
                                                      OpDecorate %32 Binding 32 
                                                      OpDecorate %76 SpecId 76 
                                                      OpDecorate %167 DescriptorSet 167 
                                                      OpDecorate %167 Binding 167 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %226 DescriptorSet 226 
                                                      OpDecorate %226 Binding 226 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %251 Location 251 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
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
                                              %22 = OpTypePointer Input %21 
                                 Input f32_3* %23 = OpVariable Input 
                                              %26 = OpTypeInt 32 0 
                                          u32 %27 = OpConstant 4 
                                              %28 = OpTypeArray %7 %27 
                                              %29 = OpTypeArray %7 %27 
                                              %30 = OpTypeStruct %7 %7 %28 %21 %21 %7 %29 
                                              %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4];}* %32 = OpVariable Uniform 
                                              %33 = OpTypeInt 32 1 
                                          i32 %34 = OpConstant 6 
                                          i32 %35 = OpConstant 1 
                                              %36 = OpTypePointer Uniform %7 
                                          i32 %40 = OpConstant 0 
                                          i32 %48 = OpConstant 2 
                                          i32 %57 = OpConstant 3 
                                              %61 = OpTypeBool 
                                              %62 = OpTypePointer Private %61 
                                Private bool* %63 = OpVariable Private 
                                          u32 %64 = OpConstant 0 
                                              %65 = OpTypePointer Uniform %6 
                                          f32 %68 = OpConstant 3.67402E-40 
                                         bool %70 = OpConstantFalse 
                                         bool %76 = OpSpecConstantFalse 
                                          u32 %79 = OpConstant 1 
                                              %83 = OpTypePointer Private %21 
                               Private f32_3* %84 = OpVariable Private 
                              Private f32_4* %112 = OpVariable Private 
                                             %113 = OpTypePointer Function %21 
                                         i32 %126 = OpConstant 4 
                                             %127 = OpTypePointer Uniform %21 
                                             %141 = OpTypePointer Private %6 
                                         f32 %144 = OpConstant 3.67402E-40 
                                         f32 %146 = OpConstant 3.67402E-40 
                                             %149 = OpTypePointer Private %15 
                              Private f32_2* %150 = OpVariable Private 
                                         u32 %151 = OpConstant 2 
                                         f32 %154 = OpConstant 3.67402E-40 
                                             %164 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %165 = OpTypeSampledImage %164 
                                             %166 = OpTypePointer UniformConstant %165 
 UniformConstant read_only Texture3DSampled* %167 = OpVariable UniformConstant 
                              Private f32_4* %172 = OpVariable Private 
                                         u32 %178 = OpConstant 3 
                                Private f32* %180 = OpVariable Private 
                                         f32 %186 = OpConstant 3.67402E-40 
                               Private bool* %188 = OpVariable Private 
                              Private f32_3* %192 = OpVariable Private 
                                             %193 = OpTypePointer Function %6 
                                       f32_2 %207 = OpConstantComposite %154 %154 
                                Private f32* %209 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %210 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %226 = OpVariable UniformConstant 
                                         i32 %245 = OpConstant 5 
                                             %250 = OpTypePointer Output %7 
                               Output f32_4* %251 = OpVariable Output 
                                             %260 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %114 = OpVariable Function 
                               Function f32* %194 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_3 %24 = OpLoad %23 
                                        f32_4 %25 = OpVectorShuffle %24 %24 1 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %32 %34 %35 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpFMul %25 %38 
                                                      OpStore %20 %39 
                               Uniform f32_4* %41 = OpAccessChain %32 %34 %40 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpLoad %23 
                                        f32_4 %44 = OpVectorShuffle %43 %43 0 0 0 0 
                                        f32_4 %45 = OpFMul %42 %44 
                                        f32_4 %46 = OpLoad %20 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %20 %47 
                               Uniform f32_4* %49 = OpAccessChain %32 %34 %48 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpLoad %23 
                                        f32_4 %52 = OpVectorShuffle %51 %51 2 2 2 2 
                                        f32_4 %53 = OpFMul %50 %52 
                                        f32_4 %54 = OpLoad %20 
                                        f32_4 %55 = OpFAdd %53 %54 
                                                      OpStore %20 %55 
                                        f32_4 %56 = OpLoad %20 
                               Uniform f32_4* %58 = OpAccessChain %32 %34 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFAdd %56 %59 
                                                      OpStore %20 %60 
                                 Uniform f32* %66 = OpAccessChain %32 %35 %64 
                                          f32 %67 = OpLoad %66 
                                         bool %69 = OpFOrdEqual %67 %68 
                                                      OpStore %63 %69 
                                                      OpSelectionMerge %72 None 
                                                      OpBranchConditional %70 %71 %72 
                                              %71 = OpLabel 
                                         bool %73 = OpLoad %63 
                                                      OpSelectionMerge %75 None 
                                                      OpBranchConditional %73 %74 %75 
                                              %74 = OpLabel 
                                                      OpBranch %75 
                                              %75 = OpLabel 
                                                      OpBranch %72 
                                              %72 = OpLabel 
                                                      OpSelectionMerge %78 None 
                                                      OpBranchConditional %76 %77 %174 
                                              %77 = OpLabel 
                                 Uniform f32* %80 = OpAccessChain %32 %35 %79 
                                          f32 %81 = OpLoad %80 
                                         bool %82 = OpFOrdEqual %81 %68 
                                                      OpStore %63 %82 
                                        f32_3 %85 = OpLoad %23 
                                        f32_3 %86 = OpVectorShuffle %85 %85 1 1 1 
                               Uniform f32_4* %87 = OpAccessChain %32 %48 %35 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                               Uniform f32_4* %91 = OpAccessChain %32 %48 %40 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpLoad %23 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 0 0 
                                        f32_3 %96 = OpFMul %93 %95 
                                        f32_3 %97 = OpLoad %84 
                                        f32_3 %98 = OpFAdd %96 %97 
                                                      OpStore %84 %98 
                               Uniform f32_4* %99 = OpAccessChain %32 %48 %48 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpLoad %23 
                                       f32_3 %103 = OpVectorShuffle %102 %102 2 2 2 
                                       f32_3 %104 = OpFMul %101 %103 
                                       f32_3 %105 = OpLoad %84 
                                       f32_3 %106 = OpFAdd %104 %105 
                                                      OpStore %84 %106 
                                       f32_3 %107 = OpLoad %84 
                              Uniform f32_4* %108 = OpAccessChain %32 %48 %57 
                                       f32_4 %109 = OpLoad %108 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFAdd %107 %110 
                                                      OpStore %84 %111 
                                        bool %115 = OpLoad %63 
                                                      OpSelectionMerge %117 None 
                                                      OpBranchConditional %115 %116 %119 
                                             %116 = OpLabel 
                                       f32_3 %118 = OpLoad %84 
                                                      OpStore %114 %118 
                                                      OpBranch %117 
                                             %119 = OpLabel 
                                       f32_3 %120 = OpLoad %23 
                                                      OpStore %114 %120 
                                                      OpBranch %117 
                                             %117 = OpLabel 
                                       f32_3 %121 = OpLoad %114 
                                       f32_4 %122 = OpLoad %112 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %112 %123 
                                       f32_4 %124 = OpLoad %112 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                              Uniform f32_3* %128 = OpAccessChain %32 %126 
                                       f32_3 %129 = OpLoad %128 
                                       f32_3 %130 = OpFNegate %129 
                                       f32_3 %131 = OpFAdd %125 %130 
                                       f32_4 %132 = OpLoad %112 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %112 %133 
                                       f32_4 %134 = OpLoad %112 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                              Uniform f32_3* %136 = OpAccessChain %32 %57 
                                       f32_3 %137 = OpLoad %136 
                                       f32_3 %138 = OpFMul %135 %137 
                                       f32_4 %139 = OpLoad %112 
                                       f32_4 %140 = OpVectorShuffle %139 %138 0 4 5 6 
                                                      OpStore %112 %140 
                                Private f32* %142 = OpAccessChain %112 %79 
                                         f32 %143 = OpLoad %142 
                                         f32 %145 = OpFMul %143 %144 
                                         f32 %147 = OpFAdd %145 %146 
                                Private f32* %148 = OpAccessChain %84 %64 
                                                      OpStore %148 %147 
                                Uniform f32* %152 = OpAccessChain %32 %35 %151 
                                         f32 %153 = OpLoad %152 
                                         f32 %155 = OpFMul %153 %154 
                                         f32 %156 = OpFAdd %155 %146 
                                Private f32* %157 = OpAccessChain %150 %64 
                                                      OpStore %157 %156 
                                Private f32* %158 = OpAccessChain %84 %64 
                                         f32 %159 = OpLoad %158 
                                Private f32* %160 = OpAccessChain %150 %64 
                                         f32 %161 = OpLoad %160 
                                         f32 %162 = OpExtInst %1 40 %159 %161 
                                Private f32* %163 = OpAccessChain %112 %64 
                                                      OpStore %163 %162 
                  read_only Texture3DSampled %168 = OpLoad %167 
                                       f32_4 %169 = OpLoad %112 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 2 3 
                                       f32_4 %171 = OpImageSampleImplicitLod %168 %170 
                                                      OpStore %112 %171 
                                       f32_4 %173 = OpLoad %112 
                                                      OpStore %172 %173 
                                                      OpBranch %78 
                                             %174 = OpLabel 
                                Private f32* %175 = OpAccessChain %172 %64 
                                                      OpStore %175 %68 
                                Private f32* %176 = OpAccessChain %172 %79 
                                                      OpStore %176 %68 
                                Private f32* %177 = OpAccessChain %172 %151 
                                                      OpStore %177 %68 
                                Private f32* %179 = OpAccessChain %172 %178 
                                                      OpStore %179 %68 
                                                      OpBranch %78 
                                              %78 = OpLabel 
                                       f32_4 %181 = OpLoad %172 
                              Uniform f32_4* %182 = OpAccessChain %32 %40 
                                       f32_4 %183 = OpLoad %182 
                                         f32 %184 = OpDot %181 %183 
                                                      OpStore %180 %184 
                                         f32 %185 = OpLoad %180 
                                         f32 %187 = OpExtInst %1 43 %185 %186 %68 
                                                      OpStore %180 %187 
                                Private f32* %189 = OpAccessChain %20 %151 
                                         f32 %190 = OpLoad %189 
                                        bool %191 = OpFOrdLessThan %186 %190 
                                                      OpStore %188 %191 
                                        bool %195 = OpLoad %188 
                                                      OpSelectionMerge %197 None 
                                                      OpBranchConditional %195 %196 %198 
                                             %196 = OpLabel 
                                                      OpStore %194 %68 
                                                      OpBranch %197 
                                             %198 = OpLabel 
                                                      OpStore %194 %186 
                                                      OpBranch %197 
                                             %197 = OpLabel 
                                         f32 %199 = OpLoad %194 
                                Private f32* %200 = OpAccessChain %192 %64 
                                                      OpStore %200 %199 
                                       f32_4 %201 = OpLoad %20 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                       f32_4 %203 = OpLoad %20 
                                       f32_2 %204 = OpVectorShuffle %203 %203 3 3 
                                       f32_2 %205 = OpFDiv %202 %204 
                                                      OpStore %150 %205 
                                       f32_2 %206 = OpLoad %150 
                                       f32_2 %208 = OpFAdd %206 %207 
                                                      OpStore %150 %208 
                  read_only Texture2DSampled %211 = OpLoad %210 
                                       f32_2 %212 = OpLoad %150 
                                       f32_4 %213 = OpImageSampleImplicitLod %211 %212 
                                         f32 %214 = OpCompositeExtract %213 3 
                                                      OpStore %209 %214 
                                         f32 %215 = OpLoad %209 
                                Private f32* %216 = OpAccessChain %192 %64 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFMul %215 %217 
                                Private f32* %219 = OpAccessChain %192 %64 
                                                      OpStore %219 %218 
                                       f32_4 %220 = OpLoad %20 
                                       f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
                                       f32_4 %222 = OpLoad %20 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                         f32 %224 = OpDot %221 %223 
                                Private f32* %225 = OpAccessChain %20 %64 
                                                      OpStore %225 %224 
                  read_only Texture2DSampled %227 = OpLoad %226 
                                       f32_4 %228 = OpLoad %20 
                                       f32_2 %229 = OpVectorShuffle %228 %228 0 0 
                                       f32_4 %230 = OpImageSampleImplicitLod %227 %229 
                                         f32 %231 = OpCompositeExtract %230 3 
                                Private f32* %232 = OpAccessChain %20 %64 
                                                      OpStore %232 %231 
                                Private f32* %233 = OpAccessChain %20 %64 
                                         f32 %234 = OpLoad %233 
                                Private f32* %235 = OpAccessChain %192 %64 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFMul %234 %236 
                                Private f32* %238 = OpAccessChain %192 %64 
                                                      OpStore %238 %237 
                                         f32 %239 = OpLoad %180 
                                Private f32* %240 = OpAccessChain %192 %64 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFMul %239 %241 
                                                      OpStore %180 %242 
                                       f32_4 %243 = OpLoad %9 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                              Uniform f32_4* %246 = OpAccessChain %32 %245 
                                       f32_4 %247 = OpLoad %246 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
                                       f32_3 %249 = OpFMul %244 %248 
                                                      OpStore %192 %249 
                                         f32 %252 = OpLoad %180 
                                       f32_3 %253 = OpCompositeConstruct %252 %252 %252 
                                       f32_3 %254 = OpLoad %192 
                                       f32_3 %255 = OpFMul %253 %254 
                                       f32_4 %256 = OpLoad %251 
                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 6 3 
                                                      OpStore %251 %257 
                                Private f32* %258 = OpAccessChain %9 %178 
                                         f32 %259 = OpLoad %258 
                                 Output f32* %261 = OpAccessChain %251 %178 
                                                      OpStore %261 %259 
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
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat10_3;
float u_xlat6;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
    u_xlat0.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
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
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
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
                                             %149 = OpTypePointer Output %6 
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
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 251
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %24 %239 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %24 Location 24 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 RelaxedPrecision 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 RelaxedPrecision 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %178 DescriptorSet 178 
                                                      OpDecorate %178 Binding 178 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %205 DescriptorSet 205 
                                                      OpDecorate %205 Binding 205 
                                                      OpDecorate %214 DescriptorSet 214 
                                                      OpDecorate %214 Binding 214 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %239 Location 239 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
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
                                              %20 = OpTypeVector %6 3 
                                              %21 = OpTypePointer Private %20 
                               Private f32_3* %22 = OpVariable Private 
                                              %23 = OpTypePointer Input %20 
                                 Input f32_3* %24 = OpVariable Input 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 4 
                                              %29 = OpTypeArray %7 %28 
                                              %30 = OpTypeArray %7 %28 
                                              %31 = OpTypeStruct %7 %7 %29 %20 %20 %7 %30 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4];}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 6 
                                          i32 %36 = OpConstant 1 
                                              %37 = OpTypePointer Uniform %7 
                                          i32 %42 = OpConstant 0 
                                          i32 %51 = OpConstant 2 
                                          i32 %61 = OpConstant 3 
                                              %66 = OpTypeBool 
                                              %67 = OpTypePointer Private %66 
                                Private bool* %68 = OpVariable Private 
                                          u32 %69 = OpConstant 0 
                                              %70 = OpTypePointer Uniform %6 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                          u32 %84 = OpConstant 1 
                               Private f32_4* %88 = OpVariable Private 
                                             %127 = OpTypePointer Function %20 
                                         i32 %141 = OpConstant 4 
                                             %142 = OpTypePointer Uniform %20 
                                             %156 = OpTypePointer Private %6 
                                Private f32* %157 = OpVariable Private 
                                         f32 %160 = OpConstant 3.67402E-40 
                                         f32 %162 = OpConstant 3.67402E-40 
                                Private f32* %164 = OpVariable Private 
                                         u32 %165 = OpConstant 2 
                                         f32 %168 = OpConstant 3.67402E-40 
                                             %175 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %176 = OpTypeSampledImage %175 
                                             %177 = OpTypePointer UniformConstant %176 
 UniformConstant read_only Texture3DSampled* %178 = OpVariable UniformConstant 
                              Private f32_4* %183 = OpVariable Private 
                                         u32 %189 = OpConstant 3 
                              Private f32_3* %191 = OpVariable Private 
                                         f32 %199 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %205 = OpVariable UniformConstant 
                                             %211 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %212 = OpTypeSampledImage %211 
                                             %213 = OpTypePointer UniformConstant %212 
UniformConstant read_only TextureCubeSampled* %214 = OpVariable UniformConstant 
                                         i32 %233 = OpConstant 5 
                                             %238 = OpTypePointer Output %7 
                               Output f32_4* %239 = OpVariable Output 
                                             %248 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %128 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_3 %25 = OpLoad %24 
                                        f32_3 %26 = OpVectorShuffle %25 %25 1 1 1 
                               Uniform f32_4* %38 = OpAccessChain %33 %35 %36 
                                        f32_4 %39 = OpLoad %38 
                                        f32_3 %40 = OpVectorShuffle %39 %39 0 1 2 
                                        f32_3 %41 = OpFMul %26 %40 
                                                      OpStore %22 %41 
                               Uniform f32_4* %43 = OpAccessChain %33 %35 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                        f32_3 %46 = OpLoad %24 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 0 0 
                                        f32_3 %48 = OpFMul %45 %47 
                                        f32_3 %49 = OpLoad %22 
                                        f32_3 %50 = OpFAdd %48 %49 
                                                      OpStore %22 %50 
                               Uniform f32_4* %52 = OpAccessChain %33 %35 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                        f32_3 %55 = OpLoad %24 
                                        f32_3 %56 = OpVectorShuffle %55 %55 2 2 2 
                                        f32_3 %57 = OpFMul %54 %56 
                                        f32_3 %58 = OpLoad %22 
                                        f32_3 %59 = OpFAdd %57 %58 
                                                      OpStore %22 %59 
                                        f32_3 %60 = OpLoad %22 
                               Uniform f32_4* %62 = OpAccessChain %33 %35 %61 
                                        f32_4 %63 = OpLoad %62 
                                        f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                                        f32_3 %65 = OpFAdd %60 %64 
                                                      OpStore %22 %65 
                                 Uniform f32* %71 = OpAccessChain %33 %36 %69 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %68 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %68 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %185 
                                              %82 = OpLabel 
                                 Uniform f32* %85 = OpAccessChain %33 %36 %84 
                                          f32 %86 = OpLoad %85 
                                         bool %87 = OpFOrdEqual %86 %73 
                                                      OpStore %68 %87 
                                        f32_3 %89 = OpLoad %24 
                                        f32_3 %90 = OpVectorShuffle %89 %89 1 1 1 
                               Uniform f32_4* %91 = OpAccessChain %33 %51 %36 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %88 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                                      OpStore %88 %96 
                               Uniform f32_4* %97 = OpAccessChain %33 %51 %42 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_3 %100 = OpLoad %24 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 0 0 
                                       f32_3 %102 = OpFMul %99 %101 
                                       f32_4 %103 = OpLoad %88 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpFAdd %102 %104 
                                       f32_4 %106 = OpLoad %88 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %88 %107 
                              Uniform f32_4* %108 = OpAccessChain %33 %51 %51 
                                       f32_4 %109 = OpLoad %108 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpLoad %24 
                                       f32_3 %112 = OpVectorShuffle %111 %111 2 2 2 
                                       f32_3 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %88 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFAdd %113 %115 
                                       f32_4 %117 = OpLoad %88 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                                      OpStore %88 %118 
                                       f32_4 %119 = OpLoad %88 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                              Uniform f32_4* %121 = OpAccessChain %33 %51 %61 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFAdd %120 %123 
                                       f32_4 %125 = OpLoad %88 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                      OpStore %88 %126 
                                        bool %129 = OpLoad %68 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %134 
                                             %130 = OpLabel 
                                       f32_4 %132 = OpLoad %88 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                                      OpStore %128 %133 
                                                      OpBranch %131 
                                             %134 = OpLabel 
                                       f32_3 %135 = OpLoad %24 
                                                      OpStore %128 %135 
                                                      OpBranch %131 
                                             %131 = OpLabel 
                                       f32_3 %136 = OpLoad %128 
                                       f32_4 %137 = OpLoad %88 
                                       f32_4 %138 = OpVectorShuffle %137 %136 4 5 6 3 
                                                      OpStore %88 %138 
                                       f32_4 %139 = OpLoad %88 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %33 %141 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFNegate %144 
                                       f32_3 %146 = OpFAdd %140 %145 
                                       f32_4 %147 = OpLoad %88 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %88 %148 
                                       f32_4 %149 = OpLoad %88 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                              Uniform f32_3* %151 = OpAccessChain %33 %61 
                                       f32_3 %152 = OpLoad %151 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %88 
                                       f32_4 %155 = OpVectorShuffle %154 %153 0 4 5 6 
                                                      OpStore %88 %155 
                                Private f32* %158 = OpAccessChain %88 %84 
                                         f32 %159 = OpLoad %158 
                                         f32 %161 = OpFMul %159 %160 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %157 %163 
                                Uniform f32* %166 = OpAccessChain %33 %36 %165 
                                         f32 %167 = OpLoad %166 
                                         f32 %169 = OpFMul %167 %168 
                                         f32 %170 = OpFAdd %169 %162 
                                                      OpStore %164 %170 
                                         f32 %171 = OpLoad %157 
                                         f32 %172 = OpLoad %164 
                                         f32 %173 = OpExtInst %1 40 %171 %172 
                                Private f32* %174 = OpAccessChain %88 %69 
                                                      OpStore %174 %173 
                  read_only Texture3DSampled %179 = OpLoad %178 
                                       f32_4 %180 = OpLoad %88 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 2 3 
                                       f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                                                      OpStore %88 %182 
                                       f32_4 %184 = OpLoad %88 
                                                      OpStore %183 %184 
                                                      OpBranch %83 
                                             %185 = OpLabel 
                                Private f32* %186 = OpAccessChain %183 %69 
                                                      OpStore %186 %73 
                                Private f32* %187 = OpAccessChain %183 %84 
                                                      OpStore %187 %73 
                                Private f32* %188 = OpAccessChain %183 %165 
                                                      OpStore %188 %73 
                                Private f32* %190 = OpAccessChain %183 %189 
                                                      OpStore %190 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %192 = OpLoad %183 
                              Uniform f32_4* %193 = OpAccessChain %33 %42 
                                       f32_4 %194 = OpLoad %193 
                                         f32 %195 = OpDot %192 %194 
                                Private f32* %196 = OpAccessChain %191 %69 
                                                      OpStore %196 %195 
                                Private f32* %197 = OpAccessChain %191 %69 
                                         f32 %198 = OpLoad %197 
                                         f32 %200 = OpExtInst %1 43 %198 %199 %73 
                                Private f32* %201 = OpAccessChain %191 %69 
                                                      OpStore %201 %200 
                                       f32_3 %202 = OpLoad %22 
                                       f32_3 %203 = OpLoad %22 
                                         f32 %204 = OpDot %202 %203 
                                                      OpStore %157 %204 
                  read_only Texture2DSampled %206 = OpLoad %205 
                                         f32 %207 = OpLoad %157 
                                       f32_2 %208 = OpCompositeConstruct %207 %207 
                                       f32_4 %209 = OpImageSampleImplicitLod %206 %208 
                                         f32 %210 = OpCompositeExtract %209 3 
                                                      OpStore %157 %210 
                read_only TextureCubeSampled %215 = OpLoad %214 
                                       f32_3 %216 = OpLoad %22 
                                       f32_4 %217 = OpImageSampleImplicitLod %215 %216 
                                         f32 %218 = OpCompositeExtract %217 3 
                                Private f32* %219 = OpAccessChain %22 %69 
                                                      OpStore %219 %218 
                                Private f32* %220 = OpAccessChain %22 %69 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpLoad %157 
                                         f32 %223 = OpFMul %221 %222 
                                Private f32* %224 = OpAccessChain %22 %69 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %191 %69 
                                         f32 %226 = OpLoad %225 
                                Private f32* %227 = OpAccessChain %22 %69 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFMul %226 %228 
                                Private f32* %230 = OpAccessChain %22 %69 
                                                      OpStore %230 %229 
                                       f32_4 %231 = OpLoad %9 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                              Uniform f32_4* %234 = OpAccessChain %33 %233 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_3 %237 = OpFMul %232 %236 
                                                      OpStore %191 %237 
                                       f32_3 %240 = OpLoad %22 
                                       f32_3 %241 = OpVectorShuffle %240 %240 0 0 0 
                                       f32_3 %242 = OpLoad %191 
                                       f32_3 %243 = OpFMul %241 %242 
                                       f32_4 %244 = OpLoad %239 
                                       f32_4 %245 = OpVectorShuffle %244 %243 4 5 6 3 
                                                      OpStore %239 %245 
                                Private f32* %246 = OpAccessChain %9 %189 
                                         f32 %247 = OpLoad %246 
                                 Output f32* %249 = OpAccessChain %239 %189 
                                                      OpStore %249 %247 
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
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
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
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec2 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
    u_xlat0.xyz = u_xlat10_0.xyz * _LightColor0.xyz;
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
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
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
                                             %149 = OpTypePointer Output %6 
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
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 235
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %24 %223 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %24 Location 24 
                                                      OpDecorate %29 ArrayStride 29 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 RelaxedPrecision 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 RelaxedPrecision 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %81 SpecId 81 
                                                      OpDecorate %178 DescriptorSet 178 
                                                      OpDecorate %178 Binding 178 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %203 DescriptorSet 203 
                                                      OpDecorate %203 Binding 203 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %223 Location 223 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
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
                                              %22 = OpTypeVector %6 3 
                                              %23 = OpTypePointer Input %22 
                                 Input f32_3* %24 = OpVariable Input 
                                              %27 = OpTypeInt 32 0 
                                          u32 %28 = OpConstant 4 
                                              %29 = OpTypeArray %7 %28 
                                              %30 = OpTypeArray %7 %28 
                                              %31 = OpTypeStruct %7 %7 %29 %22 %22 %7 %30 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4];}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 6 
                                          i32 %36 = OpConstant 1 
                                              %37 = OpTypePointer Uniform %7 
                                          i32 %42 = OpConstant 0 
                                          i32 %51 = OpConstant 2 
                                          i32 %61 = OpConstant 3 
                                              %66 = OpTypeBool 
                                              %67 = OpTypePointer Private %66 
                                Private bool* %68 = OpVariable Private 
                                          u32 %69 = OpConstant 0 
                                              %70 = OpTypePointer Uniform %6 
                                          f32 %73 = OpConstant 3.67402E-40 
                                         bool %75 = OpConstantFalse 
                                         bool %81 = OpSpecConstantFalse 
                                          u32 %84 = OpConstant 1 
                               Private f32_4* %88 = OpVariable Private 
                                             %127 = OpTypePointer Function %22 
                                         i32 %141 = OpConstant 4 
                                             %142 = OpTypePointer Uniform %22 
                                             %156 = OpTypePointer Private %6 
                                Private f32* %157 = OpVariable Private 
                                         f32 %160 = OpConstant 3.67402E-40 
                                         f32 %162 = OpConstant 3.67402E-40 
                                Private f32* %164 = OpVariable Private 
                                         u32 %165 = OpConstant 2 
                                         f32 %168 = OpConstant 3.67402E-40 
                                             %175 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %176 = OpTypeSampledImage %175 
                                             %177 = OpTypePointer UniformConstant %176 
 UniformConstant read_only Texture3DSampled* %178 = OpVariable UniformConstant 
                              Private f32_4* %183 = OpVariable Private 
                                         u32 %189 = OpConstant 3 
                                             %191 = OpTypePointer Private %22 
                              Private f32_3* %192 = OpVariable Private 
                                         f32 %200 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %203 = OpVariable UniformConstant 
                                         i32 %217 = OpConstant 5 
                                             %222 = OpTypePointer Output %7 
                               Output f32_4* %223 = OpVariable Output 
                                             %232 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %128 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_3 %25 = OpLoad %24 
                                        f32_2 %26 = OpVectorShuffle %25 %25 1 1 
                               Uniform f32_4* %38 = OpAccessChain %33 %35 %36 
                                        f32_4 %39 = OpLoad %38 
                                        f32_2 %40 = OpVectorShuffle %39 %39 0 1 
                                        f32_2 %41 = OpFMul %26 %40 
                                                      OpStore %21 %41 
                               Uniform f32_4* %43 = OpAccessChain %33 %35 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_2 %45 = OpVectorShuffle %44 %44 0 1 
                                        f32_3 %46 = OpLoad %24 
                                        f32_2 %47 = OpVectorShuffle %46 %46 0 0 
                                        f32_2 %48 = OpFMul %45 %47 
                                        f32_2 %49 = OpLoad %21 
                                        f32_2 %50 = OpFAdd %48 %49 
                                                      OpStore %21 %50 
                               Uniform f32_4* %52 = OpAccessChain %33 %35 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                        f32_3 %55 = OpLoad %24 
                                        f32_2 %56 = OpVectorShuffle %55 %55 2 2 
                                        f32_2 %57 = OpFMul %54 %56 
                                        f32_2 %58 = OpLoad %21 
                                        f32_2 %59 = OpFAdd %57 %58 
                                                      OpStore %21 %59 
                                        f32_2 %60 = OpLoad %21 
                               Uniform f32_4* %62 = OpAccessChain %33 %35 %61 
                                        f32_4 %63 = OpLoad %62 
                                        f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                                        f32_2 %65 = OpFAdd %60 %64 
                                                      OpStore %21 %65 
                                 Uniform f32* %71 = OpAccessChain %33 %36 %69 
                                          f32 %72 = OpLoad %71 
                                         bool %74 = OpFOrdEqual %72 %73 
                                                      OpStore %68 %74 
                                                      OpSelectionMerge %77 None 
                                                      OpBranchConditional %75 %76 %77 
                                              %76 = OpLabel 
                                         bool %78 = OpLoad %68 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpBranch %77 
                                              %77 = OpLabel 
                                                      OpSelectionMerge %83 None 
                                                      OpBranchConditional %81 %82 %185 
                                              %82 = OpLabel 
                                 Uniform f32* %85 = OpAccessChain %33 %36 %84 
                                          f32 %86 = OpLoad %85 
                                         bool %87 = OpFOrdEqual %86 %73 
                                                      OpStore %68 %87 
                                        f32_3 %89 = OpLoad %24 
                                        f32_3 %90 = OpVectorShuffle %89 %89 1 1 1 
                               Uniform f32_4* %91 = OpAccessChain %33 %51 %36 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %88 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                                      OpStore %88 %96 
                               Uniform f32_4* %97 = OpAccessChain %33 %51 %42 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_3 %100 = OpLoad %24 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 0 0 
                                       f32_3 %102 = OpFMul %99 %101 
                                       f32_4 %103 = OpLoad %88 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpFAdd %102 %104 
                                       f32_4 %106 = OpLoad %88 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %88 %107 
                              Uniform f32_4* %108 = OpAccessChain %33 %51 %51 
                                       f32_4 %109 = OpLoad %108 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpLoad %24 
                                       f32_3 %112 = OpVectorShuffle %111 %111 2 2 2 
                                       f32_3 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %88 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFAdd %113 %115 
                                       f32_4 %117 = OpLoad %88 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                                      OpStore %88 %118 
                                       f32_4 %119 = OpLoad %88 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                              Uniform f32_4* %121 = OpAccessChain %33 %51 %61 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFAdd %120 %123 
                                       f32_4 %125 = OpLoad %88 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                      OpStore %88 %126 
                                        bool %129 = OpLoad %68 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %134 
                                             %130 = OpLabel 
                                       f32_4 %132 = OpLoad %88 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                                      OpStore %128 %133 
                                                      OpBranch %131 
                                             %134 = OpLabel 
                                       f32_3 %135 = OpLoad %24 
                                                      OpStore %128 %135 
                                                      OpBranch %131 
                                             %131 = OpLabel 
                                       f32_3 %136 = OpLoad %128 
                                       f32_4 %137 = OpLoad %88 
                                       f32_4 %138 = OpVectorShuffle %137 %136 4 5 6 3 
                                                      OpStore %88 %138 
                                       f32_4 %139 = OpLoad %88 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                              Uniform f32_3* %143 = OpAccessChain %33 %141 
                                       f32_3 %144 = OpLoad %143 
                                       f32_3 %145 = OpFNegate %144 
                                       f32_3 %146 = OpFAdd %140 %145 
                                       f32_4 %147 = OpLoad %88 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %88 %148 
                                       f32_4 %149 = OpLoad %88 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                              Uniform f32_3* %151 = OpAccessChain %33 %61 
                                       f32_3 %152 = OpLoad %151 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %88 
                                       f32_4 %155 = OpVectorShuffle %154 %153 0 4 5 6 
                                                      OpStore %88 %155 
                                Private f32* %158 = OpAccessChain %88 %84 
                                         f32 %159 = OpLoad %158 
                                         f32 %161 = OpFMul %159 %160 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %157 %163 
                                Uniform f32* %166 = OpAccessChain %33 %36 %165 
                                         f32 %167 = OpLoad %166 
                                         f32 %169 = OpFMul %167 %168 
                                         f32 %170 = OpFAdd %169 %162 
                                                      OpStore %164 %170 
                                         f32 %171 = OpLoad %164 
                                         f32 %172 = OpLoad %157 
                                         f32 %173 = OpExtInst %1 40 %171 %172 
                                Private f32* %174 = OpAccessChain %88 %69 
                                                      OpStore %174 %173 
                  read_only Texture3DSampled %179 = OpLoad %178 
                                       f32_4 %180 = OpLoad %88 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 2 3 
                                       f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                                                      OpStore %88 %182 
                                       f32_4 %184 = OpLoad %88 
                                                      OpStore %183 %184 
                                                      OpBranch %83 
                                             %185 = OpLabel 
                                Private f32* %186 = OpAccessChain %183 %69 
                                                      OpStore %186 %73 
                                Private f32* %187 = OpAccessChain %183 %84 
                                                      OpStore %187 %73 
                                Private f32* %188 = OpAccessChain %183 %165 
                                                      OpStore %188 %73 
                                Private f32* %190 = OpAccessChain %183 %189 
                                                      OpStore %190 %73 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                       f32_4 %193 = OpLoad %183 
                              Uniform f32_4* %194 = OpAccessChain %33 %42 
                                       f32_4 %195 = OpLoad %194 
                                         f32 %196 = OpDot %193 %195 
                                Private f32* %197 = OpAccessChain %192 %69 
                                                      OpStore %197 %196 
                                Private f32* %198 = OpAccessChain %192 %69 
                                         f32 %199 = OpLoad %198 
                                         f32 %201 = OpExtInst %1 43 %199 %200 %73 
                                Private f32* %202 = OpAccessChain %192 %69 
                                                      OpStore %202 %201 
                  read_only Texture2DSampled %204 = OpLoad %203 
                                       f32_2 %205 = OpLoad %21 
                                       f32_4 %206 = OpImageSampleImplicitLod %204 %205 
                                         f32 %207 = OpCompositeExtract %206 3 
                                Private f32* %208 = OpAccessChain %21 %69 
                                                      OpStore %208 %207 
                                Private f32* %209 = OpAccessChain %192 %69 
                                         f32 %210 = OpLoad %209 
                                Private f32* %211 = OpAccessChain %21 %69 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpFMul %210 %212 
                                Private f32* %214 = OpAccessChain %21 %69 
                                                      OpStore %214 %213 
                                       f32_4 %215 = OpLoad %9 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                              Uniform f32_4* %218 = OpAccessChain %33 %217 
                                       f32_4 %219 = OpLoad %218 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                                       f32_3 %221 = OpFMul %216 %220 
                                                      OpStore %192 %221 
                                       f32_2 %224 = OpLoad %21 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 0 0 
                                       f32_3 %226 = OpLoad %192 
                                       f32_3 %227 = OpFMul %225 %226 
                                       f32_4 %228 = OpLoad %223 
                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                                      OpStore %223 %229 
                                Private f32* %230 = OpAccessChain %9 %189 
                                         f32 %231 = OpLoad %230 
                                 Output f32* %233 = OpAccessChain %223 %189 
                                                      OpStore %233 %231 
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
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 166985
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
out vec2 vs_TEXCOORD0;
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

uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat16_0;
vec4 u_xlat10_0;
float u_xlat3;
void main()
{
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
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 223
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %32 %89 %166 %177 %178 %209 
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
                                                      OpDecorate %209 Location 209 
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
                               Output f32_4* %209 = OpVariable Output 
                                             %217 = OpTypePointer Output %9 
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
                                       f32_4 %191 = OpVectorShuffle %190 %190 1 1 1 1 
                              Uniform f32_4* %192 = OpAccessChain %42 %120 %121 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpFMul %191 %193 
                                                      OpStore %21 %194 
                              Uniform f32_4* %195 = OpAccessChain %42 %120 %120 
                                       f32_4 %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %13 
                                       f32_4 %198 = OpVectorShuffle %197 %197 0 0 0 0 
                                       f32_4 %199 = OpFMul %196 %198 
                                       f32_4 %200 = OpLoad %21 
                                       f32_4 %201 = OpFAdd %199 %200 
                                                      OpStore %21 %201 
                              Uniform f32_4* %202 = OpAccessChain %42 %120 %44 
                                       f32_4 %203 = OpLoad %202 
                                       f32_4 %204 = OpLoad %13 
                                       f32_4 %205 = OpVectorShuffle %204 %204 2 2 2 2 
                                       f32_4 %206 = OpFMul %203 %205 
                                       f32_4 %207 = OpLoad %21 
                                       f32_4 %208 = OpFAdd %206 %207 
                                                      OpStore %21 %208 
                              Uniform f32_4* %210 = OpAccessChain %42 %120 %92 
                                       f32_4 %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %13 
                                       f32_4 %213 = OpVectorShuffle %212 %212 3 3 3 3 
                                       f32_4 %214 = OpFMul %211 %213 
                                       f32_4 %215 = OpLoad %21 
                                       f32_4 %216 = OpFAdd %214 %215 
                                                      OpStore %209 %216 
                                 Output f32* %218 = OpAccessChain %166 %120 %162 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFNegate %219 
                                 Output f32* %221 = OpAccessChain %166 %120 %162 
                                                      OpStore %221 %220 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 112
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %98 
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
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpMemberDecorate %32 0 Offset 32 
                                                    OpMemberDecorate %32 1 Offset 32 
                                                    OpMemberDecorate %32 2 Offset 32 
                                                    OpDecorate %32 Block 
                                                    OpDecorate %34 DescriptorSet 34 
                                                    OpDecorate %34 Binding 34 
                                                    OpDecorate %45 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %49 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %98 RelaxedPrecision 
                                                    OpDecorate %98 Location 98 
                                                    OpDecorate %109 RelaxedPrecision 
                                                    OpDecorate %110 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 3 
                                             %8 = OpTypePointer Private %7 
                              Private f32_3* %9 = OpVariable Private 
                                            %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %11 = OpTypeSampledImage %10 
                                            %12 = OpTypePointer UniformConstant %11 
UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                            %15 = OpTypeVector %6 2 
                                            %16 = OpTypePointer Input %15 
                               Input f32_2* %17 = OpVariable Input 
                                            %19 = OpTypeVector %6 4 
                                            %22 = OpTypePointer Private %19 
                             Private f32_4* %23 = OpVariable Private 
                                            %28 = OpTypePointer Private %6 
                               Private f32* %29 = OpVariable Private 
                                            %30 = OpTypeInt 32 0 
                                            %31 = OpTypeVector %30 4 
                                            %32 = OpTypeStruct %31 %6 %6 
                                            %33 = OpTypePointer Uniform %32 
         Uniform struct {u32_4; f32; f32;}* %34 = OpVariable Uniform 
                                            %35 = OpTypeInt 32 1 
                                        i32 %36 = OpConstant 1 
                                            %37 = OpTypePointer Uniform %6 
                                        f32 %41 = OpConstant 3.67402E-40 
                                        f32 %42 = OpConstant 3.67402E-40 
                             Private f32_3* %44 = OpVariable Private 
                                        i32 %53 = OpConstant 2 
                                            %66 = OpTypePointer Function %7 
                                        i32 %68 = OpConstant 0 
                                            %69 = OpTypeBool 
                                            %70 = OpTypeVector %69 4 
                                            %71 = OpTypePointer Uniform %31 
                                        u32 %75 = OpConstant 0 
                                      f32_3 %81 = OpConstantComposite %41 %41 %41 
                                            %85 = OpTypePointer Function %6 
                                        u32 %95 = OpConstant 3 
                                            %97 = OpTypePointer Output %19 
                              Output f32_4* %98 = OpVariable Output 
                                            %99 = OpTypePointer Function %19 
                                     f32_4 %107 = OpConstantComposite %41 %41 %41 %42 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                            Function f32_3* %67 = OpVariable Function 
                              Function f32* %86 = OpVariable Function 
                           Function f32_4* %100 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                    OpStore %9 %21 
                                      f32_3 %24 = OpLoad %9 
                                      f32_3 %25 = OpExtInst %1 30 %24 
                                      f32_4 %26 = OpLoad %23 
                                      f32_4 %27 = OpVectorShuffle %26 %25 4 5 6 3 
                                                    OpStore %23 %27 
                               Uniform f32* %38 = OpAccessChain %34 %36 
                                        f32 %39 = OpLoad %38 
                                                    OpStore %29 %39 
                                        f32 %40 = OpLoad %29 
                                        f32 %43 = OpExtInst %1 43 %40 %41 %42 
                                                    OpStore %29 %43 
                                      f32_4 %45 = OpLoad %23 
                                      f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32 %47 = OpLoad %29 
                                      f32_3 %48 = OpCompositeConstruct %47 %47 %47 
                                      f32_3 %49 = OpFMul %46 %48 
                                                    OpStore %44 %49 
                                      f32_3 %50 = OpLoad %44 
                                      f32_3 %51 = OpExtInst %1 29 %50 
                                                    OpStore %44 %51 
                                      f32_3 %52 = OpLoad %44 
                               Uniform f32* %54 = OpAccessChain %34 %53 
                                        f32 %55 = OpLoad %54 
                               Uniform f32* %56 = OpAccessChain %34 %53 
                                        f32 %57 = OpLoad %56 
                               Uniform f32* %58 = OpAccessChain %34 %53 
                                        f32 %59 = OpLoad %58 
                                      f32_3 %60 = OpCompositeConstruct %55 %57 %59 
                                        f32 %61 = OpCompositeExtract %60 0 
                                        f32 %62 = OpCompositeExtract %60 1 
                                        f32 %63 = OpCompositeExtract %60 2 
                                      f32_3 %64 = OpCompositeConstruct %61 %62 %63 
                                      f32_3 %65 = OpExtInst %1 37 %52 %64 
                                                    OpStore %44 %65 
                             Uniform u32_4* %72 = OpAccessChain %34 %68 
                                      u32_4 %73 = OpLoad %72 
                                        u32 %74 = OpCompositeExtract %73 0 
                                       bool %76 = OpINotEqual %74 %75 
                                                    OpSelectionMerge %78 None 
                                                    OpBranchConditional %76 %77 %80 
                                            %77 = OpLabel 
                                      f32_3 %79 = OpLoad %44 
                                                    OpStore %67 %79 
                                                    OpBranch %78 
                                            %80 = OpLabel 
                                                    OpStore %67 %81 
                                                    OpBranch %78 
                                            %78 = OpLabel 
                                      f32_3 %82 = OpLoad %67 
                                      f32_4 %83 = OpLoad %23 
                                      f32_4 %84 = OpVectorShuffle %83 %82 4 5 6 3 
                                                    OpStore %23 %84 
                             Uniform u32_4* %87 = OpAccessChain %34 %68 
                                      u32_4 %88 = OpLoad %87 
                                        u32 %89 = OpCompositeExtract %88 0 
                                       bool %90 = OpINotEqual %89 %75 
                                                    OpSelectionMerge %92 None 
                                                    OpBranchConditional %90 %91 %93 
                                            %91 = OpLabel 
                                                    OpStore %86 %42 
                                                    OpBranch %92 
                                            %93 = OpLabel 
                                                    OpStore %86 %41 
                                                    OpBranch %92 
                                            %92 = OpLabel 
                                        f32 %94 = OpLoad %86 
                               Private f32* %96 = OpAccessChain %23 %95 
                                                    OpStore %96 %94 
                            Uniform u32_4* %101 = OpAccessChain %34 %68 
                                     u32_4 %102 = OpLoad %101 
                                       u32 %103 = OpCompositeExtract %102 1 
                                      bool %104 = OpINotEqual %103 %75 
                                                    OpSelectionMerge %106 None 
                                                    OpBranchConditional %104 %105 %108 
                                           %105 = OpLabel 
                                                    OpStore %100 %107 
                                                    OpBranch %106 
                                           %108 = OpLabel 
                                     f32_4 %109 = OpLoad %23 
                                                    OpStore %100 %109 
                                                    OpBranch %106 
                                           %106 = OpLabel 
                                     f32_4 %110 = OpLoad %100 
                                                    OpStore %98 %110 
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
Fallback "tk2d/BlendVertexColor"
}