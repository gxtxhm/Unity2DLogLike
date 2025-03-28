//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-DeferredReflections" {
Properties {
_SrcBlend ("", Float) = 1
_DstBlend ("", Float) = 1
}
SubShader {
 Pass {
  Blend Zero Zero, Zero Zero
  ZWrite Off
  GpuProgramID 25932
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform  sampler2D _CameraDepthTexture;
uniform  sampler2D _CameraGBufferTexture0;
uniform  sampler2D _CameraGBufferTexture1;
uniform  sampler2D _CameraGBufferTexture2;
uniform  samplerCube unity_SpecCube0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat16_1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat16_2;
vec4 u_xlat10_2;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
bvec3 u_xlatb8;
vec3 u_xlat10;
float u_xlat16_10;
float u_xlat27;
float u_xlat16_27;
float u_xlat16_28;
float u_xlat31;
float u_xlat16_31;
bool u_xlatb31;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_2 = texture(_CameraDepthTexture, u_xlat1.xy);
    u_xlat27 = _ZBufferParams.x * u_xlat10_2.x + _ZBufferParams.y;
    u_xlat27 = float(1.0) / u_xlat27;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat10_2 = texture(_CameraGBufferTexture0, u_xlat1.xy);
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1 = texture(_CameraGBufferTexture2, u_xlat1.xy);
    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_27 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_1.xyz = vec3(u_xlat16_27) * u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat27 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat16_27 = max(u_xlat10_3.y, u_xlat10_3.x);
    u_xlat16_27 = max(u_xlat10_3.z, u_xlat16_27);
    u_xlat16_27 = (-u_xlat16_27) + 1.0;
    u_xlat16_28 = (-u_xlat10_3.w) + 1.0;
    u_xlat4.x = dot(u_xlat2.xyz, u_xlat16_1.xyz);
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat16_1.xyz * (-u_xlat4.xxx) + u_xlat2.xyz;
    u_xlatb31 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb31){
        u_xlat5.xyz = unity_SpecCube0_BoxMin.xyz + (-unity_SpecCube1_ProbePosition.www);
        u_xlat6.xyz = unity_SpecCube0_BoxMax.xyz + unity_SpecCube1_ProbePosition.www;
        u_xlat31 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat7.xyz = vec3(u_xlat31) * u_xlat4.xyz;
        u_xlat6.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat7.xyz;
        u_xlat5.xyz = (-u_xlat0.xyz) + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat7.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        u_xlat5.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat5.x;
        u_xlat5.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat5.y;
        u_xlat5.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat5.z;
        u_xlat31 = min(u_xlat5.y, u_xlat5.x);
        u_xlat31 = min(u_xlat5.z, u_xlat31);
        u_xlat5.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat4.xyz = u_xlat7.xyz * vec3(u_xlat31) + u_xlat5.xyz;
    //ENDIF
    }
    u_xlat16_31 = (-u_xlat16_28) * 0.699999988 + 1.70000005;
    u_xlat16_31 = u_xlat16_28 * u_xlat16_31;
    u_xlat31 = u_xlat16_31 * 6.0;
    u_xlat10_4 = textureLod(unity_SpecCube0, u_xlat4.xyz, u_xlat31);
    u_xlat16_31 = u_xlat10_4.w + -1.0;
    u_xlat31 = unity_SpecCube0_HDR.w * u_xlat16_31 + 1.0;
    u_xlat31 = u_xlat31 * unity_SpecCube0_HDR.x;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat31);
    u_xlat4.xyz = u_xlat10_2.www * u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat16_1.xyz, (-u_xlat2.xyz));
    u_xlat16_10 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_10 = max(u_xlat16_10, 0.00200000009);
    u_xlat16_10 = u_xlat16_10 * 0.280000001;
    u_xlat16_10 = (-u_xlat16_10) * u_xlat16_28 + 1.0;
    u_xlat16_27 = (-u_xlat16_27) + 1.0;
    u_xlat16_27 = u_xlat16_27 + u_xlat10_3.w;
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
    u_xlat10.xyz = u_xlat4.xyz * vec3(u_xlat16_10);
    u_xlat1.x = -abs(u_xlat1.x) + 1.0;
    u_xlat2.x = u_xlat1.x * u_xlat1.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat2.x;
    u_xlat16_2.xyz = (-u_xlat10_3.xyz) + vec3(u_xlat16_27);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat16_2.xyz + u_xlat10_3.xyz;
    SV_Target0.xyz = u_xlat10.xyz * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-unity_SpecCube0_BoxMax.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / unity_SpecCube1_ProbePosition.w;
    SV_Target0.w = (-u_xlat0.x) + 1.0;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %102 %169 %175 
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
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %102 Location 102 
                                                      OpDecorate %169 Location 169 
                                                      OpDecorate %175 Location 175 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                              %84 = OpTypePointer Private %6 
                                          u32 %87 = OpConstant 0 
                                              %88 = OpTypePointer Uniform %6 
                               Private f32_4* %93 = OpVariable Private 
                                              %94 = OpTypeVector %6 3 
                                          f32 %97 = OpConstant 3.67402E-40 
                                        f32_3 %98 = OpConstantComposite %97 %97 %97 
                               Output f32_4* %102 = OpVariable Output 
                                             %103 = OpTypeVector %6 2 
                                         f32 %158 = OpConstant 3.67402E-40 
                                         f32 %159 = OpConstant 3.67402E-40 
                                       f32_3 %160 = OpConstantComposite %158 %158 %159 
                                             %168 = OpTypePointer Input %94 
                                Input f32_3* %169 = OpVariable Input 
                                             %174 = OpTypePointer Output %94 
                               Output f32_3* %175 = OpVariable Output 
                                         i32 %176 = OpConstant 4 
                                             %186 = OpTypePointer Output %6 
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
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %49 %75 
                                        f32_4 %81 = OpLoad %49 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                 Private f32* %85 = OpAccessChain %49 %76 
                                          f32 %86 = OpLoad %85 
                                 Uniform f32* %89 = OpAccessChain %21 %28 %87 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %86 %90 
                                 Private f32* %92 = OpAccessChain %49 %76 
                                                      OpStore %92 %91 
                                        f32_4 %95 = OpLoad %49 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 3 1 
                                        f32_3 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %93 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 1 5 6 
                                                      OpStore %93 %101 
                                       f32_4 %104 = OpLoad %49 
                                       f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                       f32_4 %106 = OpLoad %102 
                                       f32_4 %107 = OpVectorShuffle %106 %105 0 1 4 5 
                                                      OpStore %102 %107 
                                       f32_4 %108 = OpLoad %93 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 2 
                                       f32_4 %110 = OpLoad %93 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 3 
                                       f32_2 %112 = OpFAdd %109 %111 
                                       f32_4 %113 = OpLoad %102 
                                       f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
                                                      OpStore %102 %114 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 1 1 1 
                              Uniform f32_4* %117 = OpAccessChain %21 %36 %23 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %49 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                      OpStore %49 %122 
                              Uniform f32_4* %123 = OpAccessChain %21 %36 %28 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_4 %129 = OpLoad %49 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %49 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %49 %133 
                              Uniform f32_4* %134 = OpAccessChain %21 %36 %36 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %9 
                                       f32_3 %138 = OpVectorShuffle %137 %137 2 2 2 
                                       f32_3 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %49 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpFAdd %139 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %9 %144 
                              Uniform f32_4* %145 = OpAccessChain %21 %36 %45 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_4 %148 = OpLoad %9 
                                       f32_3 %149 = OpVectorShuffle %148 %148 3 3 3 
                                       f32_3 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpFAdd %150 %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %9 %155 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %161 = OpFMul %157 %160 
                                       f32_4 %162 = OpLoad %49 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %49 %163 
                                       f32_4 %164 = OpLoad %9 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFNegate %165 
                                       f32_3 %167 = OpFMul %166 %160 
                                       f32_3 %170 = OpLoad %169 
                                       f32_3 %171 = OpFAdd %167 %170 
                                       f32_4 %172 = OpLoad %9 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %9 %173 
                                Uniform f32* %177 = OpAccessChain %21 %176 
                                         f32 %178 = OpLoad %177 
                                       f32_3 %179 = OpCompositeConstruct %178 %178 %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %49 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFAdd %182 %184 
                                                      OpStore %175 %185 
                                 Output f32* %187 = OpAccessChain %80 %28 %76 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %80 %28 %76 
                                                      OpStore %190 %189 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 538
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %24 %42 %484 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 RelaxedPrecision 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpMemberDecorate %14 8 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %24 Location 24 
                                                      OpDecorate %42 Location 42 
                                                      OpDecorate %52 DescriptorSet 52 
                                                      OpDecorate %52 Binding 52 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %117 RelaxedPrecision 
                                                      OpDecorate %117 DescriptorSet 117 
                                                      OpDecorate %117 Binding 117 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %122 RelaxedPrecision 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %124 RelaxedPrecision 
                                                      OpDecorate %124 DescriptorSet 124 
                                                      OpDecorate %124 Binding 124 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %129 RelaxedPrecision 
                                                      OpDecorate %129 DescriptorSet 129 
                                                      OpDecorate %129 Binding 129 
                                                      OpDecorate %130 RelaxedPrecision 
                                                      OpDecorate %133 RelaxedPrecision 
                                                      OpDecorate %134 RelaxedPrecision 
                                                      OpDecorate %135 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %224 SpecId 224 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %358 RelaxedPrecision 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %363 RelaxedPrecision 
                                                      OpDecorate %365 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %369 DescriptorSet 369 
                                                      OpDecorate %369 Binding 369 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %391 RelaxedPrecision 
                                                      OpDecorate %393 RelaxedPrecision 
                                                      OpDecorate %394 RelaxedPrecision 
                                                      OpDecorate %395 RelaxedPrecision 
                                                      OpDecorate %396 RelaxedPrecision 
                                                      OpDecorate %397 RelaxedPrecision 
                                                      OpDecorate %398 RelaxedPrecision 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %401 RelaxedPrecision 
                                                      OpDecorate %402 RelaxedPrecision 
                                                      OpDecorate %406 RelaxedPrecision 
                                                      OpDecorate %407 RelaxedPrecision 
                                                      OpDecorate %408 RelaxedPrecision 
                                                      OpDecorate %411 RelaxedPrecision 
                                                      OpDecorate %413 RelaxedPrecision 
                                                      OpDecorate %416 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %418 RelaxedPrecision 
                                                      OpDecorate %421 RelaxedPrecision 
                                                      OpDecorate %422 RelaxedPrecision 
                                                      OpDecorate %424 RelaxedPrecision 
                                                      OpDecorate %425 RelaxedPrecision 
                                                      OpDecorate %428 RelaxedPrecision 
                                                      OpDecorate %429 RelaxedPrecision 
                                                      OpDecorate %430 RelaxedPrecision 
                                                      OpDecorate %433 RelaxedPrecision 
                                                      OpDecorate %435 RelaxedPrecision 
                                                      OpDecorate %436 RelaxedPrecision 
                                                      OpDecorate %439 RelaxedPrecision 
                                                      OpDecorate %440 RelaxedPrecision 
                                                      OpDecorate %442 RelaxedPrecision 
                                                      OpDecorate %443 RelaxedPrecision 
                                                      OpDecorate %444 RelaxedPrecision 
                                                      OpDecorate %445 RelaxedPrecision 
                                                      OpDecorate %451 RelaxedPrecision 
                                                      OpDecorate %453 RelaxedPrecision 
                                                      OpDecorate %455 RelaxedPrecision 
                                                      OpDecorate %456 RelaxedPrecision 
                                                      OpDecorate %459 RelaxedPrecision 
                                                      OpDecorate %461 RelaxedPrecision 
                                                      OpDecorate %462 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %467 RelaxedPrecision 
                                                      OpDecorate %468 RelaxedPrecision 
                                                      OpDecorate %470 RelaxedPrecision 
                                                      OpDecorate %471 RelaxedPrecision 
                                                      OpDecorate %472 RelaxedPrecision 
                                                      OpDecorate %473 RelaxedPrecision 
                                                      OpDecorate %474 RelaxedPrecision 
                                                      OpDecorate %475 RelaxedPrecision 
                                                      OpDecorate %476 RelaxedPrecision 
                                                      OpDecorate %477 RelaxedPrecision 
                                                      OpDecorate %478 RelaxedPrecision 
                                                      OpDecorate %479 RelaxedPrecision 
                                                      OpDecorate %480 RelaxedPrecision 
                                                      OpDecorate %481 RelaxedPrecision 
                                                      OpDecorate %482 RelaxedPrecision 
                                                      OpDecorate %484 RelaxedPrecision 
                                                      OpDecorate %484 Location 484 
                                                      OpDecorate %485 RelaxedPrecision 
                                                      OpDecorate %486 RelaxedPrecision 
                                                      OpDecorate %487 RelaxedPrecision 
                                                      OpDecorate %504 RelaxedPrecision 
                                                      OpDecorate %505 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %507 RelaxedPrecision 
                                                      OpDecorate %509 RelaxedPrecision 
                                                      OpDecorate %510 RelaxedPrecision 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %512 RelaxedPrecision 
                                                      OpDecorate %515 RelaxedPrecision 
                                                      OpDecorate %516 RelaxedPrecision 
                                                      OpDecorate %519 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %7 %12 
                                              %14 = OpTypeStruct %10 %7 %7 %13 %7 %7 %7 %7 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_3; f32_4; f32_4; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 1 
                                          u32 %19 = OpConstant 2 
                                              %20 = OpTypePointer Uniform %6 
                                              %23 = OpTypePointer Input %10 
                                 Input f32_3* %24 = OpVariable Input 
                                              %25 = OpTypePointer Input %6 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                              %38 = OpTypeVector %6 2 
                                              %39 = OpTypePointer Private %38 
                               Private f32_2* %40 = OpVariable Private 
                                              %41 = OpTypePointer Input %7 
                                 Input f32_4* %42 = OpVariable Input 
                                 Private f32* %48 = OpVariable Private 
                                              %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %50 = OpTypeSampledImage %49 
                                              %51 = OpTypePointer UniformConstant %50 
  UniformConstant read_only Texture2DSampled* %52 = OpVariable UniformConstant 
                                          i32 %57 = OpConstant 2 
                                          u32 %62 = OpConstant 1 
                                          f32 %66 = OpConstant 3.67402E-40 
                                              %76 = OpTypePointer Private %10 
                               Private f32_3* %77 = OpVariable Private 
                                          i32 %80 = OpConstant 3 
                                              %81 = OpTypePointer Uniform %7 
                                          i32 %86 = OpConstant 0 
                                Private f32* %116 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %117 = OpVariable UniformConstant 
                                         u32 %121 = OpConstant 3 
                              Private f32_4* %123 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %124 = OpVariable UniformConstant 
                              Private f32_3* %128 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %129 = OpVariable UniformConstant 
                              Private f32_3* %134 = OpVariable Private 
                                         f32 %136 = OpConstant 3.67402E-40 
                                       f32_3 %137 = OpConstantComposite %136 %136 %136 
                                         f32 %139 = OpConstant 3.67402E-40 
                                       f32_3 %140 = OpConstantComposite %139 %139 %139 
                                Private f32* %142 = OpVariable Private 
                              Private f32_3* %152 = OpVariable Private 
                                             %155 = OpTypePointer Uniform %10 
                                Private f32* %160 = OpVariable Private 
                              Private f32_3* %170 = OpVariable Private 
                              Private f32_3* %192 = OpVariable Private 
                                             %210 = OpTypeBool 
                                             %211 = OpTypePointer Private %210 
                               Private bool* %212 = OpVariable Private 
                                         f32 %213 = OpConstant 3.67402E-40 
                                         i32 %214 = OpConstant 6 
                                        bool %218 = OpConstantFalse 
                                        bool %224 = OpSpecConstantFalse 
                              Private f32_3* %227 = OpVariable Private 
                                         i32 %228 = OpConstant 5 
                                         i32 %232 = OpConstant 8 
                              Private f32_3* %238 = OpVariable Private 
                                         i32 %239 = OpConstant 4 
                              Private f32_3* %247 = OpVariable Private 
                                             %276 = OpTypeVector %210 3 
                                             %277 = OpTypePointer Private %276 
                             Private bool_3* %278 = OpVariable Private 
                                       f32_4 %279 = OpConstantComposite %213 %213 %213 %213 
                                             %282 = OpTypeVector %210 4 
                              Private f32_3* %285 = OpVariable Private 
                                             %286 = OpTypePointer Function %6 
                                Private f32* %323 = OpVariable Private 
                              Private f32_3* %340 = OpVariable Private 
                                         f32 %350 = OpConstant 3.67402E-40 
                                         f32 %352 = OpConstant 3.67402E-40 
                                         f32 %362 = OpConstant 3.67402E-40 
                              Private f32_4* %365 = OpVariable Private 
                                             %366 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %367 = OpTypeSampledImage %366 
                                             %368 = OpTypePointer UniformConstant %367 
