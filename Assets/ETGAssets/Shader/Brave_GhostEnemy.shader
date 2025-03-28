//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/GhostEnemy" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_FlatColor ("Flat Color", Color) = (0.2,0.3,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_SpecialFlags ("Special Flags", Vector) = (0,0,0,0)
_StencilVal ("Stancil", Float) = 146
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Cull Off
  Stencil {
   Comp NotEqual
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  GpuProgramID 47868
Program "vp" {
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat1 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    vs_TEXCOORD1.y = u_xlat0.x;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xzw = in_POSITION0.xzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _OverrideColor;
uniform 	vec4 _FlatColor;
uniform 	vec4 _SpecialFlags;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = sin(_Time.z);
    u_xlat1.x = u_xlat1.x * 0.25 + 1.75;
    u_xlat1.xyz = u_xlat1.xxx * _FlatColor.xyz;
    u_xlat16 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16 = u_xlat16 * 0.669999957 + 0.330000013;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16) + (-u_xlat0.xyz);
    u_xlat0.xyz = _FlatColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    u_xlat15 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.x = max(u_xlat15, 0.300000012);
    u_xlat15 = u_xlat15 + (-u_xlat1.x);
    u_xlat6.x = dot(_FlatColor.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat6.x = u_xlat6.x + u_xlat6.x;
    u_xlat15 = u_xlat6.x * u_xlat15 + u_xlat1.x;
    u_xlat15 = u_xlat15 * 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(3.0, 3.0, 3.0);
    u_xlat15 = min(vs_TEXCOORD1.y, 0.800000012);
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _SpecialFlags.xyzx).xyz;
    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat15 = u_xlat15 * 0.699999988;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat0.xyz = (u_xlatb2.y) ? vec3(u_xlat15) : u_xlat0.xyz;
    u_xlatb15 = u_xlat0.y>=u_xlat0.z;
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = vec4(u_xlat15) * u_xlat3.xywz + u_xlat1.xywz;
    u_xlatb15 = u_xlat0.x>=u_xlat1.x;
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat15) * u_xlat3 + u_xlat1;
    u_xlat15 = min(u_xlat1.y, u_xlat1.w);
    u_xlat15 = (-u_xlat15) + u_xlat1.x;
    u_xlat2.x = u_xlat15 * 6.0 + 1.00000001e-010;
    u_xlat6.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat6.x = u_xlat6.x / u_xlat2.x;
    u_xlat6.x = u_xlat6.x + u_xlat1.z;
    u_xlat6.xyz = abs(u_xlat6.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-010;
    u_xlat15 = u_xlat15 / u_xlat2.x;
    u_xlat15 = u_xlat15 * 0.5;
    u_xlat6.xyz = vec3(u_xlat15) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.899999976, 0.899999976, 0.899999976) + vec3(0.0, 0.0, 0.300000012);
    u_xlat0.xyz = (u_xlatb2.z) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb15 = u_xlat0.y>=u_xlat0.z;
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat1.xy = (-u_xlat0.zy) + u_xlat0.yz;
    u_xlat1.xy = vec2(u_xlat15) * u_xlat1.xy + u_xlat0.zy;
    u_xlatb15 = u_xlat0.x>=u_xlat1.x;
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat1.z = u_xlat0.x;
    u_xlat2.xyz = (-u_xlat1.xyz) + u_xlat1.zyx;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat15 = min(u_xlat1.y, u_xlat1.z);
    u_xlat15 = (-u_xlat15) + u_xlat1.x;
    u_xlat6.x = u_xlat1.x + 1.00000001e-010;
    u_xlat15 = u_xlat15 / u_xlat6.x;
    u_xlat6.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    u_xlat2.xyw = _OverrideColor.www * u_xlat6.yzx + u_xlat0.yzx;
    u_xlatb0 = u_xlat2.x>=u_xlat2.y;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.xy = u_xlat2.yx;
    u_xlat4.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat3 = u_xlat0.xxxx * u_xlat4 + u_xlat3;
    u_xlatb0 = u_xlat2.w>=u_xlat3.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xyz = u_xlat3.xyw;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat0.x = u_xlat0.x * 6.0 + 1.00000001e-010;
    u_xlat5 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat0.x = u_xlat5 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + u_xlat2.z;
    u_xlat0.xyz = abs(u_xlat0.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat0.xyz = abs(u_xlat0.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 140
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %46 %67 %112 %121 %122 %126 %128 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %67 Location 67 
                                                      OpMemberDecorate %110 0 BuiltIn 110 
                                                      OpMemberDecorate %110 1 BuiltIn 110 
                                                      OpMemberDecorate %110 2 BuiltIn 110 
                                                      OpDecorate %110 Block 
                                                      OpDecorate %121 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %122 Location 122 
                                                      OpDecorate %126 Location 126 
                                                      OpDecorate %128 Location 128 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeStruct %12 %13 %6 %6 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4[4]; f32_4[4]; f32; f32;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 3 
                                              %19 = OpTypePointer Uniform %6 
                                          f32 %22 = OpConstant 3.67402E-40 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                          i32 %29 = OpConstant 2 
                                          f32 %36 = OpConstant 3.67402E-40 
                                 Private f32* %39 = OpVariable Private 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %7 
                                 Input f32_4* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                               Private f32_4* %57 = OpVariable Private 
                                          i32 %60 = OpConstant 0 
                                          i32 %61 = OpConstant 1 
                                              %62 = OpTypePointer Uniform %7 
                                              %66 = OpTypePointer Output %7 
                                Output f32_4* %67 = OpVariable Output 
                                              %70 = OpTypePointer Output %6 
                                             %109 = OpTypeArray %6 %47 
                                             %110 = OpTypeStruct %7 %6 %109 
                                             %111 = OpTypePointer Output %110 
        Output struct {f32_4; f32; f32[1];}* %112 = OpVariable Output 
                               Output f32_4* %121 = OpVariable Output 
                                Input f32_4* %122 = OpVariable Input 
                                             %124 = OpTypeVector %6 2 
                                             %125 = OpTypePointer Output %124 
                               Output f32_2* %126 = OpVariable Output 
                                             %127 = OpTypePointer Input %124 
                                Input f32_2* %128 = OpVariable Input 
                                             %130 = OpTypeVector %6 3 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %20 = OpAccessChain %16 %18 
                                          f32 %21 = OpLoad %20 
                                          f32 %23 = OpFAdd %21 %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Private f32* %27 = OpAccessChain %9 %24 
                                          f32 %28 = OpLoad %27 
                                 Uniform f32* %30 = OpAccessChain %16 %29 
                                          f32 %31 = OpLoad %30 
                                          f32 %32 = OpFMul %28 %31 
                                 Private f32* %33 = OpAccessChain %9 %24 
                                                      OpStore %33 %32 
                                 Private f32* %34 = OpAccessChain %9 %24 
                                          f32 %35 = OpLoad %34 
                                          f32 %37 = OpFMul %35 %36 
                                 Private f32* %38 = OpAccessChain %9 %24 
                                                      OpStore %38 %37 
                                 Uniform f32* %40 = OpAccessChain %16 %29 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFAdd %42 %43 
                                                      OpStore %39 %44 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpLoad %39 
                                          f32 %52 = OpFMul %50 %51 
                                 Private f32* %53 = OpAccessChain %9 %24 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpFAdd %52 %54 
                                 Private f32* %56 = OpAccessChain %9 %24 
                                                      OpStore %56 %55 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %63 = OpAccessChain %16 %60 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %59 %64 
                                                      OpStore %57 %65 
                                 Private f32* %68 = OpAccessChain %9 %24 
                                          f32 %69 = OpLoad %68 
                                  Output f32* %71 = OpAccessChain %67 %47 
                                                      OpStore %71 %69 
                               Uniform f32_4* %72 = OpAccessChain %16 %60 %60 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %46 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %57 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %9 %78 
                               Uniform f32_4* %79 = OpAccessChain %16 %60 %29 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %46 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %9 %85 
                                        f32_4 %86 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %16 %60 %18 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %86 %88 
                                                      OpStore %9 %89 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
                               Uniform f32_4* %92 = OpAccessChain %16 %61 %61 
                                        f32_4 %93 = OpLoad %92 
                                        f32_4 %94 = OpFMul %91 %93 
                                                      OpStore %57 %94 
                               Uniform f32_4* %95 = OpAccessChain %16 %61 %60 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpVectorShuffle %97 %97 0 0 0 0 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %57 
                                       f32_4 %101 = OpFAdd %99 %100 
                                                      OpStore %57 %101 
                              Uniform f32_4* %102 = OpAccessChain %16 %61 %29 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpLoad %9 
                                       f32_4 %105 = OpVectorShuffle %104 %104 2 2 2 2 
                                       f32_4 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %57 
                                       f32_4 %108 = OpFAdd %106 %107 
                                                      OpStore %57 %108 
                              Uniform f32_4* %113 = OpAccessChain %16 %61 %18 
                                       f32_4 %114 = OpLoad %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %115 3 3 3 3 
                                       f32_4 %117 = OpFMul %114 %116 
                                       f32_4 %118 = OpLoad %57 
                                       f32_4 %119 = OpFAdd %117 %118 
                               Output f32_4* %120 = OpAccessChain %112 %60 
                                                      OpStore %120 %119 
                                       f32_4 %123 = OpLoad %122 
                                                      OpStore %121 %123 
                                       f32_2 %129 = OpLoad %128 
                                                      OpStore %126 %129 
                                       f32_4 %131 = OpLoad %46 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 2 3 
                                       f32_4 %133 = OpLoad %67 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 1 5 6 
                                                      OpStore %67 %134 
                                 Output f32* %135 = OpAccessChain %112 %60 %47 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFNegate %136 
                                 Output f32* %138 = OpAccessChain %112 %60 %47 
                                                      OpStore %138 %137 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 753
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %29 %125 %183 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %29 Location 29 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpMemberDecorate %61 0 Offset 61 
                                                      OpMemberDecorate %61 1 RelaxedPrecision 
                                                      OpMemberDecorate %61 1 Offset 61 
                                                      OpMemberDecorate %61 2 RelaxedPrecision 
                                                      OpMemberDecorate %61 2 Offset 61 
                                                      OpMemberDecorate %61 3 Offset 61 
                                                      OpDecorate %61 Block 
                                                      OpDecorate %63 DescriptorSet 63 
                                                      OpDecorate %63 Binding 63 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %134 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %460 RelaxedPrecision 
                                                      OpDecorate %463 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %474 RelaxedPrecision 
                                                      OpDecorate %475 RelaxedPrecision 
                                                      OpDecorate %476 RelaxedPrecision 
                                                      OpDecorate %477 RelaxedPrecision 
                                                      OpDecorate %478 RelaxedPrecision 
                                                      OpDecorate %479 RelaxedPrecision 
                                                      OpDecorate %480 RelaxedPrecision 
                                                      OpDecorate %483 RelaxedPrecision 
                                                      OpDecorate %485 RelaxedPrecision 
                                                      OpDecorate %486 RelaxedPrecision 
                                                      OpDecorate %496 RelaxedPrecision 
                                                      OpDecorate %497 RelaxedPrecision 
                                                      OpDecorate %508 RelaxedPrecision 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %565 RelaxedPrecision 
                                                      OpDecorate %566 RelaxedPrecision 
                                                      OpDecorate %567 RelaxedPrecision 
                                                      OpDecorate %569 RelaxedPrecision 
                                                      OpDecorate %570 RelaxedPrecision 
                                                      OpDecorate %571 RelaxedPrecision 
                                                      OpDecorate %573 RelaxedPrecision 
                                                      OpDecorate %574 RelaxedPrecision 
                                                      OpDecorate %575 RelaxedPrecision 
                                                      OpDecorate %576 RelaxedPrecision 
                                                      OpDecorate %577 RelaxedPrecision 
                                                      OpDecorate %578 RelaxedPrecision 
                                                      OpDecorate %580 RelaxedPrecision 
                                                      OpDecorate %581 RelaxedPrecision 
                                                      OpDecorate %583 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %585 RelaxedPrecision 
                                                      OpDecorate %586 RelaxedPrecision 
                                                      OpDecorate %587 RelaxedPrecision 
                                                      OpDecorate %588 RelaxedPrecision 
                                                      OpDecorate %589 RelaxedPrecision 
                                                      OpDecorate %592 RelaxedPrecision 
                                                      OpDecorate %594 RelaxedPrecision 
                                                      OpDecorate %605 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %636 RelaxedPrecision 
                                                      OpDecorate %640 RelaxedPrecision 
                                                      OpDecorate %667 RelaxedPrecision 
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
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Private %6 
                                              %28 = OpTypePointer Input %7 
                                 Input f32_4* %29 = OpVariable Input 
                                              %30 = OpTypePointer Input %6 
                                          f32 %34 = OpConstant 3.67402E-40 
                                          u32 %36 = OpConstant 0 
                               Private f32_4* %38 = OpVariable Private 
                                              %42 = OpTypeBool 
                                              %43 = OpTypePointer Private %42 
                                Private bool* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.67402E-40 
                                              %50 = OpTypeInt 32 1 
                                          i32 %51 = OpConstant 0 
                                          i32 %52 = OpConstant 1 
                                          i32 %54 = OpConstant -1 
                               Private f32_4* %60 = OpVariable Private 
                                              %61 = OpTypeStruct %7 %7 %7 %7 
                                              %62 = OpTypePointer Uniform %61 
Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %63 = OpVariable Uniform 
                                          u32 %64 = OpConstant 2 
                                              %65 = OpTypePointer Uniform %6 
                                          f32 %72 = OpConstant 3.67402E-40 
                                          f32 %74 = OpConstant 3.67402E-40 
                                          i32 %79 = OpConstant 2 
                                              %80 = OpTypePointer Uniform %7 
                                          f32 %89 = OpConstant 3.67402E-40 
                                          f32 %90 = OpConstant 3.67402E-40 
                                          f32 %91 = OpConstant 3.67402E-40 
                                        f32_3 %92 = OpConstantComposite %89 %90 %91 
                                          f32 %97 = OpConstant 3.67402E-40 
                                          f32 %99 = OpConstant 3.67402E-40 
                                             %124 = OpTypePointer Output %7 
                               Output f32_4* %125 = OpVariable Output 
                                             %128 = OpTypePointer Output %6 
                                Private f32* %134 = OpVariable Private 
                                         f32 %137 = OpConstant 3.67402E-40 
                                Private f32* %139 = OpVariable Private 
                                         f32 %163 = OpConstant 3.67402E-40 
                              Private f32_4* %168 = OpVariable Private 
                                       f32_3 %178 = OpConstantComposite %163 %163 %163 
                                Private f32* %182 = OpVariable Private 
                                Input f32_4* %183 = OpVariable Input 
                                         u32 %184 = OpConstant 1 
                                         f32 %187 = OpConstant 3.67402E-40 
                                             %198 = OpTypeVector %42 3 
                                             %199 = OpTypePointer Private %198 
                             Private bool_3* %200 = OpVariable Private 
                                         f32 %201 = OpConstant 3.67402E-40 
                                       f32_4 %202 = OpConstantComposite %201 %201 %201 %47 
                                         i32 %203 = OpConstant 3 
                                             %207 = OpTypeVector %42 4 
                                             %210 = OpTypePointer Function %20 
                                Private f32* %222 = OpVariable Private 
                                         f32 %226 = OpConstant 3.67402E-40 
                              Private f32_4* %241 = OpVariable Private 
                                             %246 = OpTypePointer Private %15 
                              Private f32_2* %247 = OpVariable Private 
                               Private bool* %254 = OpVariable Private 
                              Private f32_2* %260 = OpVariable Private 
                                             %261 = OpTypePointer Function %6 
                                         f32 %266 = OpConstant 3.67402E-40 
                                         f32 %280 = OpConstant 3.67402E-40 
                                         f32 %287 = OpConstant 3.67402E-40 
                                       f32_2 %288 = OpConstantComposite %280 %287 
                               Private bool* %310 = OpVariable Private 
                                Private f32* %316 = OpVariable Private 
                              Private f32_3* %345 = OpVariable Private 
                                         f32 %359 = OpConstant 3.67402E-40 
                                         f32 %361 = OpConstant 3.67402E-40 
                                         f32 %379 = OpConstant 3.67402E-40 
                                       f32_3 %380 = OpConstantComposite %266 %287 %379 
                                       f32_3 %391 = OpConstantComposite %359 %359 %359 
                                         f32 %393 = OpConstant 3.67402E-40 
                                       f32_3 %394 = OpConstantComposite %393 %393 %393 
                                       f32_3 %401 = OpConstantComposite %280 %280 %280 
                                       f32_3 %435 = OpConstantComposite %266 %266 %266 
                                         f32 %445 = OpConstant 3.67402E-40 
                                       f32_3 %446 = OpConstantComposite %445 %445 %445 
                                       f32_3 %448 = OpConstantComposite %47 %47 %137 
                              Private f32_2* %474 = OpVariable Private 
                              Private f32_4* %499 = OpVariable Private 
                              Private f32_3* %565 = OpVariable Private 
                              Private f32_2* %583 = OpVariable Private 
                               Private bool* %590 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %211 = OpVariable Function 
                             Function f32_3* %231 = OpVariable Function 
                               Function f32* %262 = OpVariable Function 
                               Function f32* %317 = OpVariable Function 
                             Function f32_3* %452 = OpVariable Function 
                               Function f32* %467 = OpVariable Function 
                               Function f32* %518 = OpVariable Function 
                               Function f32* %596 = OpVariable Function 
                               Function f32* %644 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                          f32 %27 = OpLoad %26 
                                   Input f32* %31 = OpAccessChain %29 %24 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %27 %32 
                                          f32 %35 = OpFAdd %33 %34 
                                 Private f32* %37 = OpAccessChain %22 %36 
                                                      OpStore %37 %35 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpLoad %29 
                                        f32_4 %41 = OpFMul %39 %40 
                                                      OpStore %38 %41 
                                 Private f32* %45 = OpAccessChain %22 %36 
                                          f32 %46 = OpLoad %45 
                                         bool %48 = OpFOrdLessThan %46 %47 
                                                      OpStore %44 %48 
                                         bool %49 = OpLoad %44 
                                          i32 %53 = OpSelect %49 %52 %51 
                                          i32 %55 = OpIMul %53 %54 
                                         bool %56 = OpINotEqual %55 %51 
                                                      OpSelectionMerge %58 None 
                                                      OpBranchConditional %56 %57 %58 
                                              %57 = OpLabel 
                                                      OpKill
                                              %58 = OpLabel 
                                 Uniform f32* %66 = OpAccessChain %63 %51 %64 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpExtInst %1 13 %67 
                                 Private f32* %69 = OpAccessChain %60 %36 
                                                      OpStore %69 %68 
                                 Private f32* %70 = OpAccessChain %60 %36 
                                          f32 %71 = OpLoad %70 
                                          f32 %73 = OpFMul %71 %72 
                                          f32 %75 = OpFAdd %73 %74 
                                 Private f32* %76 = OpAccessChain %60 %36 
                                                      OpStore %76 %75 
                                        f32_4 %77 = OpLoad %60 
                                        f32_3 %78 = OpVectorShuffle %77 %77 0 0 0 
                               Uniform f32_4* %81 = OpAccessChain %63 %79 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                        f32_3 %84 = OpFMul %78 %83 
                                        f32_4 %85 = OpLoad %60 
                                        f32_4 %86 = OpVectorShuffle %85 %84 4 5 6 3 
                                                      OpStore %60 %86 
                                        f32_4 %87 = OpLoad %38 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                          f32 %93 = OpDot %88 %92 
                                 Private f32* %94 = OpAccessChain %22 %36 
                                                      OpStore %94 %93 
                                 Private f32* %95 = OpAccessChain %22 %36 
                                          f32 %96 = OpLoad %95 
                                          f32 %98 = OpFMul %96 %97 
                                         f32 %100 = OpFAdd %98 %99 
                                Private f32* %101 = OpAccessChain %22 %36 
                                                      OpStore %101 %100 
                                       f32_4 %102 = OpLoad %60 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                       f32_3 %104 = OpLoad %22 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 0 0 
                                       f32_3 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %38 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFNegate %108 
                                       f32_3 %110 = OpFAdd %106 %109 
                                       f32_4 %111 = OpLoad %60 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
                                                      OpStore %60 %112 
                              Uniform f32_4* %113 = OpAccessChain %63 %79 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 3 3 3 
                                       f32_4 %116 = OpLoad %60 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %38 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpFAdd %118 %120 
                                       f32_4 %122 = OpLoad %60 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %60 %123 
                                Private f32* %126 = OpAccessChain %38 %24 
                                         f32 %127 = OpLoad %126 
                                 Output f32* %129 = OpAccessChain %125 %24 
                                                      OpStore %129 %127 
                                       f32_4 %130 = OpLoad %60 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                         f32 %132 = OpDot %131 %92 
                                Private f32* %133 = OpAccessChain %22 %36 
                                                      OpStore %133 %132 
                                Private f32* %135 = OpAccessChain %22 %36 
                                         f32 %136 = OpLoad %135 
                                         f32 %138 = OpExtInst %1 40 %136 %137 
                                                      OpStore %134 %138 
                                Private f32* %140 = OpAccessChain %22 %36 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpLoad %134 
                                         f32 %143 = OpFNegate %142 
                                         f32 %144 = OpFAdd %141 %143 
                                                      OpStore %139 %144 
                              Uniform f32_4* %145 = OpAccessChain %63 %79 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                         f32 %148 = OpDot %147 %92 
                                Private f32* %149 = OpAccessChain %22 %36 
                                                      OpStore %149 %148 
                                Private f32* %150 = OpAccessChain %22 %36 
                                         f32 %151 = OpLoad %150 
                                Private f32* %152 = OpAccessChain %22 %36 
                                         f32 %153 = OpLoad %152 
                                         f32 %154 = OpFAdd %151 %153 
                                Private f32* %155 = OpAccessChain %22 %36 
                                                      OpStore %155 %154 
                                Private f32* %156 = OpAccessChain %22 %36 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpLoad %139 
                                         f32 %159 = OpFMul %157 %158 
                                         f32 %160 = OpLoad %134 
                                         f32 %161 = OpFAdd %159 %160 
                                                      OpStore %134 %161 
                                         f32 %162 = OpLoad %134 
                                         f32 %164 = OpFMul %162 %163 
                                                      OpStore %134 %164 
                                         f32 %165 = OpLoad %134 
                                         f32 %166 = OpLoad %134 
                                         f32 %167 = OpFMul %165 %166 
                                                      OpStore %134 %167 
                                         f32 %169 = OpLoad %134 
                                       f32_3 %170 = OpCompositeConstruct %169 %169 %169 
                                       f32_4 %171 = OpLoad %60 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFMul %170 %172 
                                       f32_4 %174 = OpLoad %168 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 6 3 
                                                      OpStore %168 %175 
                                       f32_4 %176 = OpLoad %168 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %179 = OpFMul %177 %178 
                                       f32_4 %180 = OpLoad %168 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %168 %181 
                                  Input f32* %185 = OpAccessChain %183 %184 
                                         f32 %186 = OpLoad %185 
                                         f32 %188 = OpExtInst %1 37 %186 %187 
                                                      OpStore %182 %188 
                                         f32 %189 = OpLoad %182 
                                         f32 %190 = OpExtInst %1 40 %189 %47 
                                                      OpStore %182 %190 
                                         f32 %191 = OpLoad %182 
                                       f32_3 %192 = OpCompositeConstruct %191 %191 %191 
                                       f32_4 %193 = OpLoad %168 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                                       f32_3 %195 = OpFMul %192 %194 
                                       f32_4 %196 = OpLoad %168 
                                       f32_4 %197 = OpVectorShuffle %196 %195 4 5 6 3 
                                                      OpStore %168 %197 
                              Uniform f32_4* %204 = OpAccessChain %63 %203 
                                       f32_4 %205 = OpLoad %204 
                                       f32_4 %206 = OpVectorShuffle %205 %205 0 1 2 0 
                                      bool_4 %208 = OpFOrdLessThan %202 %206 
                                      bool_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                                      OpStore %200 %209 
                                      bool_3 %212 = OpLoad %200 
                                        bool %213 = OpCompositeExtract %212 0 
                                                      OpSelectionMerge %215 None 
                                                      OpBranchConditional %213 %214 %218 
                                             %214 = OpLabel 
                                       f32_4 %216 = OpLoad %168 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
                                                      OpStore %211 %217 
                                                      OpBranch %215 
                                             %218 = OpLabel 
                                       f32_4 %219 = OpLoad %60 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                                                      OpStore %211 %220 
                                                      OpBranch %215 
                                             %215 = OpLabel 
                                       f32_3 %221 = OpLoad %211 
                                                      OpStore %22 %221 
                                       f32_3 %223 = OpLoad %22 
                                         f32 %224 = OpDot %223 %92 
                                                      OpStore %222 %224 
                                         f32 %225 = OpLoad %222 
                                         f32 %227 = OpFMul %225 %226 
                                                      OpStore %222 %227 
                                         f32 %228 = OpLoad %222 
                                         f32 %229 = OpLoad %222 
                                         f32 %230 = OpFMul %228 %229 
                                                      OpStore %222 %230 
                                      bool_3 %232 = OpLoad %200 
                                        bool %233 = OpCompositeExtract %232 1 
                                                      OpSelectionMerge %235 None 
                                                      OpBranchConditional %233 %234 %238 
                                             %234 = OpLabel 
                                         f32 %236 = OpLoad %222 
                                       f32_3 %237 = OpCompositeConstruct %236 %236 %236 
                                                      OpStore %231 %237 
                                                      OpBranch %235 
                                             %238 = OpLabel 
                                       f32_3 %239 = OpLoad %22 
                                                      OpStore %231 %239 
                                                      OpBranch %235 
                                             %235 = OpLabel 
                                       f32_3 %240 = OpLoad %231 
                                                      OpStore %22 %240 
                                Private f32* %242 = OpAccessChain %22 %36 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFNegate %243 
                                Private f32* %245 = OpAccessChain %241 %24 
                                                      OpStore %245 %244 
                                       f32_3 %248 = OpLoad %22 
                                       f32_2 %249 = OpVectorShuffle %248 %248 2 1 
                                       f32_2 %250 = OpFNegate %249 
                                       f32_3 %251 = OpLoad %22 
                                       f32_2 %252 = OpVectorShuffle %251 %251 1 2 
                                       f32_2 %253 = OpFAdd %250 %252 
                                                      OpStore %247 %253 
                                Private f32* %255 = OpAccessChain %22 %184 
                                         f32 %256 = OpLoad %255 
                                Private f32* %257 = OpAccessChain %22 %64 
                                         f32 %258 = OpLoad %257 
                                        bool %259 = OpFOrdGreaterThanEqual %256 %258 
                                                      OpStore %254 %259 
                                        bool %263 = OpLoad %254 
                                                      OpSelectionMerge %265 None 
                                                      OpBranchConditional %263 %264 %267 
                                             %264 = OpLabel 
                                                      OpStore %262 %266 
                                                      OpBranch %265 
                                             %267 = OpLabel 
                                                      OpStore %262 %47 
                                                      OpBranch %265 
                                             %265 = OpLabel 
                                         f32 %268 = OpLoad %262 
                                Private f32* %269 = OpAccessChain %260 %36 
                                                      OpStore %269 %268 
                                       f32_2 %270 = OpLoad %260 
                                       f32_2 %271 = OpVectorShuffle %270 %270 0 0 
                                       f32_2 %272 = OpLoad %247 
                                       f32_2 %273 = OpFMul %271 %272 
                                       f32_3 %274 = OpLoad %22 
                                       f32_2 %275 = OpVectorShuffle %274 %274 2 1 
                                       f32_2 %276 = OpFAdd %273 %275 
                                       f32_4 %277 = OpLoad %168 
                                       f32_4 %278 = OpVectorShuffle %277 %276 4 5 2 3 
                                                      OpStore %168 %278 
                                Private f32* %279 = OpAccessChain %60 %36 
                                                      OpStore %279 %266 
                                Private f32* %281 = OpAccessChain %60 %184 
                                                      OpStore %281 %280 
                                       f32_2 %282 = OpLoad %260 
                                       f32_2 %283 = OpVectorShuffle %282 %282 0 0 
                                       f32_4 %284 = OpLoad %60 
                                       f32_2 %285 = OpVectorShuffle %284 %284 0 1 
                                       f32_2 %286 = OpFMul %283 %285 
                                       f32_2 %289 = OpFAdd %286 %288 
                                       f32_4 %290 = OpLoad %168 
                                       f32_4 %291 = OpVectorShuffle %290 %289 0 1 4 5 
                                                      OpStore %168 %291 
                                       f32_4 %292 = OpLoad %168 
                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 3 
                                       f32_3 %294 = OpFNegate %293 
                                       f32_4 %295 = OpLoad %241 
                                       f32_4 %296 = OpVectorShuffle %295 %294 4 5 6 3 
                                                      OpStore %241 %296 
                                       f32_4 %297 = OpLoad %241 
                                       f32_3 %298 = OpVectorShuffle %297 %297 1 2 3 
                                       f32_4 %299 = OpLoad %168 
                                       f32_3 %300 = OpVectorShuffle %299 %299 1 2 0 
                                       f32_3 %301 = OpFAdd %298 %300 
                                       f32_4 %302 = OpLoad %60 
                                       f32_4 %303 = OpVectorShuffle %302 %301 0 4 5 6 
                                                      OpStore %60 %303 
                                Private f32* %304 = OpAccessChain %241 %36 
                                         f32 %305 = OpLoad %304 
                                Private f32* %306 = OpAccessChain %22 %36 
                                         f32 %307 = OpLoad %306 
                                         f32 %308 = OpFAdd %305 %307 
                                Private f32* %309 = OpAccessChain %60 %36 
                                                      OpStore %309 %308 
                                Private f32* %311 = OpAccessChain %22 %36 
                                         f32 %312 = OpLoad %311 
                                Private f32* %313 = OpAccessChain %168 %36 
                                         f32 %314 = OpLoad %313 
                                        bool %315 = OpFOrdGreaterThanEqual %312 %314 
                                                      OpStore %310 %315 
                                        bool %318 = OpLoad %310 
                                                      OpSelectionMerge %320 None 
                                                      OpBranchConditional %318 %319 %321 
                                             %319 = OpLabel 
                                                      OpStore %317 %266 
                                                      OpBranch %320 
                                             %321 = OpLabel 
                                                      OpStore %317 %47 
                                                      OpBranch %320 
                                             %320 = OpLabel 
                                         f32 %322 = OpLoad %317 
                                                      OpStore %316 %322 
                                         f32 %323 = OpLoad %316 
                                Private f32* %324 = OpAccessChain %60 %24 
                                         f32 %325 = OpLoad %324 
                                         f32 %326 = OpFMul %323 %325 
                                Private f32* %327 = OpAccessChain %22 %36 
                                         f32 %328 = OpLoad %327 
                                         f32 %329 = OpFAdd %326 %328 
                                                      OpStore %182 %329 
                                         f32 %330 = OpLoad %316 
                                       f32_3 %331 = OpCompositeConstruct %330 %330 %330 
                                       f32_4 %332 = OpLoad %60 
                                       f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
                                       f32_3 %334 = OpFMul %331 %333 
                                       f32_4 %335 = OpLoad %168 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 3 
                                       f32_3 %337 = OpFAdd %334 %336 
                                       f32_4 %338 = OpLoad %60 
                                       f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                                      OpStore %60 %339 
                                Private f32* %340 = OpAccessChain %60 %184 
                                         f32 %341 = OpLoad %340 
                                         f32 %342 = OpLoad %182 
                                         f32 %343 = OpExtInst %1 37 %341 %342 
                                Private f32* %344 = OpAccessChain %168 %36 
                                                      OpStore %344 %343 
                                Private f32* %346 = OpAccessChain %60 %184 
                                         f32 %347 = OpLoad %346 
                                         f32 %348 = OpFNegate %347 
                                         f32 %349 = OpLoad %182 
                                         f32 %350 = OpFAdd %348 %349 
                                Private f32* %351 = OpAccessChain %345 %36 
                                                      OpStore %351 %350 
                                Private f32* %352 = OpAccessChain %60 %36 
                                         f32 %353 = OpLoad %352 
                                Private f32* %354 = OpAccessChain %168 %36 
                                         f32 %355 = OpLoad %354 
                                         f32 %356 = OpFNegate %355 
                                         f32 %357 = OpFAdd %353 %356 
                                                      OpStore %182 %357 
                                         f32 %358 = OpLoad %182 
                                         f32 %360 = OpFMul %358 %359 
                                         f32 %362 = OpFAdd %360 %361 
                                Private f32* %363 = OpAccessChain %168 %36 
                                                      OpStore %363 %362 
                                Private f32* %364 = OpAccessChain %345 %36 
                                         f32 %365 = OpLoad %364 
                                Private f32* %366 = OpAccessChain %168 %36 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFDiv %365 %367 
                                Private f32* %369 = OpAccessChain %345 %36 
                                                      OpStore %369 %368 
                                Private f32* %370 = OpAccessChain %345 %36 
                                         f32 %371 = OpLoad %370 
                                Private f32* %372 = OpAccessChain %60 %64 
                                         f32 %373 = OpLoad %372 
                                         f32 %374 = OpFAdd %371 %373 
                                Private f32* %375 = OpAccessChain %345 %36 
                                                      OpStore %375 %374 
                                       f32_3 %376 = OpLoad %345 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 0 0 
                                       f32_3 %378 = OpExtInst %1 4 %377 
                                       f32_3 %381 = OpFAdd %378 %380 
                                       f32_4 %382 = OpLoad %168 
                                       f32_4 %383 = OpVectorShuffle %382 %381 4 5 6 3 
                                                      OpStore %168 %383 
                                       f32_4 %384 = OpLoad %168 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
                                       f32_3 %386 = OpExtInst %1 10 %385 
                                       f32_4 %387 = OpLoad %168 
                                       f32_4 %388 = OpVectorShuffle %387 %386 4 5 6 3 
                                                      OpStore %168 %388 
                                       f32_4 %389 = OpLoad %168 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                       f32_3 %392 = OpFMul %390 %391 
                                       f32_3 %395 = OpFAdd %392 %394 
                                       f32_4 %396 = OpLoad %168 
                                       f32_4 %397 = OpVectorShuffle %396 %395 4 5 6 3 
                                                      OpStore %168 %397 
                                       f32_4 %398 = OpLoad %168 
                                       f32_3 %399 = OpVectorShuffle %398 %398 0 1 2 
                                       f32_3 %400 = OpExtInst %1 4 %399 
                                       f32_3 %402 = OpFAdd %400 %401 
                                       f32_4 %403 = OpLoad %168 
                                       f32_4 %404 = OpVectorShuffle %403 %402 4 5 6 3 
                                                      OpStore %168 %404 
                                       f32_4 %405 = OpLoad %168 
                                       f32_3 %406 = OpVectorShuffle %405 %405 0 1 2 
                                       f32_3 %407 = OpCompositeConstruct %47 %47 %47 
                                       f32_3 %408 = OpCompositeConstruct %266 %266 %266 
                                       f32_3 %409 = OpExtInst %1 43 %406 %407 %408 
                                       f32_4 %410 = OpLoad %168 
                                       f32_4 %411 = OpVectorShuffle %410 %409 4 5 6 3 
                                                      OpStore %168 %411 
                                       f32_4 %412 = OpLoad %168 
                                       f32_3 %413 = OpVectorShuffle %412 %412 0 1 2 
                                       f32_3 %414 = OpFAdd %413 %401 
                                       f32_4 %415 = OpLoad %168 
                                       f32_4 %416 = OpVectorShuffle %415 %414 4 5 6 3 
                                                      OpStore %168 %416 
                                Private f32* %417 = OpAccessChain %60 %36 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpFAdd %418 %361 
                                Private f32* %420 = OpAccessChain %345 %36 
                                                      OpStore %420 %419 
                                         f32 %421 = OpLoad %182 
                                Private f32* %422 = OpAccessChain %345 %36 
                                         f32 %423 = OpLoad %422 
                                         f32 %424 = OpFDiv %421 %423 
                                Private f32* %425 = OpAccessChain %345 %36 
                                                      OpStore %425 %424 
                                Private f32* %426 = OpAccessChain %345 %36 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFMul %427 %201 
                                Private f32* %429 = OpAccessChain %345 %36 
                                                      OpStore %429 %428 
                                       f32_3 %430 = OpLoad %345 
                                       f32_3 %431 = OpVectorShuffle %430 %430 0 0 0 
                                       f32_4 %432 = OpLoad %168 
                                       f32_3 %433 = OpVectorShuffle %432 %432 0 1 2 
                                       f32_3 %434 = OpFMul %431 %433 
                                       f32_3 %436 = OpFAdd %434 %435 
                                                      OpStore %345 %436 
                                       f32_3 %437 = OpLoad %345 
                                       f32_4 %438 = OpLoad %60 
                                       f32_3 %439 = OpVectorShuffle %438 %438 0 0 0 
                                       f32_3 %440 = OpFMul %437 %439 
                                       f32_4 %441 = OpLoad %60 
                                       f32_4 %442 = OpVectorShuffle %441 %440 4 5 6 3 
                                                      OpStore %60 %442 
                                       f32_4 %443 = OpLoad %60 
                                       f32_3 %444 = OpVectorShuffle %443 %443 0 1 2 
                                       f32_3 %447 = OpFMul %444 %446 
                                       f32_3 %449 = OpFAdd %447 %448 
                                       f32_4 %450 = OpLoad %60 
                                       f32_4 %451 = OpVectorShuffle %450 %449 4 5 6 3 
                                                      OpStore %60 %451 
                                      bool_3 %453 = OpLoad %200 
                                        bool %454 = OpCompositeExtract %453 2 
                                                      OpSelectionMerge %456 None 
                                                      OpBranchConditional %454 %455 %459 
                                             %455 = OpLabel 
                                       f32_4 %457 = OpLoad %60 
                                       f32_3 %458 = OpVectorShuffle %457 %457 0 1 2 
                                                      OpStore %452 %458 
                                                      OpBranch %456 
                                             %459 = OpLabel 
                                       f32_3 %460 = OpLoad %22 
                                                      OpStore %452 %460 
                                                      OpBranch %456 
                                             %456 = OpLabel 
                                       f32_3 %461 = OpLoad %452 
                                                      OpStore %22 %461 
                                Private f32* %462 = OpAccessChain %22 %184 
                                         f32 %463 = OpLoad %462 
                                Private f32* %464 = OpAccessChain %22 %64 
                                         f32 %465 = OpLoad %464 
                                        bool %466 = OpFOrdGreaterThanEqual %463 %465 
                                                      OpStore %44 %466 
                                        bool %468 = OpLoad %44 
                                                      OpSelectionMerge %470 None 
                                                      OpBranchConditional %468 %469 %471 
                                             %469 = OpLabel 
                                                      OpStore %467 %266 
                                                      OpBranch %470 
                                             %471 = OpLabel 
                                                      OpStore %467 %47 
                                                      OpBranch %470 
                                             %470 = OpLabel 
                                         f32 %472 = OpLoad %467 
                                Private f32* %473 = OpAccessChain %60 %36 
                                                      OpStore %473 %472 
                                       f32_3 %475 = OpLoad %22 
                                       f32_2 %476 = OpVectorShuffle %475 %475 2 1 
                                       f32_2 %477 = OpFNegate %476 
                                       f32_3 %478 = OpLoad %22 
                                       f32_2 %479 = OpVectorShuffle %478 %478 1 2 
                                       f32_2 %480 = OpFAdd %477 %479 
                                                      OpStore %474 %480 
                                       f32_4 %481 = OpLoad %60 
                                       f32_2 %482 = OpVectorShuffle %481 %481 0 0 
                                       f32_2 %483 = OpLoad %474 
                                       f32_2 %484 = OpFMul %482 %483 
                                       f32_3 %485 = OpLoad %22 
                                       f32_2 %486 = OpVectorShuffle %485 %485 2 1 
                                       f32_2 %487 = OpFAdd %484 %486 
                                       f32_4 %488 = OpLoad %60 
                                       f32_4 %489 = OpVectorShuffle %488 %487 4 5 2 3 
                                                      OpStore %60 %489 
                                       f32_4 %490 = OpLoad %60 
                                       f32_2 %491 = OpVectorShuffle %490 %490 0 1 
                                       f32_2 %492 = OpFNegate %491 
                                       f32_4 %493 = OpLoad %168 
                                       f32_4 %494 = OpVectorShuffle %493 %492 4 5 2 3 
                                                      OpStore %168 %494 
                                Private f32* %495 = OpAccessChain %22 %36 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpFNegate %496 
                                Private f32* %498 = OpAccessChain %168 %64 
                                                      OpStore %498 %497 
                                       f32_4 %500 = OpLoad %60 
                                       f32_2 %501 = OpVectorShuffle %500 %500 1 0 
                                       f32_4 %502 = OpLoad %168 
                                       f32_2 %503 = OpVectorShuffle %502 %502 1 2 
                                       f32_2 %504 = OpFAdd %501 %503 
                                       f32_4 %505 = OpLoad %499 
                                       f32_4 %506 = OpVectorShuffle %505 %504 0 4 5 3 
                                                      OpStore %499 %506 
                                Private f32* %507 = OpAccessChain %22 %36 
                                         f32 %508 = OpLoad %507 
                                Private f32* %509 = OpAccessChain %168 %36 
                                         f32 %510 = OpLoad %509 
                                         f32 %511 = OpFAdd %508 %510 
                                Private f32* %512 = OpAccessChain %499 %36 
                                                      OpStore %512 %511 
                                Private f32* %513 = OpAccessChain %22 %36 
                                         f32 %514 = OpLoad %513 
                                Private f32* %515 = OpAccessChain %60 %36 
                                         f32 %516 = OpLoad %515 
                                        bool %517 = OpFOrdGreaterThanEqual %514 %516 
                                                      OpStore %254 %517 
                                        bool %519 = OpLoad %254 
                                                      OpSelectionMerge %521 None 
                                                      OpBranchConditional %519 %520 %522 
                                             %520 = OpLabel 
                                                      OpStore %518 %266 
                                                      OpBranch %521 
                                             %522 = OpLabel 
                                                      OpStore %518 %47 
                                                      OpBranch %521 
                                             %521 = OpLabel 
                                         f32 %523 = OpLoad %518 
                                Private f32* %524 = OpAccessChain %260 %36 
                                                      OpStore %524 %523 
                                Private f32* %525 = OpAccessChain %260 %36 
                                         f32 %526 = OpLoad %525 
                                Private f32* %527 = OpAccessChain %499 %64 
                                         f32 %528 = OpLoad %527 
                                         f32 %529 = OpFMul %526 %528 
                                Private f32* %530 = OpAccessChain %22 %36 
                                         f32 %531 = OpLoad %530 
                                         f32 %532 = OpFAdd %529 %531 
                                                      OpStore %182 %532 
                                       f32_2 %533 = OpLoad %260 
                                       f32_2 %534 = OpVectorShuffle %533 %533 0 0 
                                       f32_4 %535 = OpLoad %499 
                                       f32_2 %536 = OpVectorShuffle %535 %535 0 1 
                                       f32_2 %537 = OpFMul %534 %536 
                                       f32_4 %538 = OpLoad %60 
                                       f32_2 %539 = OpVectorShuffle %538 %538 0 1 
                                       f32_2 %540 = OpFAdd %537 %539 
                                       f32_4 %541 = OpLoad %60 
                                       f32_4 %542 = OpVectorShuffle %541 %540 4 5 2 3 
                                                      OpStore %60 %542 
                                Private f32* %543 = OpAccessChain %60 %184 
                                         f32 %544 = OpLoad %543 
                                         f32 %545 = OpLoad %182 
                                         f32 %546 = OpExtInst %1 37 %544 %545 
                                Private f32* %547 = OpAccessChain %345 %36 
                                                      OpStore %547 %546 
                                Private f32* %548 = OpAccessChain %345 %36 
                                         f32 %549 = OpLoad %548 
                                         f32 %550 = OpFNegate %549 
                                Private f32* %551 = OpAccessChain %60 %36 
                                         f32 %552 = OpLoad %551 
                                         f32 %553 = OpFAdd %550 %552 
                                Private f32* %554 = OpAccessChain %345 %36 
                                                      OpStore %554 %553 
                                Private f32* %555 = OpAccessChain %60 %36 
                                         f32 %556 = OpLoad %555 
                                         f32 %557 = OpFAdd %556 %361 
                                Private f32* %558 = OpAccessChain %260 %36 
                                                      OpStore %558 %557 
                                Private f32* %559 = OpAccessChain %345 %36 
                                         f32 %560 = OpLoad %559 
                                Private f32* %561 = OpAccessChain %260 %36 
                                         f32 %562 = OpLoad %561 
                                         f32 %563 = OpFDiv %560 %562 
                                Private f32* %564 = OpAccessChain %345 %36 
                                                      OpStore %564 %563 
                                       f32_3 %566 = OpLoad %22 
                                       f32_3 %567 = OpFNegate %566 
                              Uniform f32_4* %568 = OpAccessChain %63 %52 
                                       f32_4 %569 = OpLoad %568 
                                       f32_3 %570 = OpVectorShuffle %569 %569 0 1 2 
                                       f32_3 %571 = OpFAdd %567 %570 
                                                      OpStore %565 %571 
                              Uniform f32_4* %572 = OpAccessChain %63 %52 
                                       f32_4 %573 = OpLoad %572 
                                       f32_3 %574 = OpVectorShuffle %573 %573 3 3 3 
                                       f32_3 %575 = OpLoad %565 
                                       f32_3 %576 = OpFMul %574 %575 
                                       f32_3 %577 = OpLoad %22 
                                       f32_3 %578 = OpFAdd %576 %577 
                                                      OpStore %22 %578 
                                Private f32* %579 = OpAccessChain %22 %36 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFNegate %580 
                                Private f32* %582 = OpAccessChain %241 %24 
                                                      OpStore %582 %581 
                                       f32_3 %584 = OpLoad %22 
                                       f32_2 %585 = OpVectorShuffle %584 %584 2 1 
                                       f32_2 %586 = OpFNegate %585 
                                       f32_3 %587 = OpLoad %22 
                                       f32_2 %588 = OpVectorShuffle %587 %587 1 2 
                                       f32_2 %589 = OpFAdd %586 %588 
                                                      OpStore %583 %589 
                                Private f32* %591 = OpAccessChain %22 %184 
                                         f32 %592 = OpLoad %591 
                                Private f32* %593 = OpAccessChain %22 %64 
                                         f32 %594 = OpLoad %593 
                                        bool %595 = OpFOrdGreaterThanEqual %592 %594 
                                                      OpStore %590 %595 
                                        bool %597 = OpLoad %590 
                                                      OpSelectionMerge %599 None 
                                                      OpBranchConditional %597 %598 %600 
                                             %598 = OpLabel 
                                                      OpStore %596 %266 
                                                      OpBranch %599 
                                             %600 = OpLabel 
                                                      OpStore %596 %47 
                                                      OpBranch %599 
                                             %599 = OpLabel 
                                         f32 %601 = OpLoad %596 
                                Private f32* %602 = OpAccessChain %168 %36 
                                                      OpStore %602 %601 
                                       f32_4 %603 = OpLoad %168 
                                       f32_2 %604 = OpVectorShuffle %603 %603 0 0 
                                       f32_2 %605 = OpLoad %583 
                                       f32_2 %606 = OpFMul %604 %605 
                                       f32_3 %607 = OpLoad %22 
                                       f32_2 %608 = OpVectorShuffle %607 %607 2 1 
                                       f32_2 %609 = OpFAdd %606 %608 
                                       f32_4 %610 = OpLoad %499 
                                       f32_4 %611 = OpVectorShuffle %610 %609 4 5 2 3 
                                                      OpStore %499 %611 
                                Private f32* %612 = OpAccessChain %260 %36 
                                                      OpStore %612 %266 
                                Private f32* %613 = OpAccessChain %260 %184 
                                                      OpStore %613 %280 
                                       f32_4 %614 = OpLoad %168 
                                       f32_2 %615 = OpVectorShuffle %614 %614 0 0 
                                       f32_2 %616 = OpLoad %260 
                                       f32_2 %617 = OpFMul %615 %616 
                                       f32_2 %618 = OpFAdd %617 %288 
                                       f32_4 %619 = OpLoad %499 
                                       f32_4 %620 = OpVectorShuffle %619 %618 0 1 4 5 
                                                      OpStore %499 %620 
                                       f32_4 %621 = OpLoad %499 
                                       f32_3 %622 = OpVectorShuffle %621 %621 0 1 3 
                                       f32_3 %623 = OpFNegate %622 
                                       f32_4 %624 = OpLoad %241 
                                       f32_4 %625 = OpVectorShuffle %624 %623 4 5 6 3 
                                                      OpStore %241 %625 
                                       f32_4 %626 = OpLoad %241 
                                       f32_3 %627 = OpVectorShuffle %626 %626 1 2 3 
                                       f32_4 %628 = OpLoad %499 
                                       f32_3 %629 = OpVectorShuffle %628 %628 1 2 0 
                                       f32_3 %630 = OpFAdd %627 %629 
                                       f32_4 %631 = OpLoad %168 
                                       f32_4 %632 = OpVectorShuffle %631 %630 0 4 5 6 
                                                      OpStore %168 %632 
                                Private f32* %633 = OpAccessChain %241 %36 
                                         f32 %634 = OpLoad %633 
                                Private f32* %635 = OpAccessChain %22 %36 
                                         f32 %636 = OpLoad %635 
                                         f32 %637 = OpFAdd %634 %636 
                                Private f32* %638 = OpAccessChain %168 %36 
                                                      OpStore %638 %637 
                                Private f32* %639 = OpAccessChain %22 %36 
                                         f32 %640 = OpLoad %639 
                                Private f32* %641 = OpAccessChain %499 %36 
                                         f32 %642 = OpLoad %641 
                                        bool %643 = OpFOrdGreaterThanEqual %640 %642 
                                                      OpStore %254 %643 
                                        bool %645 = OpLoad %254 
                                                      OpSelectionMerge %647 None 
                                                      OpBranchConditional %645 %646 %648 
                                             %646 = OpLabel 
                                                      OpStore %644 %266 
                                                      OpBranch %647 
                                             %648 = OpLabel 
                                                      OpStore %644 %47 
                                                      OpBranch %647 
                                             %647 = OpLabel 
                                         f32 %649 = OpLoad %644 
                                Private f32* %650 = OpAccessChain %260 %36 
                                                      OpStore %650 %649 
                                       f32_2 %651 = OpLoad %260 
                                       f32_3 %652 = OpVectorShuffle %651 %651 0 0 0 
                                       f32_4 %653 = OpLoad %168 
                                       f32_3 %654 = OpVectorShuffle %653 %653 0 1 2 
                                       f32_3 %655 = OpFMul %652 %654 
                                       f32_4 %656 = OpLoad %499 
                                       f32_3 %657 = OpVectorShuffle %656 %656 0 1 3 
                                       f32_3 %658 = OpFAdd %655 %657 
                                       f32_4 %659 = OpLoad %168 
                                       f32_4 %660 = OpVectorShuffle %659 %658 4 5 6 3 
                                                      OpStore %168 %660 
                                Private f32* %661 = OpAccessChain %260 %36 
                                         f32 %662 = OpLoad %661 
                                Private f32* %663 = OpAccessChain %168 %24 
                                         f32 %664 = OpLoad %663 
                                         f32 %665 = OpFMul %662 %664 
                                Private f32* %666 = OpAccessChain %22 %36 
                                         f32 %667 = OpLoad %666 
                                         f32 %668 = OpFAdd %665 %667 
                                Private f32* %669 = OpAccessChain %260 %36 
                                                      OpStore %669 %668 
                                Private f32* %670 = OpAccessChain %168 %184 
                                         f32 %671 = OpLoad %670 
                                Private f32* %672 = OpAccessChain %260 %36 
                                         f32 %673 = OpLoad %672 
                                         f32 %674 = OpExtInst %1 37 %671 %673 
                                                      OpStore %182 %674 
                                Private f32* %675 = OpAccessChain %168 %184 
                                         f32 %676 = OpLoad %675 
                                         f32 %677 = OpFNegate %676 
                                Private f32* %678 = OpAccessChain %260 %36 
                                         f32 %679 = OpLoad %678 
                                         f32 %680 = OpFAdd %677 %679 
                                Private f32* %681 = OpAccessChain %260 %36 
                                                      OpStore %681 %680 
                                         f32 %682 = OpLoad %182 
                                         f32 %683 = OpFNegate %682 
                                Private f32* %684 = OpAccessChain %168 %36 
                                         f32 %685 = OpLoad %684 
                                         f32 %686 = OpFAdd %683 %685 
                                                      OpStore %182 %686 
                                         f32 %687 = OpLoad %182 
                                         f32 %688 = OpFMul %687 %359 
                                         f32 %689 = OpFAdd %688 %361 
                                                      OpStore %182 %689 
                                Private f32* %690 = OpAccessChain %260 %36 
                                         f32 %691 = OpLoad %690 
                                         f32 %692 = OpLoad %182 
                                         f32 %693 = OpFDiv %691 %692 
                                Private f32* %694 = OpAccessChain %260 %36 
                                                      OpStore %694 %693 
                                Private f32* %695 = OpAccessChain %260 %36 
                                         f32 %696 = OpLoad %695 
                                Private f32* %697 = OpAccessChain %168 %64 
                                         f32 %698 = OpLoad %697 
                                         f32 %699 = OpFAdd %696 %698 
                                Private f32* %700 = OpAccessChain %260 %36 
                                                      OpStore %700 %699 
                                       f32_2 %701 = OpLoad %260 
                                       f32_3 %702 = OpVectorShuffle %701 %701 0 0 0 
                                       f32_3 %703 = OpExtInst %1 4 %702 
                                       f32_3 %704 = OpFAdd %703 %380 
                                       f32_4 %705 = OpLoad %168 
                                       f32_4 %706 = OpVectorShuffle %705 %704 4 5 6 3 
                                                      OpStore %168 %706 
                                       f32_4 %707 = OpLoad %168 
                                       f32_3 %708 = OpVectorShuffle %707 %707 0 1 2 
                                       f32_3 %709 = OpExtInst %1 10 %708 
                                       f32_4 %710 = OpLoad %168 
                                       f32_4 %711 = OpVectorShuffle %710 %709 4 5 6 3 
                                                      OpStore %168 %711 
                                       f32_4 %712 = OpLoad %168 
                                       f32_3 %713 = OpVectorShuffle %712 %712 0 1 2 
                                       f32_3 %714 = OpFMul %713 %391 
                                       f32_3 %715 = OpFAdd %714 %394 
                                       f32_4 %716 = OpLoad %168 
                                       f32_4 %717 = OpVectorShuffle %716 %715 4 5 6 3 
                                                      OpStore %168 %717 
                                       f32_4 %718 = OpLoad %168 
                                       f32_3 %719 = OpVectorShuffle %718 %718 0 1 2 
                                       f32_3 %720 = OpExtInst %1 4 %719 
                                       f32_3 %721 = OpFAdd %720 %401 
                                       f32_4 %722 = OpLoad %168 
                                       f32_4 %723 = OpVectorShuffle %722 %721 4 5 6 3 
                                                      OpStore %168 %723 
                                       f32_4 %724 = OpLoad %168 
                                       f32_3 %725 = OpVectorShuffle %724 %724 0 1 2 
                                       f32_3 %726 = OpCompositeConstruct %47 %47 %47 
                                       f32_3 %727 = OpCompositeConstruct %266 %266 %266 
                                       f32_3 %728 = OpExtInst %1 43 %725 %726 %727 
                                       f32_4 %729 = OpLoad %168 
                                       f32_4 %730 = OpVectorShuffle %729 %728 4 5 6 3 
                                                      OpStore %168 %730 
                                       f32_4 %731 = OpLoad %168 
                                       f32_3 %732 = OpVectorShuffle %731 %731 0 1 2 
                                       f32_3 %733 = OpFAdd %732 %401 
                                       f32_4 %734 = OpLoad %168 
                                       f32_4 %735 = OpVectorShuffle %734 %733 4 5 6 3 
                                                      OpStore %168 %735 
                                       f32_3 %736 = OpLoad %345 
                                       f32_3 %737 = OpVectorShuffle %736 %736 0 0 0 
                                       f32_4 %738 = OpLoad %168 
                                       f32_3 %739 = OpVectorShuffle %738 %738 0 1 2 
                                       f32_3 %740 = OpFMul %737 %739 
                                       f32_3 %741 = OpFAdd %740 %435 
                                                      OpStore %345 %741 
                                       f32_3 %742 = OpLoad %345 
                                       f32_4 %743 = OpLoad %60 
                                       f32_3 %744 = OpVectorShuffle %743 %743 0 0 0 
                                       f32_3 %745 = OpFMul %742 %744 
                                       f32_4 %746 = OpLoad %60 
                                       f32_4 %747 = OpVectorShuffle %746 %745 4 5 6 3 
                                                      OpStore %60 %747 
                                       f32_4 %748 = OpLoad %60 
                                       f32_3 %749 = OpVectorShuffle %748 %748 0 1 2 
                                       f32_4 %750 = OpLoad %125 
                                       f32_4 %751 = OpVectorShuffle %750 %749 4 5 6 3 
                                                      OpStore %125 %751 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat1 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    vs_TEXCOORD1.y = u_xlat0.x;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xzw = in_POSITION0.xzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _OverrideColor;
uniform 	vec4 _FlatColor;
uniform 	vec4 _SpecialFlags;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat5;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = sin(_Time.z);
    u_xlat1.x = u_xlat1.x * 0.25 + 1.75;
    u_xlat1.xyz = u_xlat1.xxx * _FlatColor.xyz;
    u_xlat13 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat13 = u_xlat13 * 0.669999957 + 0.330000013;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat13) + (-u_xlat0.xyz);
    u_xlat0.xyz = _FlatColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.x = max(u_xlat12, 0.300000012);
    u_xlat12 = u_xlat12 + (-u_xlat1.x);
    u_xlat5.x = dot(_FlatColor.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat12 = u_xlat5.x * u_xlat12 + u_xlat1.x;
    u_xlat12 = u_xlat12 * 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(3.0, 3.0, 3.0);
    u_xlat12 = min(vs_TEXCOORD1.y, 0.800000012);
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _SpecialFlags.xyzx).xyz;
    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat12 = u_xlat12 * 0.699999988;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat0.xyz = (u_xlatb2.y) ? vec3(u_xlat12) : u_xlat0.xyz;
    u_xlatb12 = u_xlat0.y>=u_xlat0.z;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = vec4(u_xlat12) * u_xlat3.xywz + u_xlat1.xywz;
    u_xlatb12 = u_xlat0.x>=u_xlat1.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat12) * u_xlat3 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat2 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat5.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat5.x = u_xlat5.x / u_xlat2;
    u_xlat5.x = u_xlat5.x + u_xlat1.z;
    u_xlat5.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2 = u_xlat1.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat2;
    u_xlat12 = u_xlat12 * 0.5;
    u_xlat5.xyz = vec3(u_xlat12) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat5.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.899999976, 0.899999976, 0.899999976) + vec3(0.0, 0.0, 0.300000012);
    u_xlat0.xyz = (u_xlatb2.z) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 140
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %46 %67 %112 %121 %122 %126 %128 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %67 Location 67 
                                                      OpMemberDecorate %110 0 BuiltIn 110 
                                                      OpMemberDecorate %110 1 BuiltIn 110 
                                                      OpMemberDecorate %110 2 BuiltIn 110 
                                                      OpDecorate %110 Block 
                                                      OpDecorate %121 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %122 Location 122 
                                                      OpDecorate %126 Location 126 
                                                      OpDecorate %128 Location 128 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeStruct %12 %13 %6 %6 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4[4]; f32_4[4]; f32; f32;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 3 
                                              %19 = OpTypePointer Uniform %6 
                                          f32 %22 = OpConstant 3.67402E-40 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                          i32 %29 = OpConstant 2 
                                          f32 %36 = OpConstant 3.67402E-40 
                                 Private f32* %39 = OpVariable Private 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %7 
                                 Input f32_4* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                               Private f32_4* %57 = OpVariable Private 
                                          i32 %60 = OpConstant 0 
                                          i32 %61 = OpConstant 1 
                                              %62 = OpTypePointer Uniform %7 
                                              %66 = OpTypePointer Output %7 
                                Output f32_4* %67 = OpVariable Output 
                                              %70 = OpTypePointer Output %6 
                                             %109 = OpTypeArray %6 %47 
                                             %110 = OpTypeStruct %7 %6 %109 
                                             %111 = OpTypePointer Output %110 
        Output struct {f32_4; f32; f32[1];}* %112 = OpVariable Output 
                               Output f32_4* %121 = OpVariable Output 
                                Input f32_4* %122 = OpVariable Input 
                                             %124 = OpTypeVector %6 2 
                                             %125 = OpTypePointer Output %124 
                               Output f32_2* %126 = OpVariable Output 
                                             %127 = OpTypePointer Input %124 
                                Input f32_2* %128 = OpVariable Input 
                                             %130 = OpTypeVector %6 3 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %20 = OpAccessChain %16 %18 
                                          f32 %21 = OpLoad %20 
                                          f32 %23 = OpFAdd %21 %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Private f32* %27 = OpAccessChain %9 %24 
                                          f32 %28 = OpLoad %27 
                                 Uniform f32* %30 = OpAccessChain %16 %29 
                                          f32 %31 = OpLoad %30 
                                          f32 %32 = OpFMul %28 %31 
                                 Private f32* %33 = OpAccessChain %9 %24 
                                                      OpStore %33 %32 
                                 Private f32* %34 = OpAccessChain %9 %24 
                                          f32 %35 = OpLoad %34 
                                          f32 %37 = OpFMul %35 %36 
                                 Private f32* %38 = OpAccessChain %9 %24 
                                                      OpStore %38 %37 
                                 Uniform f32* %40 = OpAccessChain %16 %29 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFAdd %42 %43 
                                                      OpStore %39 %44 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpLoad %39 
                                          f32 %52 = OpFMul %50 %51 
                                 Private f32* %53 = OpAccessChain %9 %24 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpFAdd %52 %54 
                                 Private f32* %56 = OpAccessChain %9 %24 
                                                      OpStore %56 %55 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %63 = OpAccessChain %16 %60 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %59 %64 
                                                      OpStore %57 %65 
                                 Private f32* %68 = OpAccessChain %9 %24 
                                          f32 %69 = OpLoad %68 
                                  Output f32* %71 = OpAccessChain %67 %47 
                                                      OpStore %71 %69 
                               Uniform f32_4* %72 = OpAccessChain %16 %60 %60 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %46 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %57 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %9 %78 
                               Uniform f32_4* %79 = OpAccessChain %16 %60 %29 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %46 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %9 %85 
                                        f32_4 %86 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %16 %60 %18 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %86 %88 
                                                      OpStore %9 %89 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
                               Uniform f32_4* %92 = OpAccessChain %16 %61 %61 
                                        f32_4 %93 = OpLoad %92 
                                        f32_4 %94 = OpFMul %91 %93 
                                                      OpStore %57 %94 
                               Uniform f32_4* %95 = OpAccessChain %16 %61 %60 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpVectorShuffle %97 %97 0 0 0 0 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %57 
                                       f32_4 %101 = OpFAdd %99 %100 
                                                      OpStore %57 %101 
                              Uniform f32_4* %102 = OpAccessChain %16 %61 %29 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpLoad %9 
                                       f32_4 %105 = OpVectorShuffle %104 %104 2 2 2 2 
                                       f32_4 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %57 
                                       f32_4 %108 = OpFAdd %106 %107 
                                                      OpStore %57 %108 
                              Uniform f32_4* %113 = OpAccessChain %16 %61 %18 
                                       f32_4 %114 = OpLoad %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %115 3 3 3 3 
                                       f32_4 %117 = OpFMul %114 %116 
                                       f32_4 %118 = OpLoad %57 
                                       f32_4 %119 = OpFAdd %117 %118 
                               Output f32_4* %120 = OpAccessChain %112 %60 
                                                      OpStore %120 %119 
                                       f32_4 %123 = OpLoad %122 
                                                      OpStore %121 %123 
                                       f32_2 %129 = OpLoad %128 
                                                      OpStore %126 %129 
                                       f32_4 %131 = OpLoad %46 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 2 3 
                                       f32_4 %133 = OpLoad %67 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 1 5 6 
                                                      OpStore %67 %134 
                                 Output f32* %135 = OpAccessChain %112 %60 %47 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFNegate %136 
                                 Output f32* %138 = OpAccessChain %112 %60 %47 
                                                      OpStore %138 %137 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 478
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %29 %125 %183 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %29 Location 29 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpMemberDecorate %61 0 Offset 61 
                                                      OpMemberDecorate %61 1 RelaxedPrecision 
                                                      OpMemberDecorate %61 1 Offset 61 
                                                      OpMemberDecorate %61 2 RelaxedPrecision 
                                                      OpMemberDecorate %61 2 Offset 61 
                                                      OpMemberDecorate %61 3 Offset 61 
                                                      OpDecorate %61 Block 
                                                      OpDecorate %63 DescriptorSet 63 
                                                      OpDecorate %63 Binding 63 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %134 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %459 RelaxedPrecision 
                                                      OpDecorate %461 RelaxedPrecision 
                                                      OpDecorate %462 RelaxedPrecision 
                                                      OpDecorate %463 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %466 RelaxedPrecision 
                                                      OpDecorate %467 RelaxedPrecision 
                                                      OpDecorate %469 RelaxedPrecision 
                                                      OpDecorate %470 RelaxedPrecision 
                                                      OpDecorate %471 RelaxedPrecision 
                                                      OpDecorate %472 RelaxedPrecision 
                                                      OpDecorate %473 RelaxedPrecision 
                                                      OpDecorate %474 RelaxedPrecision 
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
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Private %6 
                                              %28 = OpTypePointer Input %7 
                                 Input f32_4* %29 = OpVariable Input 
                                              %30 = OpTypePointer Input %6 
                                          f32 %34 = OpConstant 3.67402E-40 
                                          u32 %36 = OpConstant 0 
                               Private f32_4* %38 = OpVariable Private 
                                              %42 = OpTypeBool 
                                              %43 = OpTypePointer Private %42 
                                Private bool* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.67402E-40 
                                              %50 = OpTypeInt 32 1 
                                          i32 %51 = OpConstant 0 
                                          i32 %52 = OpConstant 1 
                                          i32 %54 = OpConstant -1 
                               Private f32_4* %60 = OpVariable Private 
                                              %61 = OpTypeStruct %7 %7 %7 %7 
                                              %62 = OpTypePointer Uniform %61 
Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %63 = OpVariable Uniform 
                                          u32 %64 = OpConstant 2 
                                              %65 = OpTypePointer Uniform %6 
                                          f32 %72 = OpConstant 3.67402E-40 
                                          f32 %74 = OpConstant 3.67402E-40 
                                          i32 %79 = OpConstant 2 
                                              %80 = OpTypePointer Uniform %7 
                                          f32 %89 = OpConstant 3.67402E-40 
                                          f32 %90 = OpConstant 3.67402E-40 
                                          f32 %91 = OpConstant 3.67402E-40 
                                        f32_3 %92 = OpConstantComposite %89 %90 %91 
                                          f32 %97 = OpConstant 3.67402E-40 
                                          f32 %99 = OpConstant 3.67402E-40 
                                             %124 = OpTypePointer Output %7 
                               Output f32_4* %125 = OpVariable Output 
                                             %128 = OpTypePointer Output %6 
                                Private f32* %134 = OpVariable Private 
                                         f32 %137 = OpConstant 3.67402E-40 
                                Private f32* %139 = OpVariable Private 
                                         f32 %163 = OpConstant 3.67402E-40 
                              Private f32_4* %168 = OpVariable Private 
                                       f32_3 %178 = OpConstantComposite %163 %163 %163 
                                Private f32* %182 = OpVariable Private 
                                Input f32_4* %183 = OpVariable Input 
                                         u32 %184 = OpConstant 1 
                                         f32 %187 = OpConstant 3.67402E-40 
                                             %198 = OpTypeVector %42 3 
                                             %199 = OpTypePointer Private %198 
                             Private bool_3* %200 = OpVariable Private 
                                         f32 %201 = OpConstant 3.67402E-40 
                                       f32_4 %202 = OpConstantComposite %201 %201 %201 %47 
                                         i32 %203 = OpConstant 3 
                                             %207 = OpTypeVector %42 4 
                                             %210 = OpTypePointer Function %20 
                                Private f32* %222 = OpVariable Private 
                                         f32 %226 = OpConstant 3.67402E-40 
                              Private f32_4* %241 = OpVariable Private 
                                             %246 = OpTypePointer Private %15 
                              Private f32_2* %247 = OpVariable Private 
                               Private bool* %254 = OpVariable Private 
                                Private f32* %260 = OpVariable Private 
                                             %261 = OpTypePointer Function %6 
                                         f32 %266 = OpConstant 3.67402E-40 
                                         f32 %279 = OpConstant 3.67402E-40 
                                         f32 %286 = OpConstant 3.67402E-40 
                                       f32_2 %287 = OpConstantComposite %279 %286 
                               Private bool* %309 = OpVariable Private 
                                Private f32* %315 = OpVariable Private 
                              Private f32_3* %344 = OpVariable Private 
                                         f32 %358 = OpConstant 3.67402E-40 
                                         f32 %360 = OpConstant 3.67402E-40 
                                         f32 %378 = OpConstant 3.67402E-40 
                                       f32_3 %379 = OpConstantComposite %266 %286 %378 
                                       f32_3 %390 = OpConstantComposite %358 %358 %358 
                                         f32 %392 = OpConstant 3.67402E-40 
                                       f32_3 %393 = OpConstantComposite %392 %392 %392 
                                       f32_3 %400 = OpConstantComposite %279 %279 %279 
                                       f32_3 %434 = OpConstantComposite %266 %266 %266 
                                         f32 %444 = OpConstant 3.67402E-40 
                                       f32_3 %445 = OpConstantComposite %444 %444 %444 
                                       f32_3 %447 = OpConstantComposite %47 %47 %137 
                              Private f32_3* %461 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %211 = OpVariable Function 
                             Function f32_3* %231 = OpVariable Function 
                               Function f32* %262 = OpVariable Function 
                               Function f32* %316 = OpVariable Function 
                             Function f32_3* %451 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                          f32 %27 = OpLoad %26 
                                   Input f32* %31 = OpAccessChain %29 %24 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %27 %32 
                                          f32 %35 = OpFAdd %33 %34 
                                 Private f32* %37 = OpAccessChain %22 %36 
                                                      OpStore %37 %35 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpLoad %29 
                                        f32_4 %41 = OpFMul %39 %40 
                                                      OpStore %38 %41 
                                 Private f32* %45 = OpAccessChain %22 %36 
                                          f32 %46 = OpLoad %45 
                                         bool %48 = OpFOrdLessThan %46 %47 
                                                      OpStore %44 %48 
                                         bool %49 = OpLoad %44 
                                          i32 %53 = OpSelect %49 %52 %51 
                                          i32 %55 = OpIMul %53 %54 
                                         bool %56 = OpINotEqual %55 %51 
                                                      OpSelectionMerge %58 None 
                                                      OpBranchConditional %56 %57 %58 
                                              %57 = OpLabel 
                                                      OpKill
                                              %58 = OpLabel 
                                 Uniform f32* %66 = OpAccessChain %63 %51 %64 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpExtInst %1 13 %67 
                                 Private f32* %69 = OpAccessChain %60 %36 
                                                      OpStore %69 %68 
                                 Private f32* %70 = OpAccessChain %60 %36 
                                          f32 %71 = OpLoad %70 
                                          f32 %73 = OpFMul %71 %72 
                                          f32 %75 = OpFAdd %73 %74 
                                 Private f32* %76 = OpAccessChain %60 %36 
                                                      OpStore %76 %75 
                                        f32_4 %77 = OpLoad %60 
                                        f32_3 %78 = OpVectorShuffle %77 %77 0 0 0 
                               Uniform f32_4* %81 = OpAccessChain %63 %79 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                        f32_3 %84 = OpFMul %78 %83 
                                        f32_4 %85 = OpLoad %60 
                                        f32_4 %86 = OpVectorShuffle %85 %84 4 5 6 3 
                                                      OpStore %60 %86 
                                        f32_4 %87 = OpLoad %38 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                          f32 %93 = OpDot %88 %92 
                                 Private f32* %94 = OpAccessChain %22 %36 
                                                      OpStore %94 %93 
                                 Private f32* %95 = OpAccessChain %22 %36 
                                          f32 %96 = OpLoad %95 
                                          f32 %98 = OpFMul %96 %97 
                                         f32 %100 = OpFAdd %98 %99 
                                Private f32* %101 = OpAccessChain %22 %36 
                                                      OpStore %101 %100 
                                       f32_4 %102 = OpLoad %60 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                       f32_3 %104 = OpLoad %22 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 0 0 
                                       f32_3 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %38 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFNegate %108 
                                       f32_3 %110 = OpFAdd %106 %109 
                                       f32_4 %111 = OpLoad %60 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
                                                      OpStore %60 %112 
                              Uniform f32_4* %113 = OpAccessChain %63 %79 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 3 3 3 
                                       f32_4 %116 = OpLoad %60 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %38 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpFAdd %118 %120 
                                       f32_4 %122 = OpLoad %60 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %60 %123 
                                Private f32* %126 = OpAccessChain %38 %24 
                                         f32 %127 = OpLoad %126 
                                 Output f32* %129 = OpAccessChain %125 %24 
                                                      OpStore %129 %127 
                                       f32_4 %130 = OpLoad %60 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                         f32 %132 = OpDot %131 %92 
                                Private f32* %133 = OpAccessChain %22 %36 
                                                      OpStore %133 %132 
                                Private f32* %135 = OpAccessChain %22 %36 
                                         f32 %136 = OpLoad %135 
                                         f32 %138 = OpExtInst %1 40 %136 %137 
                                                      OpStore %134 %138 
                                Private f32* %140 = OpAccessChain %22 %36 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpLoad %134 
                                         f32 %143 = OpFNegate %142 
                                         f32 %144 = OpFAdd %141 %143 
                                                      OpStore %139 %144 
                              Uniform f32_4* %145 = OpAccessChain %63 %79 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                         f32 %148 = OpDot %147 %92 
                                Private f32* %149 = OpAccessChain %22 %36 
                                                      OpStore %149 %148 
                                Private f32* %150 = OpAccessChain %22 %36 
                                         f32 %151 = OpLoad %150 
                                Private f32* %152 = OpAccessChain %22 %36 
                                         f32 %153 = OpLoad %152 
                                         f32 %154 = OpFAdd %151 %153 
                                Private f32* %155 = OpAccessChain %22 %36 
                                                      OpStore %155 %154 
                                Private f32* %156 = OpAccessChain %22 %36 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpLoad %139 
                                         f32 %159 = OpFMul %157 %158 
                                         f32 %160 = OpLoad %134 
                                         f32 %161 = OpFAdd %159 %160 
                                                      OpStore %134 %161 
                                         f32 %162 = OpLoad %134 
                                         f32 %164 = OpFMul %162 %163 
                                                      OpStore %134 %164 
                                         f32 %165 = OpLoad %134 
                                         f32 %166 = OpLoad %134 
                                         f32 %167 = OpFMul %165 %166 
                                                      OpStore %134 %167 
                                         f32 %169 = OpLoad %134 
                                       f32_3 %170 = OpCompositeConstruct %169 %169 %169 
                                       f32_4 %171 = OpLoad %60 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFMul %170 %172 
                                       f32_4 %174 = OpLoad %168 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 6 3 
                                                      OpStore %168 %175 
                                       f32_4 %176 = OpLoad %168 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                       f32_3 %179 = OpFMul %177 %178 
                                       f32_4 %180 = OpLoad %168 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %168 %181 
                                  Input f32* %185 = OpAccessChain %183 %184 
                                         f32 %186 = OpLoad %185 
                                         f32 %188 = OpExtInst %1 37 %186 %187 
                                                      OpStore %182 %188 
                                         f32 %189 = OpLoad %182 
                                         f32 %190 = OpExtInst %1 40 %189 %47 
                                                      OpStore %182 %190 
                                         f32 %191 = OpLoad %182 
                                       f32_3 %192 = OpCompositeConstruct %191 %191 %191 
                                       f32_4 %193 = OpLoad %168 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                                       f32_3 %195 = OpFMul %192 %194 
                                       f32_4 %196 = OpLoad %168 
                                       f32_4 %197 = OpVectorShuffle %196 %195 4 5 6 3 
                                                      OpStore %168 %197 
                              Uniform f32_4* %204 = OpAccessChain %63 %203 
                                       f32_4 %205 = OpLoad %204 
                                       f32_4 %206 = OpVectorShuffle %205 %205 0 1 2 0 
                                      bool_4 %208 = OpFOrdLessThan %202 %206 
                                      bool_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                                      OpStore %200 %209 
                                      bool_3 %212 = OpLoad %200 
                                        bool %213 = OpCompositeExtract %212 0 
                                                      OpSelectionMerge %215 None 
                                                      OpBranchConditional %213 %214 %218 
                                             %214 = OpLabel 
                                       f32_4 %216 = OpLoad %168 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
                                                      OpStore %211 %217 
                                                      OpBranch %215 
                                             %218 = OpLabel 
                                       f32_4 %219 = OpLoad %60 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                                                      OpStore %211 %220 
                                                      OpBranch %215 
                                             %215 = OpLabel 
                                       f32_3 %221 = OpLoad %211 
                                                      OpStore %22 %221 
                                       f32_3 %223 = OpLoad %22 
                                         f32 %224 = OpDot %223 %92 
                                                      OpStore %222 %224 
                                         f32 %225 = OpLoad %222 
                                         f32 %227 = OpFMul %225 %226 
                                                      OpStore %222 %227 
                                         f32 %228 = OpLoad %222 
                                         f32 %229 = OpLoad %222 
                                         f32 %230 = OpFMul %228 %229 
                                                      OpStore %222 %230 
                                      bool_3 %232 = OpLoad %200 
                                        bool %233 = OpCompositeExtract %232 1 
                                                      OpSelectionMerge %235 None 
                                                      OpBranchConditional %233 %234 %238 
                                             %234 = OpLabel 
                                         f32 %236 = OpLoad %222 
                                       f32_3 %237 = OpCompositeConstruct %236 %236 %236 
                                                      OpStore %231 %237 
                                                      OpBranch %235 
                                             %238 = OpLabel 
                                       f32_3 %239 = OpLoad %22 
                                                      OpStore %231 %239 
                                                      OpBranch %235 
                                             %235 = OpLabel 
                                       f32_3 %240 = OpLoad %231 
                                                      OpStore %22 %240 
                                Private f32* %242 = OpAccessChain %22 %36 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFNegate %243 
                                Private f32* %245 = OpAccessChain %241 %24 
                                                      OpStore %245 %244 
                                       f32_3 %248 = OpLoad %22 
                                       f32_2 %249 = OpVectorShuffle %248 %248 2 1 
                                       f32_2 %250 = OpFNegate %249 
                                       f32_3 %251 = OpLoad %22 
                                       f32_2 %252 = OpVectorShuffle %251 %251 1 2 
                                       f32_2 %253 = OpFAdd %250 %252 
                                                      OpStore %247 %253 
                                Private f32* %255 = OpAccessChain %22 %184 
                                         f32 %256 = OpLoad %255 
                                Private f32* %257 = OpAccessChain %22 %64 
                                         f32 %258 = OpLoad %257 
                                        bool %259 = OpFOrdGreaterThanEqual %256 %258 
                                                      OpStore %254 %259 
                                        bool %263 = OpLoad %254 
                                                      OpSelectionMerge %265 None 
                                                      OpBranchConditional %263 %264 %267 
                                             %264 = OpLabel 
                                                      OpStore %262 %266 
                                                      OpBranch %265 
                                             %267 = OpLabel 
                                                      OpStore %262 %47 
                                                      OpBranch %265 
                                             %265 = OpLabel 
                                         f32 %268 = OpLoad %262 
                                                      OpStore %260 %268 
                                         f32 %269 = OpLoad %260 
                                       f32_2 %270 = OpCompositeConstruct %269 %269 
                                       f32_2 %271 = OpLoad %247 
                                       f32_2 %272 = OpFMul %270 %271 
                                       f32_3 %273 = OpLoad %22 
                                       f32_2 %274 = OpVectorShuffle %273 %273 2 1 
                                       f32_2 %275 = OpFAdd %272 %274 
                                       f32_4 %276 = OpLoad %168 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 2 3 
                                                      OpStore %168 %277 
                                Private f32* %278 = OpAccessChain %60 %36 
                                                      OpStore %278 %266 
                                Private f32* %280 = OpAccessChain %60 %184 
                                                      OpStore %280 %279 
                                         f32 %281 = OpLoad %260 
                                       f32_2 %282 = OpCompositeConstruct %281 %281 
                                       f32_4 %283 = OpLoad %60 
                                       f32_2 %284 = OpVectorShuffle %283 %283 0 1 
                                       f32_2 %285 = OpFMul %282 %284 
                                       f32_2 %288 = OpFAdd %285 %287 
                                       f32_4 %289 = OpLoad %168 
                                       f32_4 %290 = OpVectorShuffle %289 %288 0 1 4 5 
                                                      OpStore %168 %290 
                                       f32_4 %291 = OpLoad %168 
                                       f32_3 %292 = OpVectorShuffle %291 %291 0 1 3 
                                       f32_3 %293 = OpFNegate %292 
                                       f32_4 %294 = OpLoad %241 
                                       f32_4 %295 = OpVectorShuffle %294 %293 4 5 6 3 
                                                      OpStore %241 %295 
                                       f32_4 %296 = OpLoad %241 
                                       f32_3 %297 = OpVectorShuffle %296 %296 1 2 3 
                                       f32_4 %298 = OpLoad %168 
                                       f32_3 %299 = OpVectorShuffle %298 %298 1 2 0 
                                       f32_3 %300 = OpFAdd %297 %299 
                                       f32_4 %301 = OpLoad %60 
                                       f32_4 %302 = OpVectorShuffle %301 %300 0 4 5 6 
                                                      OpStore %60 %302 
                                Private f32* %303 = OpAccessChain %241 %36 
                                         f32 %304 = OpLoad %303 
                                Private f32* %305 = OpAccessChain %22 %36 
                                         f32 %306 = OpLoad %305 
                                         f32 %307 = OpFAdd %304 %306 
                                Private f32* %308 = OpAccessChain %60 %36 
                                                      OpStore %308 %307 
                                Private f32* %310 = OpAccessChain %22 %36 
                                         f32 %311 = OpLoad %310 
                                Private f32* %312 = OpAccessChain %168 %36 
                                         f32 %313 = OpLoad %312 
                                        bool %314 = OpFOrdGreaterThanEqual %311 %313 
                                                      OpStore %309 %314 
                                        bool %317 = OpLoad %309 
                                                      OpSelectionMerge %319 None 
                                                      OpBranchConditional %317 %318 %320 
                                             %318 = OpLabel 
                                                      OpStore %316 %266 
                                                      OpBranch %319 
                                             %320 = OpLabel 
                                                      OpStore %316 %47 
                                                      OpBranch %319 
                                             %319 = OpLabel 
                                         f32 %321 = OpLoad %316 
                                                      OpStore %315 %321 
                                         f32 %322 = OpLoad %315 
                                Private f32* %323 = OpAccessChain %60 %24 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFMul %322 %324 
                                Private f32* %326 = OpAccessChain %22 %36 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpFAdd %325 %327 
                                                      OpStore %182 %328 
                                         f32 %329 = OpLoad %315 
                                       f32_3 %330 = OpCompositeConstruct %329 %329 %329 
                                       f32_4 %331 = OpLoad %60 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFMul %330 %332 
                                       f32_4 %334 = OpLoad %168 
                                       f32_3 %335 = OpVectorShuffle %334 %334 0 1 3 
                                       f32_3 %336 = OpFAdd %333 %335 
                                       f32_4 %337 = OpLoad %60 
                                       f32_4 %338 = OpVectorShuffle %337 %336 4 5 6 3 
                                                      OpStore %60 %338 
                                Private f32* %339 = OpAccessChain %60 %184 
                                         f32 %340 = OpLoad %339 
                                         f32 %341 = OpLoad %182 
                                         f32 %342 = OpExtInst %1 37 %340 %341 
                                Private f32* %343 = OpAccessChain %168 %36 
                                                      OpStore %343 %342 
                                Private f32* %345 = OpAccessChain %60 %184 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpFNegate %346 
                                         f32 %348 = OpLoad %182 
                                         f32 %349 = OpFAdd %347 %348 
                                Private f32* %350 = OpAccessChain %344 %36 
                                                      OpStore %350 %349 
                                Private f32* %351 = OpAccessChain %60 %36 
                                         f32 %352 = OpLoad %351 
                                Private f32* %353 = OpAccessChain %168 %36 
                                         f32 %354 = OpLoad %353 
                                         f32 %355 = OpFNegate %354 
                                         f32 %356 = OpFAdd %352 %355 
                                                      OpStore %182 %356 
                                         f32 %357 = OpLoad %182 
                                         f32 %359 = OpFMul %357 %358 
                                         f32 %361 = OpFAdd %359 %360 
                                Private f32* %362 = OpAccessChain %168 %36 
                                                      OpStore %362 %361 
                                Private f32* %363 = OpAccessChain %344 %36 
                                         f32 %364 = OpLoad %363 
                                Private f32* %365 = OpAccessChain %168 %36 
                                         f32 %366 = OpLoad %365 
                                         f32 %367 = OpFDiv %364 %366 
                                Private f32* %368 = OpAccessChain %344 %36 
                                                      OpStore %368 %367 
                                Private f32* %369 = OpAccessChain %344 %36 
                                         f32 %370 = OpLoad %369 
                                Private f32* %371 = OpAccessChain %60 %64 
                                         f32 %372 = OpLoad %371 
                                         f32 %373 = OpFAdd %370 %372 
                                Private f32* %374 = OpAccessChain %344 %36 
                                                      OpStore %374 %373 
                                       f32_3 %375 = OpLoad %344 
                                       f32_3 %376 = OpVectorShuffle %375 %375 0 0 0 
                                       f32_3 %377 = OpExtInst %1 4 %376 
                                       f32_3 %380 = OpFAdd %377 %379 
                                       f32_4 %381 = OpLoad %168 
                                       f32_4 %382 = OpVectorShuffle %381 %380 4 5 6 3 
                                                      OpStore %168 %382 
                                       f32_4 %383 = OpLoad %168 
                                       f32_3 %384 = OpVectorShuffle %383 %383 0 1 2 
                                       f32_3 %385 = OpExtInst %1 10 %384 
                                       f32_4 %386 = OpLoad %168 
                                       f32_4 %387 = OpVectorShuffle %386 %385 4 5 6 3 
                                                      OpStore %168 %387 
                                       f32_4 %388 = OpLoad %168 
                                       f32_3 %389 = OpVectorShuffle %388 %388 0 1 2 
                                       f32_3 %391 = OpFMul %389 %390 
                                       f32_3 %394 = OpFAdd %391 %393 
                                       f32_4 %395 = OpLoad %168 
                                       f32_4 %396 = OpVectorShuffle %395 %394 4 5 6 3 
                                                      OpStore %168 %396 
                                       f32_4 %397 = OpLoad %168 
                                       f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
                                       f32_3 %399 = OpExtInst %1 4 %398 
                                       f32_3 %401 = OpFAdd %399 %400 
                                       f32_4 %402 = OpLoad %168 
                                       f32_4 %403 = OpVectorShuffle %402 %401 4 5 6 3 
                                                      OpStore %168 %403 
                                       f32_4 %404 = OpLoad %168 
                                       f32_3 %405 = OpVectorShuffle %404 %404 0 1 2 
                                       f32_3 %406 = OpCompositeConstruct %47 %47 %47 
                                       f32_3 %407 = OpCompositeConstruct %266 %266 %266 
                                       f32_3 %408 = OpExtInst %1 43 %405 %406 %407 
                                       f32_4 %409 = OpLoad %168 
                                       f32_4 %410 = OpVectorShuffle %409 %408 4 5 6 3 
                                                      OpStore %168 %410 
                                       f32_4 %411 = OpLoad %168 
                                       f32_3 %412 = OpVectorShuffle %411 %411 0 1 2 
                                       f32_3 %413 = OpFAdd %412 %400 
                                       f32_4 %414 = OpLoad %168 
                                       f32_4 %415 = OpVectorShuffle %414 %413 4 5 6 3 
                                                      OpStore %168 %415 
                                Private f32* %416 = OpAccessChain %60 %36 
                                         f32 %417 = OpLoad %416 
                                         f32 %418 = OpFAdd %417 %360 
                                Private f32* %419 = OpAccessChain %344 %36 
                                                      OpStore %419 %418 
                                         f32 %420 = OpLoad %182 
                                Private f32* %421 = OpAccessChain %344 %36 
                                         f32 %422 = OpLoad %421 
                                         f32 %423 = OpFDiv %420 %422 
                                Private f32* %424 = OpAccessChain %344 %36 
                                                      OpStore %424 %423 
                                Private f32* %425 = OpAccessChain %344 %36 
                                         f32 %426 = OpLoad %425 
                                         f32 %427 = OpFMul %426 %201 
                                Private f32* %428 = OpAccessChain %344 %36 
                                                      OpStore %428 %427 
                                       f32_3 %429 = OpLoad %344 
                                       f32_3 %430 = OpVectorShuffle %429 %429 0 0 0 
                                       f32_4 %431 = OpLoad %168 
                                       f32_3 %432 = OpVectorShuffle %431 %431 0 1 2 
                                       f32_3 %433 = OpFMul %430 %432 
                                       f32_3 %435 = OpFAdd %433 %434 
                                                      OpStore %344 %435 
                                       f32_3 %436 = OpLoad %344 
                                       f32_4 %437 = OpLoad %60 
                                       f32_3 %438 = OpVectorShuffle %437 %437 0 0 0 
                                       f32_3 %439 = OpFMul %436 %438 
                                       f32_4 %440 = OpLoad %60 
                                       f32_4 %441 = OpVectorShuffle %440 %439 4 5 6 3 
                                                      OpStore %60 %441 
                                       f32_4 %442 = OpLoad %60 
                                       f32_3 %443 = OpVectorShuffle %442 %442 0 1 2 
                                       f32_3 %446 = OpFMul %443 %445 
                                       f32_3 %448 = OpFAdd %446 %447 
                                       f32_4 %449 = OpLoad %60 
                                       f32_4 %450 = OpVectorShuffle %449 %448 4 5 6 3 
                                                      OpStore %60 %450 
                                      bool_3 %452 = OpLoad %200 
                                        bool %453 = OpCompositeExtract %452 2 
                                                      OpSelectionMerge %455 None 
                                                      OpBranchConditional %453 %454 %458 
                                             %454 = OpLabel 
                                       f32_4 %456 = OpLoad %60 
                                       f32_3 %457 = OpVectorShuffle %456 %456 0 1 2 
                                                      OpStore %451 %457 
                                                      OpBranch %455 
                                             %458 = OpLabel 
                                       f32_3 %459 = OpLoad %22 
                                                      OpStore %451 %459 
                                                      OpBranch %455 
                                             %455 = OpLabel 
                                       f32_3 %460 = OpLoad %451 
                                                      OpStore %22 %460 
                                       f32_3 %462 = OpLoad %22 
                                       f32_3 %463 = OpFNegate %462 
                              Uniform f32_4* %464 = OpAccessChain %63 %52 
                                       f32_4 %465 = OpLoad %464 
                                       f32_3 %466 = OpVectorShuffle %465 %465 0 1 2 
                                       f32_3 %467 = OpFAdd %463 %466 
                                                      OpStore %461 %467 
                              Uniform f32_4* %468 = OpAccessChain %63 %52 
                                       f32_4 %469 = OpLoad %468 
                                       f32_3 %470 = OpVectorShuffle %469 %469 3 3 3 
                                       f32_3 %471 = OpLoad %461 
                                       f32_3 %472 = OpFMul %470 %471 
                                       f32_3 %473 = OpLoad %22 
                                       f32_3 %474 = OpFAdd %472 %473 
                                       f32_4 %475 = OpLoad %125 
                                       f32_4 %476 = OpVectorShuffle %475 %474 4 5 6 3 
                                                      OpStore %125 %476 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
""
}
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
""
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
""
}
}
}
}
}