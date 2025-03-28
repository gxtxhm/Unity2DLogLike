//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/PlayerPalettized" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_PaletteTex ("Palette (RGB)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_FlatColor ("Flat Color", Color) = (0,0,0,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_SpecialFlags ("Special Flags", Vector) = (0,0,0,0)
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 24456
Program "vp" {
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
uniform  sampler2D _PaletteTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
float u_xlat4;
bool u_xlatb4;
float u_xlat7;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.x * 15.9375;
    u_xlat4 = u_xlat0.w * vs_COLOR0.w + -0.100000001;
    u_xlatb4 = u_xlat4<0.0;
    if((int(u_xlatb4) * int(0xffffffffu))!=0){discard;}
    u_xlatb4 = u_xlat1.x>=(-u_xlat1.x);
    u_xlat7 = fract(abs(u_xlat1.x));
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * 0.0625 + 0.0399999991;
    u_xlat1.x = (u_xlatb4) ? u_xlat7 : (-u_xlat7);
    u_xlat2.y = u_xlat1.x + 0.0399999991;
    u_xlat10_1 = texture(_PaletteTex, u_xlat2.xy);
    u_xlat0.xyz = u_xlat10_1.xyz;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat0.xyz = (-u_xlat0.xyz) * vs_COLOR0.xyz + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat9 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9 = u_xlat9 * 0.669999957 + 0.330000013;
    u_xlat1.x = sin(_Time.z);
    u_xlat1.x = u_xlat1.x * 0.25 + 1.75;
    u_xlat1.xyz = u_xlat1.xxx * _FlatColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat9) + (-u_xlat0.xyz);
    u_xlat0.xyz = _FlatColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.xyz = (-vec3(u_xlat9)) + u_xlat0.xyz;
    u_xlat1.xyz = _FlatColor.www * u_xlat1.xyz + vec3(u_xlat9);
    u_xlat9 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat10 = max(u_xlat9, 0.300000012);
    u_xlat9 = u_xlat9 + (-u_xlat10);
    u_xlat2.x = dot(_FlatColor.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9 = u_xlat2.x * u_xlat9 + u_xlat10;
    u_xlat9 = u_xlat9 * 4.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(3.0, 3.0, 3.0);
    u_xlat9 = min(vs_TEXCOORD1.y, 0.800000012);
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlatb9 = 0.5<_SpecialFlags.x;
    SV_Target0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
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
; Bound: 294
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %37 %137 %264 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %37 Location 37 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %65 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %101 DescriptorSet 101 
                                                      OpDecorate %101 Binding 101 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %110 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpMemberDecorate %118 0 Offset 118 
                                                      OpMemberDecorate %118 1 RelaxedPrecision 
                                                      OpMemberDecorate %118 1 Offset 118 
                                                      OpMemberDecorate %118 2 RelaxedPrecision 
                                                      OpMemberDecorate %118 2 Offset 118 
                                                      OpMemberDecorate %118 3 Offset 118 
                                                      OpDecorate %118 Block 
                                                      OpDecorate %120 DescriptorSet 120 
                                                      OpDecorate %120 Binding 120 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %124 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %129 RelaxedPrecision 
                                                      OpDecorate %130 RelaxedPrecision 
                                                      OpDecorate %131 RelaxedPrecision 
                                                      OpDecorate %132 RelaxedPrecision 
                                                      OpDecorate %133 RelaxedPrecision 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %137 Location 137 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
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
                               Private f32_4* %23 = OpVariable Private 
                                              %24 = OpTypeInt 32 0 
                                          u32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Private %6 
                                          f32 %29 = OpConstant 3.67402E-40 
                                 Private f32* %32 = OpVariable Private 
                                          u32 %33 = OpConstant 3 
                                              %36 = OpTypePointer Input %7 
                                 Input f32_4* %37 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          f32 %42 = OpConstant 3.67402E-40 
                                              %44 = OpTypeBool 
                                              %45 = OpTypePointer Private %44 
                                Private bool* %46 = OpVariable Private 
                                          f32 %48 = OpConstant 3.67402E-40 
                                              %51 = OpTypeInt 32 1 
                                          i32 %52 = OpConstant 0 
                                          i32 %53 = OpConstant 1 
                                          i32 %55 = OpConstant -1 
                                              %75 = OpTypeVector %6 3 
                                              %76 = OpTypePointer Private %75 
                               Private f32_3* %77 = OpVariable Private 
                                          f32 %80 = OpConstant 3.67402E-40 
                                          f32 %82 = OpConstant 3.67402E-40 
                                              %85 = OpTypePointer Function %6 
                                          u32 %99 = OpConstant 1 
 UniformConstant read_only Texture2DSampled* %101 = OpVariable UniformConstant 
                                             %118 = OpTypeStruct %7 %7 %7 %7 
                                             %119 = OpTypePointer Uniform %118 
Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %120 = OpVariable Uniform 
                                             %121 = OpTypePointer Uniform %7 
                                             %136 = OpTypePointer Output %7 
                               Output f32_4* %137 = OpVariable Output 
                                             %140 = OpTypePointer Output %6 
                                Private f32* %142 = OpVariable Private 
                                         f32 %145 = OpConstant 3.67402E-40 
                                         f32 %146 = OpConstant 3.67402E-40 
                                         f32 %147 = OpConstant 3.67402E-40 
                                       f32_3 %148 = OpConstantComposite %145 %146 %147 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %153 = OpConstant 3.67402E-40 
                                         u32 %155 = OpConstant 2 
                                             %156 = OpTypePointer Uniform %6 
                                         f32 %163 = OpConstant 3.67402E-40 
                                         f32 %165 = OpConstant 3.67402E-40 
                                         i32 %170 = OpConstant 2 
                              Private f32_3* %203 = OpVariable Private 
                                Private f32* %221 = OpVariable Private 
                                         f32 %224 = OpConstant 3.67402E-40 
                                Private f32* %226 = OpVariable Private 
                                         f32 %250 = OpConstant 3.67402E-40 
                                         f32 %260 = OpConstant 3.67402E-40 
                                       f32_3 %261 = OpConstantComposite %260 %260 %260 
                                Private f32* %263 = OpVariable Private 
                                Input f32_4* %264 = OpVariable Input 
                                         f32 %267 = OpConstant 3.67402E-40 
                               Private bool* %275 = OpVariable Private 
                                         f32 %276 = OpConstant 3.67402E-40 
                                         i32 %277 = OpConstant 3 
                                             %281 = OpTypePointer Function %75 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %86 = OpVariable Function 
                             Function f32_3* %282 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                        f32_2 %20 = OpVectorShuffle %19 %19 0 3 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %22 = OpVectorShuffle %21 %20 4 1 2 5 
                                                      OpStore %9 %22 
                                 Private f32* %27 = OpAccessChain %9 %25 
                                          f32 %28 = OpLoad %27 
                                          f32 %30 = OpFMul %28 %29 
                                 Private f32* %31 = OpAccessChain %23 %25 
                                                      OpStore %31 %30 
                                 Private f32* %34 = OpAccessChain %9 %33 
                                          f32 %35 = OpLoad %34 
                                   Input f32* %39 = OpAccessChain %37 %33 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpFMul %35 %40 
                                          f32 %43 = OpFAdd %41 %42 
                                                      OpStore %32 %43 
                                          f32 %47 = OpLoad %32 
                                         bool %49 = OpFOrdLessThan %47 %48 
                                                      OpStore %46 %49 
                                         bool %50 = OpLoad %46 
                                          i32 %54 = OpSelect %50 %53 %52 
                                          i32 %56 = OpIMul %54 %55 
                                         bool %57 = OpINotEqual %56 %52 
                                                      OpSelectionMerge %59 None 
                                                      OpBranchConditional %57 %58 %59 
                                              %58 = OpLabel 
                                                      OpKill
                                              %59 = OpLabel 
                                 Private f32* %61 = OpAccessChain %23 %25 
                                          f32 %62 = OpLoad %61 
                                 Private f32* %63 = OpAccessChain %23 %25 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpFNegate %64 
                                         bool %66 = OpFOrdGreaterThanEqual %62 %65 
                                                      OpStore %46 %66 
                                 Private f32* %67 = OpAccessChain %23 %25 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpExtInst %1 4 %68 
                                          f32 %70 = OpExtInst %1 10 %69 
                                                      OpStore %32 %70 
                                 Private f32* %71 = OpAccessChain %23 %25 
                                          f32 %72 = OpLoad %71 
                                          f32 %73 = OpExtInst %1 8 %72 
                                 Private f32* %74 = OpAccessChain %23 %25 
                                                      OpStore %74 %73 
                                 Private f32* %78 = OpAccessChain %23 %25 
                                          f32 %79 = OpLoad %78 
                                          f32 %81 = OpFMul %79 %80 
                                          f32 %83 = OpFAdd %81 %82 
                                 Private f32* %84 = OpAccessChain %77 %25 
                                                      OpStore %84 %83 
                                         bool %87 = OpLoad %46 
                                                      OpSelectionMerge %89 None 
                                                      OpBranchConditional %87 %88 %91 
                                              %88 = OpLabel 
                                          f32 %90 = OpLoad %32 
                                                      OpStore %86 %90 
                                                      OpBranch %89 
                                              %91 = OpLabel 
                                          f32 %92 = OpLoad %32 
                                          f32 %93 = OpFNegate %92 
                                                      OpStore %86 %93 
                                                      OpBranch %89 
                                              %89 = OpLabel 
                                          f32 %94 = OpLoad %86 
                                 Private f32* %95 = OpAccessChain %23 %25 
                                                      OpStore %95 %94 
                                 Private f32* %96 = OpAccessChain %23 %25 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFAdd %97 %82 
                                Private f32* %100 = OpAccessChain %77 %99 
                                                      OpStore %100 %98 
                  read_only Texture2DSampled %102 = OpLoad %101 
                                       f32_3 %103 = OpLoad %77 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_4 %105 = OpImageSampleImplicitLod %102 %104 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 6 3 
                                                      OpStore %9 %108 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpLoad %37 
                                       f32_4 %111 = OpFMul %109 %110 
                                                      OpStore %23 %111 
                                       f32_4 %112 = OpLoad %9 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFNegate %113 
                                       f32_4 %115 = OpLoad %37 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpFMul %114 %116 
                              Uniform f32_4* %122 = OpAccessChain %120 %53 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                       f32_3 %125 = OpFAdd %117 %124 
                                                      OpStore %77 %125 
                              Uniform f32_4* %126 = OpAccessChain %120 %53 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 3 3 3 
                                       f32_3 %129 = OpLoad %77 
                                       f32_3 %130 = OpFMul %128 %129 
                                       f32_4 %131 = OpLoad %23 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %23 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %23 %135 
                                Private f32* %138 = OpAccessChain %23 %33 
                                         f32 %139 = OpLoad %138 
                                 Output f32* %141 = OpAccessChain %137 %33 
                                                      OpStore %141 %139 
                                       f32_4 %143 = OpLoad %23 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                         f32 %149 = OpDot %144 %148 
                                                      OpStore %142 %149 
                                         f32 %150 = OpLoad %142 
                                         f32 %152 = OpFMul %150 %151 
                                         f32 %154 = OpFAdd %152 %153 
                                                      OpStore %142 %154 
                                Uniform f32* %157 = OpAccessChain %120 %52 %155 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpExtInst %1 13 %158 
                                Private f32* %160 = OpAccessChain %9 %25 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %9 %25 
                                         f32 %162 = OpLoad %161 
                                         f32 %164 = OpFMul %162 %163 
                                         f32 %166 = OpFAdd %164 %165 
                                Private f32* %167 = OpAccessChain %9 %25 
                                                      OpStore %167 %166 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 0 0 
                              Uniform f32_4* %171 = OpAccessChain %120 %170 
                                       f32_4 %172 = OpLoad %171 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFMul %169 %173 
                                       f32_4 %175 = OpLoad %9 
                                       f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                                      OpStore %9 %176 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                         f32 %179 = OpLoad %142 
                                       f32_3 %180 = OpCompositeConstruct %179 %179 %179 
                                       f32_3 %181 = OpFMul %178 %180 
                                       f32_4 %182 = OpLoad %23 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                       f32_3 %184 = OpFNegate %183 
                                       f32_3 %185 = OpFAdd %181 %184 
                                       f32_4 %186 = OpLoad %9 
                                       f32_4 %187 = OpVectorShuffle %186 %185 4 5 6 3 
                                                      OpStore %9 %187 
                              Uniform f32_4* %188 = OpAccessChain %120 %170 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 3 3 3 
                                       f32_4 %191 = OpLoad %9 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 2 
                                       f32_3 %193 = OpFMul %190 %192 
                                       f32_4 %194 = OpLoad %23 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
                                       f32_3 %196 = OpFAdd %193 %195 
                                       f32_4 %197 = OpLoad %9 
                                       f32_4 %198 = OpVectorShuffle %197 %196 4 5 6 3 
                                                      OpStore %9 %198 
                                       f32_4 %199 = OpLoad %9 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                                         f32 %201 = OpDot %200 %148 
                                Private f32* %202 = OpAccessChain %23 %25 
                                                      OpStore %202 %201 
                                       f32_4 %204 = OpLoad %9 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_4 %206 = OpLoad %23 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 0 0 
                                       f32_3 %208 = OpFNegate %207 
                                       f32_3 %209 = OpFAdd %205 %208 
                                                      OpStore %203 %209 
                              Uniform f32_4* %210 = OpAccessChain %120 %170 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 3 3 3 
                                       f32_3 %213 = OpLoad %203 
                                       f32_3 %214 = OpFMul %212 %213 
                                       f32_4 %215 = OpLoad %23 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 0 0 
                                       f32_3 %217 = OpFAdd %214 %216 
                                                      OpStore %203 %217 
                                       f32_3 %218 = OpLoad %203 
                                         f32 %219 = OpDot %218 %148 
                                Private f32* %220 = OpAccessChain %23 %25 
                                                      OpStore %220 %219 
                                Private f32* %222 = OpAccessChain %23 %25 
                                         f32 %223 = OpLoad %222 
                                         f32 %225 = OpExtInst %1 40 %223 %224 
                                                      OpStore %221 %225 
                                         f32 %227 = OpLoad %221 
                                         f32 %228 = OpFNegate %227 
                                Private f32* %229 = OpAccessChain %23 %25 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpFAdd %228 %230 
                                                      OpStore %226 %231 
                              Uniform f32_4* %232 = OpAccessChain %120 %170 
                                       f32_4 %233 = OpLoad %232 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                                         f32 %235 = OpDot %234 %148 
                                Private f32* %236 = OpAccessChain %23 %25 
                                                      OpStore %236 %235 
                                Private f32* %237 = OpAccessChain %23 %25 
                                         f32 %238 = OpLoad %237 
                                Private f32* %239 = OpAccessChain %23 %25 
                                         f32 %240 = OpLoad %239 
                                         f32 %241 = OpFAdd %238 %240 
                                Private f32* %242 = OpAccessChain %23 %25 
                                                      OpStore %242 %241 
                                Private f32* %243 = OpAccessChain %23 %25 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpLoad %226 
                                         f32 %246 = OpFMul %244 %245 
                                         f32 %247 = OpLoad %221 
                                         f32 %248 = OpFAdd %246 %247 
                                                      OpStore %221 %248 
                                         f32 %249 = OpLoad %221 
                                         f32 %251 = OpFMul %249 %250 
                                                      OpStore %221 %251 
                                         f32 %252 = OpLoad %221 
                                         f32 %253 = OpLoad %221 
                                         f32 %254 = OpFMul %252 %253 
                                                      OpStore %221 %254 
                                         f32 %255 = OpLoad %221 
                                       f32_3 %256 = OpCompositeConstruct %255 %255 %255 
                                       f32_3 %257 = OpLoad %203 
                                       f32_3 %258 = OpFMul %256 %257 
                                                      OpStore %203 %258 
                                       f32_3 %259 = OpLoad %203 
                                       f32_3 %262 = OpFMul %259 %261 
                                                      OpStore %203 %262 
                                  Input f32* %265 = OpAccessChain %264 %99 
                                         f32 %266 = OpLoad %265 
                                         f32 %268 = OpExtInst %1 37 %266 %267 
                                                      OpStore %263 %268 
                                         f32 %269 = OpLoad %263 
                                         f32 %270 = OpExtInst %1 40 %269 %48 
                                                      OpStore %263 %270 
                                         f32 %271 = OpLoad %263 
                                       f32_3 %272 = OpCompositeConstruct %271 %271 %271 
                                       f32_3 %273 = OpLoad %203 
                                       f32_3 %274 = OpFMul %272 %273 
                                                      OpStore %203 %274 
                                Uniform f32* %278 = OpAccessChain %120 %277 %25 
                                         f32 %279 = OpLoad %278 
                                        bool %280 = OpFOrdLessThan %276 %279 
                                                      OpStore %275 %280 
                                        bool %283 = OpLoad %275 
                                                      OpSelectionMerge %285 None 
                                                      OpBranchConditional %283 %284 %287 
                                             %284 = OpLabel 
                                       f32_3 %286 = OpLoad %203 
                                                      OpStore %282 %286 
                                                      OpBranch %285 
                                             %287 = OpLabel 
                                       f32_4 %288 = OpLoad %9 
                                       f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
                                                      OpStore %282 %289 
                                                      OpBranch %285 
                                             %285 = OpLabel 
                                       f32_3 %290 = OpLoad %282 
                                       f32_4 %291 = OpLoad %137 
                                       f32_4 %292 = OpVectorShuffle %291 %290 4 5 6 3 
                                                      OpStore %137 %292 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
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

uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _PaletteTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec2 u_xlat16_2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat9;
bool u_xlatb9;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.x * 15.9375;
    u_xlat5.x = u_xlat0.w * vs_COLOR0.w + -0.100000001;
    u_xlatb5 = u_xlat5.x<0.0;
    if((int(u_xlatb5) * int(0xffffffffu))!=0){discard;}
    u_xlatb5 = u_xlat1.x>=(-u_xlat1.x);
    u_xlat9 = fract(abs(u_xlat1.x));
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * 0.0625 + 0.0399999991;
    u_xlat1.x = (u_xlatb5) ? u_xlat9 : (-u_xlat9);
    u_xlat2.y = u_xlat1.x + 0.0399999991;
    u_xlat10_1 = texture(_PaletteTex, u_xlat2.xy);
    u_xlatb13 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat13 = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat16_2.xy = (-u_xlat10_1.zy) + u_xlat10_1.yz;
    u_xlat2.xy = vec2(u_xlat13) * u_xlat16_2.xy + u_xlat10_1.zy;
    u_xlatb13 = u_xlat10_1.x>=u_xlat2.x;
    u_xlat0.xyz = u_xlat10_1.xyz;
    u_xlat1.x = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.x;
    u_xlat5.xyz = (-u_xlat2.xyz) + u_xlat2.zyx;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat5.x = min(u_xlat1.y, u_xlat1.z);
    u_xlat5.x = (-u_xlat5.x) + u_xlat1.x;
    u_xlat9 = u_xlat1.x + 1.00000001e-010;
    u_xlat5.x = u_xlat5.x / u_xlat9;
    u_xlat2 = u_xlat0 * vs_COLOR0;
    u_xlat0.xyz = (-u_xlat0.xyz) * vs_COLOR0.xyz + _OverrideColor.xyz;
    u_xlat0.xyw = _OverrideColor.www * u_xlat0.yzx + u_xlat2.yzx;
    SV_Target0.w = u_xlat2.w;
    u_xlatb9 = u_xlat0.x>=u_xlat0.y;
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat0.yx;
    u_xlat3.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat9) * u_xlat3 + u_xlat2;
    u_xlatb9 = u_xlat0.w>=u_xlat2.x;
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat9) * u_xlat2 + u_xlat0;
    u_xlat9 = min(u_xlat0.y, u_xlat0.w);
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = u_xlat0.x * 6.0 + 1.00000001e-010;
    u_xlat4 = (-u_xlat0.y) + u_xlat0.w;
    u_xlat0.x = u_xlat4 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + u_xlat0.z;
    u_xlat0.xyz = abs(u_xlat0.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat0.xyz = abs(u_xlat0.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat5.xxx * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
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
; Bound: 425
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %17 %37 %225 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %13 RelaxedPrecision 
                                                     OpDecorate %13 DescriptorSet 13 
                                                     OpDecorate %13 Binding 13 
                                                     OpDecorate %14 RelaxedPrecision 
                                                     OpDecorate %17 Location 17 
                                                     OpDecorate %20 RelaxedPrecision 
                                                     OpDecorate %23 RelaxedPrecision 
                                                     OpDecorate %32 RelaxedPrecision 
                                                     OpDecorate %37 RelaxedPrecision 
                                                     OpDecorate %37 Location 37 
                                                     OpDecorate %40 RelaxedPrecision 
                                                     OpDecorate %47 RelaxedPrecision 
                                                     OpDecorate %62 RelaxedPrecision 
                                                     OpDecorate %64 RelaxedPrecision 
                                                     OpDecorate %65 RelaxedPrecision 
                                                     OpDecorate %68 RelaxedPrecision 
                                                     OpDecorate %69 RelaxedPrecision 
                                                     OpDecorate %70 RelaxedPrecision 
                                                     OpDecorate %72 RelaxedPrecision 
                                                     OpDecorate %73 RelaxedPrecision 
                                                     OpDecorate %77 RelaxedPrecision 
                                                     OpDecorate %79 RelaxedPrecision 
                                                     OpDecorate %81 RelaxedPrecision 
                                                     OpDecorate %83 RelaxedPrecision 
                                                     OpDecorate %90 RelaxedPrecision 
                                                     OpDecorate %92 RelaxedPrecision 
                                                     OpDecorate %93 RelaxedPrecision 
                                                     OpDecorate %94 RelaxedPrecision 
                                                     OpDecorate %97 RelaxedPrecision 
                                                     OpDecorate %98 RelaxedPrecision 
                                                     OpDecorate %101 RelaxedPrecision 
                                                     OpDecorate %101 DescriptorSet 101 
                                                     OpDecorate %101 Binding 101 
                                                     OpDecorate %102 RelaxedPrecision 
                                                     OpDecorate %103 RelaxedPrecision 
                                                     OpDecorate %104 RelaxedPrecision 
                                                     OpDecorate %106 RelaxedPrecision 
                                                     OpDecorate %198 RelaxedPrecision 
                                                     OpDecorate %203 RelaxedPrecision 
                                                     OpDecorate %204 RelaxedPrecision 
                                                     OpMemberDecorate %206 0 RelaxedPrecision 
                                                     OpMemberDecorate %206 0 Offset 206 
                                                     OpDecorate %206 Block 
                                                     OpDecorate %208 DescriptorSet 208 
                                                     OpDecorate %208 Binding 208 
                                                     OpDecorate %211 RelaxedPrecision 
                                                     OpDecorate %212 RelaxedPrecision 
                                                     OpDecorate %215 RelaxedPrecision 
                                                     OpDecorate %216 RelaxedPrecision 
                                                     OpDecorate %217 RelaxedPrecision 
                                                     OpDecorate %218 RelaxedPrecision 
                                                     OpDecorate %219 RelaxedPrecision 
                                                     OpDecorate %220 RelaxedPrecision 
                                                     OpDecorate %221 RelaxedPrecision 
                                                     OpDecorate %225 RelaxedPrecision 
                                                     OpDecorate %225 Location 225 
                                                     OpDecorate %227 RelaxedPrecision 
                                                     OpDecorate %231 RelaxedPrecision 
                                                     OpDecorate %232 RelaxedPrecision 
                                                     OpDecorate %234 RelaxedPrecision 
                                                     OpDecorate %235 RelaxedPrecision 
                                                     OpDecorate %236 RelaxedPrecision 
                                                     OpDecorate %237 RelaxedPrecision 
                                                     OpDecorate %238 RelaxedPrecision 
                                                     OpDecorate %239 RelaxedPrecision 
                                                     OpDecorate %240 RelaxedPrecision 
                                                     OpDecorate %243 RelaxedPrecision 
                                                     OpDecorate %245 RelaxedPrecision 
                                                     OpDecorate %257 RelaxedPrecision 
                                                     OpDecorate %259 RelaxedPrecision 
                                                     OpDecorate %260 RelaxedPrecision 
                                                     OpDecorate %291 RelaxedPrecision 
                                                     OpDecorate %296 RelaxedPrecision 
                                                     OpDecorate %322 RelaxedPrecision 
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
                              Private f32_4* %23 = OpVariable Private 
                                             %24 = OpTypeInt 32 0 
                                         u32 %25 = OpConstant 0 
                                             %26 = OpTypePointer Private %6 
                                         f32 %29 = OpConstant 3.67402E-40 
                                Private f32* %32 = OpVariable Private 
                                         u32 %33 = OpConstant 3 
                                             %36 = OpTypePointer Input %7 
                                Input f32_4* %37 = OpVariable Input 
                                             %38 = OpTypePointer Input %6 
                                         f32 %42 = OpConstant 3.67402E-40 
                                             %44 = OpTypeBool 
                                             %45 = OpTypePointer Private %44 
                               Private bool* %46 = OpVariable Private 
                                         f32 %48 = OpConstant 3.67402E-40 
                                             %51 = OpTypeInt 32 1 
                                         i32 %52 = OpConstant 0 
                                         i32 %53 = OpConstant 1 
                                         i32 %55 = OpConstant -1 
                                             %75 = OpTypeVector %6 3 
                                             %76 = OpTypePointer Private %75 
                              Private f32_3* %77 = OpVariable Private 
                                         f32 %80 = OpConstant 3.67402E-40 
                                         f32 %82 = OpConstant 3.67402E-40 
                                             %85 = OpTypePointer Function %6 
                                         u32 %99 = OpConstant 1 
UniformConstant read_only Texture2DSampled* %101 = OpVariable UniformConstant 
                                        u32 %111 = OpConstant 2 
                             Private f32_3* %115 = OpVariable Private 
                                        f32 %120 = OpConstant 3.67402E-40 
                                            %124 = OpTypePointer Private %15 
                             Private f32_2* %125 = OpVariable Private 
                              Private bool* %141 = OpVariable Private 
                               Private f32* %147 = OpVariable Private 
                             Private f32_4* %157 = OpVariable Private 
                             Private f32_2* %185 = OpVariable Private 
                                        f32 %188 = OpConstant 3.67402E-40 
                                            %206 = OpTypeStruct %7 
                                            %207 = OpTypePointer Uniform %206 
                   Uniform struct {f32_4;}* %208 = OpVariable Uniform 
                                            %209 = OpTypePointer Uniform %7 
                                            %224 = OpTypePointer Output %7 
                              Output f32_4* %225 = OpVariable Output 
                                            %228 = OpTypePointer Output %6 
                             Private f32_2* %234 = OpVariable Private 
                              Private bool* %241 = OpVariable Private 
                             Private f32_4* %254 = OpVariable Private 
                                        f32 %265 = OpConstant 3.67402E-40 
                                        f32 %271 = OpConstant 3.67402E-40 
                                      f32_2 %272 = OpConstantComposite %265 %271 
                              Private bool* %294 = OpVariable Private 
                             Private f32_3* %307 = OpVariable Private 
                                        f32 %347 = OpConstant 3.67402E-40 
                                        f32 %366 = OpConstant 3.67402E-40 
                                      f32_3 %367 = OpConstantComposite %120 %271 %366 
                                      f32_3 %378 = OpConstantComposite %347 %347 %347 
                                        f32 %380 = OpConstant 3.67402E-40 
                                      f32_3 %381 = OpConstantComposite %380 %380 %380 
                                      f32_3 %388 = OpConstantComposite %265 %265 %265 
                                      f32_3 %409 = OpConstantComposite %120 %120 %120 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                               Function f32* %86 = OpVariable Function 
                              Function f32* %116 = OpVariable Function 
                              Function f32* %148 = OpVariable Function 
                              Function f32* %247 = OpVariable Function 
                              Function f32* %300 = OpVariable Function 
                  read_only Texture2DSampled %14 = OpLoad %13 
                                       f32_2 %18 = OpLoad %17 
                                       f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                       f32_2 %20 = OpVectorShuffle %19 %19 0 3 
                                       f32_4 %21 = OpLoad %9 
                                       f32_4 %22 = OpVectorShuffle %21 %20 4 1 2 5 
                                                     OpStore %9 %22 
                                Private f32* %27 = OpAccessChain %9 %25 
                                         f32 %28 = OpLoad %27 
                                         f32 %30 = OpFMul %28 %29 
                                Private f32* %31 = OpAccessChain %23 %25 
                                                     OpStore %31 %30 
                                Private f32* %34 = OpAccessChain %9 %33 
                                         f32 %35 = OpLoad %34 
                                  Input f32* %39 = OpAccessChain %37 %33 
                                         f32 %40 = OpLoad %39 
                                         f32 %41 = OpFMul %35 %40 
                                         f32 %43 = OpFAdd %41 %42 
                                                     OpStore %32 %43 
                                         f32 %47 = OpLoad %32 
                                        bool %49 = OpFOrdLessThan %47 %48 
                                                     OpStore %46 %49 
                                        bool %50 = OpLoad %46 
                                         i32 %54 = OpSelect %50 %53 %52 
                                         i32 %56 = OpIMul %54 %55 
                                        bool %57 = OpINotEqual %56 %52 
                                                     OpSelectionMerge %59 None 
                                                     OpBranchConditional %57 %58 %59 
                                             %58 = OpLabel 
                                                     OpKill
                                             %59 = OpLabel 
                                Private f32* %61 = OpAccessChain %23 %25 
                                         f32 %62 = OpLoad %61 
                                Private f32* %63 = OpAccessChain %23 %25 
                                         f32 %64 = OpLoad %63 
                                         f32 %65 = OpFNegate %64 
                                        bool %66 = OpFOrdGreaterThanEqual %62 %65 
                                                     OpStore %46 %66 
                                Private f32* %67 = OpAccessChain %23 %25 
                                         f32 %68 = OpLoad %67 
                                         f32 %69 = OpExtInst %1 4 %68 
                                         f32 %70 = OpExtInst %1 10 %69 
                                                     OpStore %32 %70 
                                Private f32* %71 = OpAccessChain %23 %25 
                                         f32 %72 = OpLoad %71 
                                         f32 %73 = OpExtInst %1 8 %72 
                                Private f32* %74 = OpAccessChain %23 %25 
                                                     OpStore %74 %73 
                                Private f32* %78 = OpAccessChain %23 %25 
                                         f32 %79 = OpLoad %78 
                                         f32 %81 = OpFMul %79 %80 
                                         f32 %83 = OpFAdd %81 %82 
                                Private f32* %84 = OpAccessChain %77 %25 
                                                     OpStore %84 %83 
                                        bool %87 = OpLoad %46 
                                                     OpSelectionMerge %89 None 
                                                     OpBranchConditional %87 %88 %91 
                                             %88 = OpLabel 
                                         f32 %90 = OpLoad %32 
                                                     OpStore %86 %90 
                                                     OpBranch %89 
                                             %91 = OpLabel 
                                         f32 %92 = OpLoad %32 
                                         f32 %93 = OpFNegate %92 
                                                     OpStore %86 %93 
                                                     OpBranch %89 
                                             %89 = OpLabel 
                                         f32 %94 = OpLoad %86 
                                Private f32* %95 = OpAccessChain %23 %25 
                                                     OpStore %95 %94 
                                Private f32* %96 = OpAccessChain %23 %25 
                                         f32 %97 = OpLoad %96 
                                         f32 %98 = OpFAdd %97 %82 
                               Private f32* %100 = OpAccessChain %77 %99 
                                                     OpStore %100 %98 
                 read_only Texture2DSampled %102 = OpLoad %101 
                                      f32_3 %103 = OpLoad %77 
                                      f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                      f32_4 %105 = OpImageSampleImplicitLod %102 %104 
                                      f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                      f32_4 %107 = OpLoad %9 
                                      f32_4 %108 = OpVectorShuffle %107 %106 4 5 6 3 
                                                     OpStore %9 %108 
                               Private f32* %109 = OpAccessChain %9 %99 
                                        f32 %110 = OpLoad %109 
                               Private f32* %112 = OpAccessChain %9 %111 
                                        f32 %113 = OpLoad %112 
                                       bool %114 = OpFOrdGreaterThanEqual %110 %113 
                                                     OpStore %46 %114 
                                       bool %117 = OpLoad %46 
                                                     OpSelectionMerge %119 None 
                                                     OpBranchConditional %117 %118 %121 
                                            %118 = OpLabel 
                                                     OpStore %116 %120 
                                                     OpBranch %119 
                                            %121 = OpLabel 
                                                     OpStore %116 %48 
                                                     OpBranch %119 
                                            %119 = OpLabel 
                                        f32 %122 = OpLoad %116 
                               Private f32* %123 = OpAccessChain %115 %25 
                                                     OpStore %123 %122 
                                      f32_4 %126 = OpLoad %9 
                                      f32_2 %127 = OpVectorShuffle %126 %126 2 1 
                                      f32_2 %128 = OpFNegate %127 
                                      f32_4 %129 = OpLoad %9 
                                      f32_2 %130 = OpVectorShuffle %129 %129 1 2 
                                      f32_2 %131 = OpFAdd %128 %130 
                                                     OpStore %125 %131 
                                      f32_3 %132 = OpLoad %115 
                                      f32_2 %133 = OpVectorShuffle %132 %132 0 0 
                                      f32_2 %134 = OpLoad %125 
                                      f32_2 %135 = OpFMul %133 %134 
                                      f32_4 %136 = OpLoad %9 
                                      f32_2 %137 = OpVectorShuffle %136 %136 2 1 
                                      f32_2 %138 = OpFAdd %135 %137 
                                      f32_3 %139 = OpLoad %115 
                                      f32_3 %140 = OpVectorShuffle %139 %138 3 4 2 
                                                     OpStore %115 %140 
                               Private f32* %142 = OpAccessChain %9 %25 
                                        f32 %143 = OpLoad %142 
                               Private f32* %144 = OpAccessChain %115 %25 
                                        f32 %145 = OpLoad %144 
                                       bool %146 = OpFOrdGreaterThanEqual %143 %145 
                                                     OpStore %141 %146 
                                       bool %149 = OpLoad %141 
                                                     OpSelectionMerge %151 None 
                                                     OpBranchConditional %149 %150 %152 
                                            %150 = OpLabel 
                                                     OpStore %148 %120 
                                                     OpBranch %151 
                                            %152 = OpLabel 
                                                     OpStore %148 %48 
                                                     OpBranch %151 
                                            %151 = OpLabel 
                                        f32 %153 = OpLoad %148 
                                                     OpStore %147 %153 
                               Private f32* %154 = OpAccessChain %9 %25 
                                        f32 %155 = OpLoad %154 
                               Private f32* %156 = OpAccessChain %115 %111 
                                                     OpStore %156 %155 
                                      f32_3 %158 = OpLoad %115 
                                      f32_3 %159 = OpFNegate %158 
                                      f32_3 %160 = OpLoad %115 
                                      f32_3 %161 = OpVectorShuffle %160 %160 2 1 0 
                                      f32_3 %162 = OpFAdd %159 %161 
                                      f32_4 %163 = OpLoad %157 
                                      f32_4 %164 = OpVectorShuffle %163 %162 4 5 6 3 
                                                     OpStore %157 %164 
                                        f32 %165 = OpLoad %147 
                                      f32_3 %166 = OpCompositeConstruct %165 %165 %165 
                                      f32_4 %167 = OpLoad %157 
                                      f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                      f32_3 %169 = OpFMul %166 %168 
                                      f32_3 %170 = OpLoad %115 
                                      f32_3 %171 = OpFAdd %169 %170 
                                                     OpStore %115 %171 
                               Private f32* %172 = OpAccessChain %115 %99 
                                        f32 %173 = OpLoad %172 
                               Private f32* %174 = OpAccessChain %115 %111 
                                        f32 %175 = OpLoad %174 
                                        f32 %176 = OpExtInst %1 37 %173 %175 
                               Private f32* %177 = OpAccessChain %125 %25 
                                                     OpStore %177 %176 
                               Private f32* %178 = OpAccessChain %125 %25 
                                        f32 %179 = OpLoad %178 
                                        f32 %180 = OpFNegate %179 
                               Private f32* %181 = OpAccessChain %115 %25 
                                        f32 %182 = OpLoad %181 
                                        f32 %183 = OpFAdd %180 %182 
                               Private f32* %184 = OpAccessChain %125 %25 
                                                     OpStore %184 %183 
                               Private f32* %186 = OpAccessChain %115 %25 
                                        f32 %187 = OpLoad %186 
                                        f32 %189 = OpFAdd %187 %188 
                               Private f32* %190 = OpAccessChain %185 %25 
                                                     OpStore %190 %189 
                               Private f32* %191 = OpAccessChain %125 %25 
                                        f32 %192 = OpLoad %191 
                               Private f32* %193 = OpAccessChain %185 %25 
                                        f32 %194 = OpLoad %193 
                                        f32 %195 = OpFDiv %192 %194 
                               Private f32* %196 = OpAccessChain %125 %25 
                                                     OpStore %196 %195 
                                      f32_4 %197 = OpLoad %9 
                                      f32_4 %198 = OpLoad %37 
                                      f32_4 %199 = OpFMul %197 %198 
                                                     OpStore %23 %199 
                                      f32_4 %200 = OpLoad %9 
                                      f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                                      f32_3 %202 = OpFNegate %201 
                                      f32_4 %203 = OpLoad %37 
                                      f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                      f32_3 %205 = OpFMul %202 %204 
                             Uniform f32_4* %210 = OpAccessChain %208 %52 
                                      f32_4 %211 = OpLoad %210 
                                      f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                                      f32_3 %213 = OpFAdd %205 %212 
                                                     OpStore %77 %213 
                             Uniform f32_4* %214 = OpAccessChain %208 %52 
                                      f32_4 %215 = OpLoad %214 
                                      f32_3 %216 = OpVectorShuffle %215 %215 3 3 3 
                                      f32_3 %217 = OpLoad %77 
                                      f32_3 %218 = OpFMul %216 %217 
                                      f32_4 %219 = OpLoad %23 
                                      f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                                      f32_3 %221 = OpFAdd %218 %220 
                                      f32_4 %222 = OpLoad %23 
                                      f32_4 %223 = OpVectorShuffle %222 %221 4 5 6 3 
                                                     OpStore %23 %223 
                               Private f32* %226 = OpAccessChain %23 %33 
                                        f32 %227 = OpLoad %226 
                                Output f32* %229 = OpAccessChain %225 %33 
                                                     OpStore %229 %227 
                               Private f32* %230 = OpAccessChain %23 %25 
                                        f32 %231 = OpLoad %230 
                                        f32 %232 = OpFNegate %231 
                               Private f32* %233 = OpAccessChain %9 %33 
                                                     OpStore %233 %232 
                                      f32_4 %235 = OpLoad %23 
                                      f32_2 %236 = OpVectorShuffle %235 %235 2 1 
                                      f32_2 %237 = OpFNegate %236 
                                      f32_4 %238 = OpLoad %23 
                                      f32_2 %239 = OpVectorShuffle %238 %238 1 2 
                                      f32_2 %240 = OpFAdd %237 %239 
                                                     OpStore %234 %240 
                               Private f32* %242 = OpAccessChain %23 %99 
                                        f32 %243 = OpLoad %242 
                               Private f32* %244 = OpAccessChain %23 %111 
                                        f32 %245 = OpLoad %244 
                                       bool %246 = OpFOrdGreaterThanEqual %243 %245 
                                                     OpStore %241 %246 
                                       bool %248 = OpLoad %241 
                                                     OpSelectionMerge %250 None 
                                                     OpBranchConditional %248 %249 %251 
                                            %249 = OpLabel 
                                                     OpStore %247 %120 
                                                     OpBranch %250 
                                            %251 = OpLabel 
                                                     OpStore %247 %48 
                                                     OpBranch %250 
                                            %250 = OpLabel 
                                        f32 %252 = OpLoad %247 
                               Private f32* %253 = OpAccessChain %157 %25 
                                                     OpStore %253 %252 
                                      f32_4 %255 = OpLoad %157 
                                      f32_2 %256 = OpVectorShuffle %255 %255 0 0 
                                      f32_2 %257 = OpLoad %234 
                                      f32_2 %258 = OpFMul %256 %257 
                                      f32_4 %259 = OpLoad %23 
                                      f32_2 %260 = OpVectorShuffle %259 %259 2 1 
                                      f32_2 %261 = OpFAdd %258 %260 
                                      f32_4 %262 = OpLoad %254 
                                      f32_4 %263 = OpVectorShuffle %262 %261 4 5 2 3 
                                                     OpStore %254 %263 
                               Private f32* %264 = OpAccessChain %185 %25 
                                                     OpStore %264 %120 
                               Private f32* %266 = OpAccessChain %185 %99 
                                                     OpStore %266 %265 
                                      f32_4 %267 = OpLoad %157 
                                      f32_2 %268 = OpVectorShuffle %267 %267 0 0 
                                      f32_2 %269 = OpLoad %185 
                                      f32_2 %270 = OpFMul %268 %269 
                                      f32_2 %273 = OpFAdd %270 %272 
                                      f32_4 %274 = OpLoad %254 
                                      f32_4 %275 = OpVectorShuffle %274 %273 0 1 4 5 
                                                     OpStore %254 %275 
                                      f32_4 %276 = OpLoad %254 
                                      f32_3 %277 = OpVectorShuffle %276 %276 0 1 3 
                                      f32_3 %278 = OpFNegate %277 
                                      f32_4 %279 = OpLoad %9 
                                      f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
                                                     OpStore %9 %280 
                                      f32_4 %281 = OpLoad %9 
                                      f32_3 %282 = OpVectorShuffle %281 %281 1 2 3 
                                      f32_4 %283 = OpLoad %254 
                                      f32_3 %284 = OpVectorShuffle %283 %283 1 2 0 
                                      f32_3 %285 = OpFAdd %282 %284 
                                      f32_4 %286 = OpLoad %157 
                                      f32_4 %287 = OpVectorShuffle %286 %285 0 4 5 6 
                                                     OpStore %157 %287 
                               Private f32* %288 = OpAccessChain %9 %25 
                                        f32 %289 = OpLoad %288 
                               Private f32* %290 = OpAccessChain %23 %25 
                                        f32 %291 = OpLoad %290 
                                        f32 %292 = OpFAdd %289 %291 
                               Private f32* %293 = OpAccessChain %157 %25 
                                                     OpStore %293 %292 
                               Private f32* %295 = OpAccessChain %23 %25 
                                        f32 %296 = OpLoad %295 
                               Private f32* %297 = OpAccessChain %254 %25 
                                        f32 %298 = OpLoad %297 
                                       bool %299 = OpFOrdGreaterThanEqual %296 %298 
                                                     OpStore %294 %299 
                                       bool %301 = OpLoad %294 
                                                     OpSelectionMerge %303 None 
                                                     OpBranchConditional %301 %302 %304 
                                            %302 = OpLabel 
                                                     OpStore %300 %120 
                                                     OpBranch %303 
                                            %304 = OpLabel 
                                                     OpStore %300 %48 
                                                     OpBranch %303 
                                            %303 = OpLabel 
                                        f32 %305 = OpLoad %300 
                               Private f32* %306 = OpAccessChain %9 %25 
                                                     OpStore %306 %305 
                                      f32_4 %308 = OpLoad %9 
                                      f32_3 %309 = OpVectorShuffle %308 %308 0 0 0 
                                      f32_4 %310 = OpLoad %157 
                                      f32_3 %311 = OpVectorShuffle %310 %310 0 1 2 
                                      f32_3 %312 = OpFMul %309 %311 
                                      f32_4 %313 = OpLoad %254 
                                      f32_3 %314 = OpVectorShuffle %313 %313 0 1 3 
                                      f32_3 %315 = OpFAdd %312 %314 
                                                     OpStore %307 %315 
                               Private f32* %316 = OpAccessChain %9 %25 
                                        f32 %317 = OpLoad %316 
                               Private f32* %318 = OpAccessChain %157 %33 
                                        f32 %319 = OpLoad %318 
                                        f32 %320 = OpFMul %317 %319 
                               Private f32* %321 = OpAccessChain %23 %25 
                                        f32 %322 = OpLoad %321 
                                        f32 %323 = OpFAdd %320 %322 
                               Private f32* %324 = OpAccessChain %9 %25 
                                                     OpStore %324 %323 
                               Private f32* %325 = OpAccessChain %307 %99 
                                        f32 %326 = OpLoad %325 
                               Private f32* %327 = OpAccessChain %9 %25 
                                        f32 %328 = OpLoad %327 
                                        f32 %329 = OpExtInst %1 37 %326 %328 
                               Private f32* %330 = OpAccessChain %185 %25 
                                                     OpStore %330 %329 
                               Private f32* %331 = OpAccessChain %307 %99 
                                        f32 %332 = OpLoad %331 
                                        f32 %333 = OpFNegate %332 
                               Private f32* %334 = OpAccessChain %9 %25 
                                        f32 %335 = OpLoad %334 
                                        f32 %336 = OpFAdd %333 %335 
                               Private f32* %337 = OpAccessChain %9 %25 
                                                     OpStore %337 %336 
                               Private f32* %338 = OpAccessChain %307 %25 
                                        f32 %339 = OpLoad %338 
                               Private f32* %340 = OpAccessChain %185 %25 
                                        f32 %341 = OpLoad %340 
                                        f32 %342 = OpFNegate %341 
                                        f32 %343 = OpFAdd %339 %342 
                               Private f32* %344 = OpAccessChain %307 %25 
                                                     OpStore %344 %343 
                               Private f32* %345 = OpAccessChain %307 %25 
                                        f32 %346 = OpLoad %345 
                                        f32 %348 = OpFMul %346 %347 
                                        f32 %349 = OpFAdd %348 %188 
                               Private f32* %350 = OpAccessChain %307 %25 
                                                     OpStore %350 %349 
                               Private f32* %351 = OpAccessChain %9 %25 
                                        f32 %352 = OpLoad %351 
                               Private f32* %353 = OpAccessChain %307 %25 
                                        f32 %354 = OpLoad %353 
                                        f32 %355 = OpFDiv %352 %354 
                               Private f32* %356 = OpAccessChain %9 %25 
                                                     OpStore %356 %355 
                               Private f32* %357 = OpAccessChain %9 %25 
                                        f32 %358 = OpLoad %357 
                               Private f32* %359 = OpAccessChain %307 %111 
                                        f32 %360 = OpLoad %359 
                                        f32 %361 = OpFAdd %358 %360 
                               Private f32* %362 = OpAccessChain %9 %25 
                                                     OpStore %362 %361 
                                      f32_4 %363 = OpLoad %9 
                                      f32_3 %364 = OpVectorShuffle %363 %363 0 0 0 
                                      f32_3 %365 = OpExtInst %1 4 %364 
                                      f32_3 %368 = OpFAdd %365 %367 
                                      f32_4 %369 = OpLoad %9 
                                      f32_4 %370 = OpVectorShuffle %369 %368 4 5 6 3 
                                                     OpStore %9 %370 
                                      f32_4 %371 = OpLoad %9 
                                      f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                                      f32_3 %373 = OpExtInst %1 10 %372 
                                      f32_4 %374 = OpLoad %9 
                                      f32_4 %375 = OpVectorShuffle %374 %373 4 5 6 3 
                                                     OpStore %9 %375 
                                      f32_4 %376 = OpLoad %9 
                                      f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                                      f32_3 %379 = OpFMul %377 %378 
                                      f32_3 %382 = OpFAdd %379 %381 
                                      f32_4 %383 = OpLoad %9 
                                      f32_4 %384 = OpVectorShuffle %383 %382 4 5 6 3 
                                                     OpStore %9 %384 
                                      f32_4 %385 = OpLoad %9 
                                      f32_3 %386 = OpVectorShuffle %385 %385 0 1 2 
                                      f32_3 %387 = OpExtInst %1 4 %386 
                                      f32_3 %389 = OpFAdd %387 %388 
                                      f32_4 %390 = OpLoad %9 
                                      f32_4 %391 = OpVectorShuffle %390 %389 4 5 6 3 
                                                     OpStore %9 %391 
                                      f32_4 %392 = OpLoad %9 
                                      f32_3 %393 = OpVectorShuffle %392 %392 0 1 2 
                                      f32_3 %394 = OpCompositeConstruct %48 %48 %48 
                                      f32_3 %395 = OpCompositeConstruct %120 %120 %120 
                                      f32_3 %396 = OpExtInst %1 43 %393 %394 %395 
                                      f32_4 %397 = OpLoad %9 
                                      f32_4 %398 = OpVectorShuffle %397 %396 4 5 6 3 
                                                     OpStore %9 %398 
                                      f32_4 %399 = OpLoad %9 
                                      f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
                                      f32_3 %401 = OpFAdd %400 %388 
                                      f32_4 %402 = OpLoad %9 
                                      f32_4 %403 = OpVectorShuffle %402 %401 4 5 6 3 
                                                     OpStore %9 %403 
                                      f32_2 %404 = OpLoad %125 
                                      f32_3 %405 = OpVectorShuffle %404 %404 0 0 0 
                                      f32_4 %406 = OpLoad %9 
                                      f32_3 %407 = OpVectorShuffle %406 %406 0 1 2 
                                      f32_3 %408 = OpFMul %405 %407 
                                      f32_3 %410 = OpFAdd %408 %409 
                                      f32_4 %411 = OpLoad %9 
                                      f32_4 %412 = OpVectorShuffle %411 %410 4 5 6 3 
                                                     OpStore %9 %412 
                                      f32_4 %413 = OpLoad %9 
                                      f32_3 %414 = OpVectorShuffle %413 %413 0 1 2 
                                      f32_3 %415 = OpLoad %115 
                                      f32_3 %416 = OpVectorShuffle %415 %415 0 0 0 
                                      f32_3 %417 = OpFMul %414 %416 
                                      f32_4 %418 = OpLoad %9 
                                      f32_4 %419 = OpVectorShuffle %418 %417 4 5 6 3 
                                                     OpStore %9 %419 
                                      f32_4 %420 = OpLoad %9 
                                      f32_3 %421 = OpVectorShuffle %420 %420 0 1 2 
                                      f32_4 %422 = OpLoad %225 
                                      f32_4 %423 = OpVectorShuffle %422 %421 4 5 6 3 
                                                     OpStore %225 %423 
                                                     OpReturn
                                                     OpFunctionEnd
"
}
}
Program "fp" {
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
}
}
}
}