UniformConstant read_only TextureCubeSampled* %369 = OpVariable UniformConstant 
                                         i32 %379 = OpConstant 7 
                                         f32 %412 = OpConstant 3.67402E-40 
                                         f32 %423 = OpConstant 3.67402E-40 
                              Private f32_3* %451 = OpVariable Private 
                                             %483 = OpTypePointer Output %7 
                               Output f32_4* %484 = OpVariable Output 
                                       f32_3 %508 = OpConstantComposite %213 %213 %213 
                                             %535 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %287 = OpVariable Function 
                               Function f32* %299 = OpVariable Function 
                               Function f32* %311 = OpVariable Function 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                   Input f32* %26 = OpAccessChain %24 %19 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFDiv %22 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 0 0 
                                        f32_3 %34 = OpLoad %24 
                                        f32_3 %35 = OpFMul %33 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                                                      OpStore %9 %37 
                                        f32_4 %43 = OpLoad %42 
                                        f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                                        f32_4 %45 = OpLoad %42 
                                        f32_2 %46 = OpVectorShuffle %45 %45 3 3 
                                        f32_2 %47 = OpFDiv %44 %46 
                                                      OpStore %40 %47 
                   read_only Texture2DSampled %53 = OpLoad %52 
                                        f32_2 %54 = OpLoad %40 
                                        f32_4 %55 = OpImageSampleImplicitLod %53 %54 
                                          f32 %56 = OpCompositeExtract %55 0 
                                                      OpStore %48 %56 
                                 Uniform f32* %58 = OpAccessChain %16 %57 %29 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpLoad %48 
                                          f32 %61 = OpFMul %59 %60 
                                 Uniform f32* %63 = OpAccessChain %16 %57 %62 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpFAdd %61 %64 
                                                      OpStore %48 %65 
                                          f32 %67 = OpLoad %48 
                                          f32 %68 = OpFDiv %66 %67 
                                                      OpStore %48 %68 
                                          f32 %69 = OpLoad %48 
                                        f32_3 %70 = OpCompositeConstruct %69 %69 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
                                        f32_3 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                                      OpStore %9 %75 
                                        f32_4 %78 = OpLoad %9 
                                        f32_3 %79 = OpVectorShuffle %78 %78 1 1 1 
                               Uniform f32_4* %82 = OpAccessChain %16 %80 %18 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFMul %79 %84 
                                                      OpStore %77 %85 
                               Uniform f32_4* %87 = OpAccessChain %16 %80 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_4 %90 = OpLoad %9 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %89 %91 
                                        f32_3 %93 = OpLoad %77 
                                        f32_3 %94 = OpFAdd %92 %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 2 6 
                                                      OpStore %9 %96 
                               Uniform f32_4* %97 = OpAccessChain %16 %80 %57 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_4 %100 = OpLoad %9 
                                       f32_3 %101 = OpVectorShuffle %100 %100 2 2 2 
                                       f32_3 %102 = OpFMul %99 %101 
                                       f32_4 %103 = OpLoad %9 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 3 
                                       f32_3 %105 = OpFAdd %102 %104 
                                       f32_4 %106 = OpLoad %9 
                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
                                                      OpStore %9 %107 
                                       f32_4 %108 = OpLoad %9 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                              Uniform f32_4* %110 = OpAccessChain %16 %80 %80 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFAdd %109 %112 
                                       f32_4 %114 = OpLoad %9 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                      OpStore %9 %115 
                  read_only Texture2DSampled %118 = OpLoad %117 
                                       f32_2 %119 = OpLoad %40 
                                       f32_4 %120 = OpImageSampleImplicitLod %118 %119 
                                         f32 %122 = OpCompositeExtract %120 3 
                                                      OpStore %116 %122 
                  read_only Texture2DSampled %125 = OpLoad %124 
                                       f32_2 %126 = OpLoad %40 
                                       f32_4 %127 = OpImageSampleImplicitLod %125 %126 
                                                      OpStore %123 %127 
                  read_only Texture2DSampled %130 = OpLoad %129 
                                       f32_2 %131 = OpLoad %40 
                                       f32_4 %132 = OpImageSampleImplicitLod %130 %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                                      OpStore %128 %133 
                                       f32_3 %135 = OpLoad %128 
                                       f32_3 %138 = OpFMul %135 %137 
                                       f32_3 %141 = OpFAdd %138 %140 
                                                      OpStore %134 %141 
                                       f32_3 %143 = OpLoad %134 
                                       f32_3 %144 = OpLoad %134 
                                         f32 %145 = OpDot %143 %144 
                                                      OpStore %142 %145 
                                         f32 %146 = OpLoad %142 
                                         f32 %147 = OpExtInst %1 32 %146 
                                                      OpStore %142 %147 
                                         f32 %148 = OpLoad %142 
                                       f32_3 %149 = OpCompositeConstruct %148 %148 %148 
                                       f32_3 %150 = OpLoad %134 
                                       f32_3 %151 = OpFMul %149 %150 
                                                      OpStore %134 %151 
                                       f32_4 %153 = OpLoad %9 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                              Uniform f32_3* %156 = OpAccessChain %16 %86 
                                       f32_3 %157 = OpLoad %156 
                                       f32_3 %158 = OpFNegate %157 
                                       f32_3 %159 = OpFAdd %154 %158 
                                                      OpStore %152 %159 
                                       f32_3 %161 = OpLoad %152 
                                       f32_3 %162 = OpLoad %152 
                                         f32 %163 = OpDot %161 %162 
                                                      OpStore %160 %163 
                                         f32 %164 = OpLoad %160 
                                         f32 %165 = OpExtInst %1 32 %164 
                                                      OpStore %160 %165 
                                         f32 %166 = OpLoad %160 
                                       f32_3 %167 = OpCompositeConstruct %166 %166 %166 
                                       f32_3 %168 = OpLoad %152 
                                       f32_3 %169 = OpFMul %167 %168 
                                                      OpStore %152 %169 
                                Private f32* %171 = OpAccessChain %123 %62 
                                         f32 %172 = OpLoad %171 
                                Private f32* %173 = OpAccessChain %123 %29 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpExtInst %1 40 %172 %174 
                                Private f32* %176 = OpAccessChain %170 %29 
                                                      OpStore %176 %175 
                                Private f32* %177 = OpAccessChain %123 %19 
                                         f32 %178 = OpLoad %177 
                                Private f32* %179 = OpAccessChain %170 %29 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpExtInst %1 40 %178 %180 
                                Private f32* %182 = OpAccessChain %170 %29 
                                                      OpStore %182 %181 
                                Private f32* %183 = OpAccessChain %170 %29 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                         f32 %186 = OpFAdd %185 %66 
                                Private f32* %187 = OpAccessChain %170 %29 
                                                      OpStore %187 %186 
                                Private f32* %188 = OpAccessChain %123 %121 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpFNegate %189 
                                         f32 %191 = OpFAdd %190 %66 
                                                      OpStore %142 %191 
                                       f32_3 %193 = OpLoad %152 
                                       f32_3 %194 = OpLoad %134 
                                         f32 %195 = OpDot %193 %194 
                                Private f32* %196 = OpAccessChain %192 %29 
                                                      OpStore %196 %195 
                                Private f32* %197 = OpAccessChain %192 %29 
                                         f32 %198 = OpLoad %197 
                                Private f32* %199 = OpAccessChain %192 %29 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFAdd %198 %200 
                                Private f32* %202 = OpAccessChain %192 %29 
                                                      OpStore %202 %201 
                                       f32_3 %203 = OpLoad %134 
                                       f32_3 %204 = OpLoad %192 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 0 0 
                                       f32_3 %206 = OpFNegate %205 
                                       f32_3 %207 = OpFMul %203 %206 
                                       f32_3 %208 = OpLoad %152 
                                       f32_3 %209 = OpFAdd %207 %208 
                                                      OpStore %192 %209 
                                Uniform f32* %215 = OpAccessChain %16 %214 %121 
                                         f32 %216 = OpLoad %215 
                                        bool %217 = OpFOrdLessThan %213 %216 
                                                      OpStore %212 %217 
                                                      OpSelectionMerge %220 None 
                                                      OpBranchConditional %218 %219 %220 
                                             %219 = OpLabel 
                                        bool %221 = OpLoad %212 
                                                      OpSelectionMerge %223 None 
                                                      OpBranchConditional %221 %222 %223 
                                             %222 = OpLabel 
                                                      OpBranch %223 
                                             %223 = OpLabel 
                                                      OpBranch %220 
                                             %220 = OpLabel 
                                                      OpSelectionMerge %226 None 
                                                      OpBranchConditional %224 %225 %226 
                                             %225 = OpLabel 
                              Uniform f32_4* %229 = OpAccessChain %16 %228 
                                       f32_4 %230 = OpLoad %229 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                              Uniform f32_4* %233 = OpAccessChain %16 %232 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 3 3 3 
                                       f32_3 %236 = OpFNegate %235 
                                       f32_3 %237 = OpFAdd %231 %236 
                                                      OpStore %227 %237 
                              Uniform f32_4* %240 = OpAccessChain %16 %239 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                              Uniform f32_4* %243 = OpAccessChain %16 %232 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 3 3 3 
                                       f32_3 %246 = OpFAdd %242 %245 
                                                      OpStore %238 %246 
                                       f32_3 %248 = OpLoad %192 
                                       f32_3 %249 = OpLoad %192 
                                         f32 %250 = OpDot %248 %249 
                                Private f32* %251 = OpAccessChain %247 %29 
                                                      OpStore %251 %250 
                                Private f32* %252 = OpAccessChain %247 %29 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 32 %253 
                                Private f32* %255 = OpAccessChain %247 %29 
                                                      OpStore %255 %254 
                                       f32_3 %256 = OpLoad %192 
                                       f32_3 %257 = OpLoad %247 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 0 0 
                                       f32_3 %259 = OpFMul %256 %258 
                                                      OpStore %247 %259 
                                       f32_4 %260 = OpLoad %9 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                       f32_3 %262 = OpFNegate %261 
                                       f32_3 %263 = OpLoad %238 
                                       f32_3 %264 = OpFAdd %262 %263 
                                                      OpStore %238 %264 
                                       f32_3 %265 = OpLoad %238 
                                       f32_3 %266 = OpLoad %247 
                                       f32_3 %267 = OpFDiv %265 %266 
                                                      OpStore %238 %267 
                                       f32_4 %268 = OpLoad %9 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                       f32_3 %270 = OpFNegate %269 
                                       f32_3 %271 = OpLoad %227 
                                       f32_3 %272 = OpFAdd %270 %271 
                                                      OpStore %227 %272 
                                       f32_3 %273 = OpLoad %227 
                                       f32_3 %274 = OpLoad %247 
                                       f32_3 %275 = OpFDiv %273 %274 
                                                      OpStore %227 %275 
                                       f32_3 %280 = OpLoad %247 
                                       f32_4 %281 = OpVectorShuffle %280 %280 0 1 2 0 
                                      bool_4 %283 = OpFOrdLessThan %279 %281 
                                      bool_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                                                      OpStore %278 %284 
                                      bool_3 %288 = OpLoad %278 
                                        bool %289 = OpCompositeExtract %288 0 
                                                      OpSelectionMerge %291 None 
                                                      OpBranchConditional %289 %290 %294 
                                             %290 = OpLabel 
                                Private f32* %292 = OpAccessChain %238 %29 
                                         f32 %293 = OpLoad %292 
                                                      OpStore %287 %293 
                                                      OpBranch %291 
                                             %294 = OpLabel 
                                Private f32* %295 = OpAccessChain %227 %29 
                                         f32 %296 = OpLoad %295 
                                                      OpStore %287 %296 
                                                      OpBranch %291 
                                             %291 = OpLabel 
                                         f32 %297 = OpLoad %287 
                                Private f32* %298 = OpAccessChain %285 %29 
                                                      OpStore %298 %297 
                                      bool_3 %300 = OpLoad %278 
                                        bool %301 = OpCompositeExtract %300 1 
                                                      OpSelectionMerge %303 None 
                                                      OpBranchConditional %301 %302 %306 
                                             %302 = OpLabel 
                                Private f32* %304 = OpAccessChain %238 %62 
                                         f32 %305 = OpLoad %304 
                                                      OpStore %299 %305 
                                                      OpBranch %303 
                                             %306 = OpLabel 
                                Private f32* %307 = OpAccessChain %227 %62 
                                         f32 %308 = OpLoad %307 
                                                      OpStore %299 %308 
                                                      OpBranch %303 
                                             %303 = OpLabel 
                                         f32 %309 = OpLoad %299 
                                Private f32* %310 = OpAccessChain %285 %62 
                                                      OpStore %310 %309 
                                      bool_3 %312 = OpLoad %278 
                                        bool %313 = OpCompositeExtract %312 2 
                                                      OpSelectionMerge %315 None 
                                                      OpBranchConditional %313 %314 %318 
                                             %314 = OpLabel 
                                Private f32* %316 = OpAccessChain %238 %19 
                                         f32 %317 = OpLoad %316 
                                                      OpStore %311 %317 
                                                      OpBranch %315 
                                             %318 = OpLabel 
                                Private f32* %319 = OpAccessChain %227 %19 
                                         f32 %320 = OpLoad %319 
                                                      OpStore %311 %320 
                                                      OpBranch %315 
                                             %315 = OpLabel 
                                         f32 %321 = OpLoad %311 
                                Private f32* %322 = OpAccessChain %285 %19 
                                                      OpStore %322 %321 
                                Private f32* %324 = OpAccessChain %285 %62 
                                         f32 %325 = OpLoad %324 
                                Private f32* %326 = OpAccessChain %285 %29 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpExtInst %1 37 %325 %327 
                                                      OpStore %323 %328 
                                Private f32* %329 = OpAccessChain %285 %19 
                                         f32 %330 = OpLoad %329 
                                         f32 %331 = OpLoad %323 
                                         f32 %332 = OpExtInst %1 37 %330 %331 
                                                      OpStore %323 %332 
                                       f32_4 %333 = OpLoad %9 
                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
                              Uniform f32_4* %335 = OpAccessChain %16 %214 
                                       f32_4 %336 = OpLoad %335 
                                       f32_3 %337 = OpVectorShuffle %336 %336 0 1 2 
                                       f32_3 %338 = OpFNegate %337 
                                       f32_3 %339 = OpFAdd %334 %338 
                                                      OpStore %227 %339 
                                       f32_3 %341 = OpLoad %247 
                                         f32 %342 = OpLoad %323 
                                       f32_3 %343 = OpCompositeConstruct %342 %342 %342 
                                       f32_3 %344 = OpFMul %341 %343 
                                       f32_3 %345 = OpLoad %227 
                                       f32_3 %346 = OpFAdd %344 %345 
                                                      OpStore %340 %346 
                                       f32_3 %347 = OpLoad %340 
                                                      OpStore %192 %347 
                                                      OpBranch %226 
                                             %226 = OpLabel 
                                         f32 %348 = OpLoad %142 
                                         f32 %349 = OpFNegate %348 
                                         f32 %351 = OpFMul %349 %350 
                                         f32 %353 = OpFAdd %351 %352 
                                Private f32* %354 = OpAccessChain %247 %29 
                                                      OpStore %354 %353 
                                         f32 %355 = OpLoad %142 
                                Private f32* %356 = OpAccessChain %247 %29 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpFMul %355 %357 
                                Private f32* %359 = OpAccessChain %247 %29 
                                                      OpStore %359 %358 
                                Private f32* %360 = OpAccessChain %247 %29 
                                         f32 %361 = OpLoad %360 
                                         f32 %363 = OpFMul %361 %362 
                                Private f32* %364 = OpAccessChain %247 %29 
                                                      OpStore %364 %363 
                read_only TextureCubeSampled %370 = OpLoad %369 
                                       f32_3 %371 = OpLoad %192 
                                Private f32* %372 = OpAccessChain %247 %29 
                                         f32 %373 = OpLoad %372 
                                       f32_4 %374 = OpImageSampleExplicitLod %370 %371 Lod %7 
                                                      OpStore %365 %374 
                                Private f32* %375 = OpAccessChain %365 %121 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFAdd %376 %139 
                                Private f32* %378 = OpAccessChain %192 %29 
                                                      OpStore %378 %377 
                                Uniform f32* %380 = OpAccessChain %16 %379 %121 
                                         f32 %381 = OpLoad %380 
                                Private f32* %382 = OpAccessChain %192 %29 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFMul %381 %383 
                                         f32 %385 = OpFAdd %384 %66 
                                Private f32* %386 = OpAccessChain %192 %29 
                                                      OpStore %386 %385 
                                Private f32* %387 = OpAccessChain %192 %29 
                                         f32 %388 = OpLoad %387 
                                Uniform f32* %389 = OpAccessChain %16 %379 %29 
                                         f32 %390 = OpLoad %389 
                                         f32 %391 = OpFMul %388 %390 
                                Private f32* %392 = OpAccessChain %192 %29 
                                                      OpStore %392 %391 
                                       f32_4 %393 = OpLoad %365 
                                       f32_3 %394 = OpVectorShuffle %393 %393 0 1 2 
                                       f32_3 %395 = OpLoad %192 
                                       f32_3 %396 = OpVectorShuffle %395 %395 0 0 0 
                                       f32_3 %397 = OpFMul %394 %396 
                                                      OpStore %192 %397 
                                         f32 %398 = OpLoad %116 
                                       f32_3 %399 = OpCompositeConstruct %398 %398 %398 
                                       f32_3 %400 = OpLoad %192 
                                       f32_3 %401 = OpFMul %399 %400 
                                                      OpStore %192 %401 
                                       f32_3 %402 = OpLoad %134 
                                       f32_3 %403 = OpLoad %152 
                                       f32_3 %404 = OpFNegate %403 
                                         f32 %405 = OpDot %402 %404 
                                                      OpStore %48 %405 
                                         f32 %406 = OpLoad %142 
                                         f32 %407 = OpLoad %142 
                                         f32 %408 = OpFMul %406 %407 
                                Private f32* %409 = OpAccessChain %134 %29 
                                                      OpStore %409 %408 
                                Private f32* %410 = OpAccessChain %134 %29 
                                         f32 %411 = OpLoad %410 
                                         f32 %413 = OpExtInst %1 40 %411 %412 
                                Private f32* %414 = OpAccessChain %134 %29 
                                                      OpStore %414 %413 
                                Private f32* %415 = OpAccessChain %134 %29 
                                         f32 %416 = OpLoad %415 
                                         f32 %417 = OpLoad %142 
                                         f32 %418 = OpFMul %416 %417 
                                Private f32* %419 = OpAccessChain %134 %29 
                                                      OpStore %419 %418 
                                Private f32* %420 = OpAccessChain %134 %29 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpFNegate %421 
                                         f32 %424 = OpFMul %422 %423 
                                         f32 %425 = OpFAdd %424 %66 
                                Private f32* %426 = OpAccessChain %134 %29 
                                                      OpStore %426 %425 
                                Private f32* %427 = OpAccessChain %170 %29 
                                         f32 %428 = OpLoad %427 
                                         f32 %429 = OpFNegate %428 
                                         f32 %430 = OpFAdd %429 %66 
                                Private f32* %431 = OpAccessChain %170 %29 
                                                      OpStore %431 %430 
                                Private f32* %432 = OpAccessChain %123 %121 
                                         f32 %433 = OpLoad %432 
                                Private f32* %434 = OpAccessChain %170 %29 
                                         f32 %435 = OpLoad %434 
                                         f32 %436 = OpFAdd %433 %435 
                                Private f32* %437 = OpAccessChain %170 %29 
                                                      OpStore %437 %436 
                                Private f32* %438 = OpAccessChain %170 %29 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpExtInst %1 43 %439 %213 %66 
                                Private f32* %441 = OpAccessChain %170 %29 
                                                      OpStore %441 %440 
                                       f32_3 %442 = OpLoad %192 
                                       f32_3 %443 = OpLoad %134 
                                       f32_3 %444 = OpVectorShuffle %443 %443 0 0 0 
                                       f32_3 %445 = OpFMul %442 %444 
                                                      OpStore %192 %445 
                                         f32 %446 = OpLoad %48 
                                         f32 %447 = OpExtInst %1 4 %446 
                                         f32 %448 = OpFNegate %447 
                                         f32 %449 = OpFAdd %448 %66 
                                Private f32* %450 = OpAccessChain %247 %29 
                                                      OpStore %450 %449 
                                Private f32* %452 = OpAccessChain %247 %29 
                                         f32 %453 = OpLoad %452 
                                Private f32* %454 = OpAccessChain %247 %29 
                                         f32 %455 = OpLoad %454 
                                         f32 %456 = OpFMul %453 %455 
                                Private f32* %457 = OpAccessChain %451 %29 
                                                      OpStore %457 %456 
                                Private f32* %458 = OpAccessChain %451 %29 
                                         f32 %459 = OpLoad %458 
                                Private f32* %460 = OpAccessChain %451 %29 
                                         f32 %461 = OpLoad %460 
                                         f32 %462 = OpFMul %459 %461 
                                Private f32* %463 = OpAccessChain %451 %29 
                                                      OpStore %463 %462 
                                Private f32* %464 = OpAccessChain %247 %29 
                                         f32 %465 = OpLoad %464 
                                Private f32* %466 = OpAccessChain %451 %29 
                                         f32 %467 = OpLoad %466 
                                         f32 %468 = OpFMul %465 %467 
                                Private f32* %469 = OpAccessChain %247 %29 
                                                      OpStore %469 %468 
                                       f32_4 %470 = OpLoad %123 
                                       f32_3 %471 = OpVectorShuffle %470 %470 0 1 2 
                                       f32_3 %472 = OpFNegate %471 
                                       f32_3 %473 = OpLoad %170 
                                       f32_3 %474 = OpVectorShuffle %473 %473 0 0 0 
                                       f32_3 %475 = OpFAdd %472 %474 
                                                      OpStore %451 %475 
                                       f32_3 %476 = OpLoad %247 
                                       f32_3 %477 = OpVectorShuffle %476 %476 0 0 0 
                                       f32_3 %478 = OpLoad %451 
                                       f32_3 %479 = OpFMul %477 %478 
                                       f32_4 %480 = OpLoad %123 
                                       f32_3 %481 = OpVectorShuffle %480 %480 0 1 2 
                                       f32_3 %482 = OpFAdd %479 %481 
                                                      OpStore %247 %482 
                                       f32_3 %485 = OpLoad %192 
                                       f32_3 %486 = OpLoad %247 
                                       f32_3 %487 = OpFMul %485 %486 
                                       f32_4 %488 = OpLoad %484 
                                       f32_4 %489 = OpVectorShuffle %488 %487 4 5 6 3 
                                                      OpStore %484 %489 
                                       f32_4 %490 = OpLoad %9 
                                       f32_3 %491 = OpVectorShuffle %490 %490 0 1 2 
                              Uniform f32_4* %492 = OpAccessChain %16 %239 
                                       f32_4 %493 = OpLoad %492 
                                       f32_3 %494 = OpVectorShuffle %493 %493 0 1 2 
                                       f32_3 %495 = OpFNegate %494 
                                       f32_3 %496 = OpFAdd %491 %495 
                                                      OpStore %170 %496 
                                       f32_4 %497 = OpLoad %9 
                                       f32_3 %498 = OpVectorShuffle %497 %497 0 1 2 
                                       f32_3 %499 = OpFNegate %498 
                              Uniform f32_4* %500 = OpAccessChain %16 %228 
                                       f32_4 %501 = OpLoad %500 
                                       f32_3 %502 = OpVectorShuffle %501 %501 0 1 2 
                                       f32_3 %503 = OpFAdd %499 %502 
                                                      OpStore %247 %503 
                                       f32_3 %504 = OpLoad %170 
                                       f32_3 %505 = OpLoad %247 
                                       f32_3 %506 = OpExtInst %1 40 %504 %505 
                                                      OpStore %170 %506 
                                       f32_3 %507 = OpLoad %170 
                                       f32_3 %509 = OpExtInst %1 40 %507 %508 
                                                      OpStore %170 %509 
                                       f32_3 %510 = OpLoad %170 
                                       f32_3 %511 = OpLoad %170 
                                         f32 %512 = OpDot %510 %511 
                                Private f32* %513 = OpAccessChain %170 %29 
                                                      OpStore %513 %512 
                                Private f32* %514 = OpAccessChain %170 %29 
                                         f32 %515 = OpLoad %514 
                                         f32 %516 = OpExtInst %1 31 %515 
                                Private f32* %517 = OpAccessChain %170 %29 
                                                      OpStore %517 %516 
                                Private f32* %518 = OpAccessChain %170 %29 
                                         f32 %519 = OpLoad %518 
                                Uniform f32* %520 = OpAccessChain %16 %232 %121 
                                         f32 %521 = OpLoad %520 
                                         f32 %522 = OpFDiv %519 %521 
                                Private f32* %523 = OpAccessChain %9 %29 
                                                      OpStore %523 %522 
                                Private f32* %524 = OpAccessChain %9 %29 
                                         f32 %525 = OpLoad %524 
                                         f32 %526 = OpFNegate %525 
                                         f32 %527 = OpFAdd %526 %66 
                                Private f32* %528 = OpAccessChain %9 %29 
                                                      OpStore %528 %527 
                                Private f32* %529 = OpAccessChain %9 %29 
                                         f32 %530 = OpLoad %529 
                                         f32 %531 = OpExtInst %1 43 %530 %213 %66 
                                Private f32* %532 = OpAccessChain %9 %29 
                                                      OpStore %532 %531 
                                Private f32* %533 = OpAccessChain %9 %29 
                                         f32 %534 = OpLoad %533 
                                 Output f32* %536 = OpAccessChain %484 %121 
                                                      OpStore %536 %534 
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
 Pass {
  Blend Zero Zero, Zero Zero
  ZTest Always
  ZWrite Off
  GpuProgramID 99526
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _CameraReflectionsTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy);
    SV_Target0.xyz = exp2((-u_xlat10_0.xyz));
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate %106 Location 106 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.67402E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                              Output f32_2* %106 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore %106 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 35
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %23 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %23 Location 23 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
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
                                            %22 = OpTypePointer Output %19 
                              Output f32_4* %23 = OpVariable Output 
                                        f32 %29 = OpConstant 3.67402E-40 
                                            %30 = OpTypeInt 32 0 
                                        u32 %31 = OpConstant 3 
                                            %32 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                    OpStore %9 %21 
                                      f32_3 %24 = OpLoad %9 
                                      f32_3 %25 = OpFNegate %24 
                                      f32_3 %26 = OpExtInst %1 29 %25 
                                      f32_4 %27 = OpLoad %23 
                                      f32_4 %28 = OpVectorShuffle %27 %26 4 5 6 3 
                                                    OpStore %23 %28 
                                Output f32* %33 = OpAccessChain %23 %31 
                                                    OpStore %33 %29 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _CameraReflectionsTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_HDR_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate %106 Location 106 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.67402E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                              Output f32_2* %106 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore %106 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 33
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %23 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %23 Location 23 
                                                    OpDecorate %24 RelaxedPrecision 
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
                                            %22 = OpTypePointer Output %19 
                              Output f32_4* %23 = OpVariable Output 
                                        f32 %27 = OpConstant 3.67402E-40 
                                            %28 = OpTypeInt 32 0 
                                        u32 %29 = OpConstant 3 
                                            %30 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                    OpStore %9 %21 
                                      f32_3 %24 = OpLoad %9 
                                      f32_4 %25 = OpLoad %23 
                                      f32_4 %26 = OpVectorShuffle %25 %24 4 5 6 3 
                                                    OpStore %23 %26 
                                Output f32* %31 = OpAccessChain %23 %29 
                                                    OpStore %31 %27 
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
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
SubProgram "d3d11 " {
Keywords { "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
}
}
}
}