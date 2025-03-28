//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/StarNest_Derivative" {
Properties {
_Iterations ("Iterations", Float) = 17
_FormUParam ("Form U Param", Float) = 0.53
_VolSteps ("Vol Steps", Float) = 20
_StepSize ("Step Size", Float) = 0.1
_Zoom ("Zoom", Float) = 0.8
_Tile ("Tile", Float) = 0.85
_Speed ("Speed", Float) = 0.01
_PositionX ("Position X", Float) = 0
_PositionY ("Position Y", Float) = 0
_Brightness ("Brightness", Float) = 0.0015
_DistFading ("Dist Fading", Float) = 0.73
_Saturation ("Saturation", Float) = 0.85
_Gain ("Gain", Float) = 0
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 18918
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
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	float _Iterations;
uniform 	float _FormUParam;
uniform 	float _VolSteps;
uniform 	float _StepSize;
uniform 	float _Zoom;
uniform 	float _Tile;
uniform 	float _Speed;
uniform 	float _PositionX;
uniform 	float _PositionY;
uniform 	float _Brightness;
uniform 	float _DistFading;
uniform 	float _Saturation;
uniform 	float _Gain;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
bvec3 u_xlatb5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat13;
float u_xlat14;
float u_xlat21;
float u_xlat22;
int u_xlati23;
float u_xlat24;
float u_xlat25;
int u_xlati26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_Zoom);
    u_xlat14 = _Time.y * _Speed + 0.25;
    u_xlat1.x = u_xlat14 * 2.0 + _PositionX;
    u_xlat1.y = u_xlat14 + _PositionY;
    u_xlat1.z = -2.0;
    u_xlat1.xyz = u_xlat1.xyz + vec3(1.0, 0.5, 0.5);
    u_xlat14 = _Tile + _Tile;
    u_xlat21 = 0.100000001;
    u_xlat22 = 1.0;
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlati23 = int(0);
    while(true){
        u_xlat3.x = float(u_xlati23);
        u_xlatb3 = u_xlat3.x>=_VolSteps;
        if(u_xlatb3){break;}
        u_xlat3.yz = u_xlat0.xy * vec2(u_xlat21);
        u_xlat3.x = u_xlat21;
        u_xlat4.xyz = u_xlat3.yzx * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
        u_xlat5.xyz = vec3(u_xlat14) * u_xlat4.xyz;
        u_xlatb5.xyz = greaterThanEqual(u_xlat5.xyzx, (-u_xlat5.xyzx)).xyz;
        u_xlat5.x = (u_xlatb5.x) ? float(u_xlat14) : (-float(u_xlat14));
        u_xlat5.y = (u_xlatb5.y) ? float(u_xlat14) : (-float(u_xlat14));
        u_xlat5.z = (u_xlatb5.z) ? float(u_xlat14) : (-float(u_xlat14));
        u_xlat6.xyz = vec3(1.0, 1.0, 1.0) / u_xlat5.xyz;
        u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz;
        u_xlat4.xyz = fract(u_xlat4.xyz);
        u_xlat4.xyz = (-u_xlat5.xyz) * u_xlat4.xyz + vec3(vec3(_Tile, _Tile, _Tile));
        u_xlat5.xyz = abs(u_xlat4.xyz);
        u_xlat24 = 0.0;
        u_xlat25 = 0.0;
        u_xlati26 = 0;
        while(true){
            u_xlat6.x = float(u_xlati26);
            u_xlatb6 = u_xlat6.x>=_Iterations;
            if(u_xlatb6){break;}
            u_xlat6.x = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat6.xyz = abs(u_xlat5.xyz) / u_xlat6.xxx;
            u_xlat5.xyz = u_xlat6.xyz + (-vec3(vec3(_FormUParam, _FormUParam, _FormUParam)));
            u_xlat6.x = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat6.x = sqrt(u_xlat6.x);
            u_xlat13 = (-u_xlat24) + u_xlat6.x;
            u_xlat25 = u_xlat25 + abs(u_xlat13);
            u_xlati26 = u_xlati26 + 1;
            u_xlat24 = u_xlat6.x;
        }
        u_xlat24 = u_xlat25 * u_xlat25;
        u_xlat24 = u_xlat24 * u_xlat25;
        u_xlat4.xyz = vec3(u_xlat22) + u_xlat2.xyz;
        u_xlat3.y = u_xlat21 * u_xlat21;
        u_xlat3.z = u_xlat3.y * u_xlat3.y;
        u_xlat3.xyz = vec3(u_xlat24) * u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
        u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat22) + u_xlat4.xyz;
        u_xlat22 = u_xlat22 * _DistFading;
        u_xlat21 = u_xlat21 + _StepSize;
        u_xlati23 = u_xlati23 + 1;
    }
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.z = sqrt(u_xlat0.x);
    u_xlat0.x = float(0.0);
    u_xlat0.y = float(0.0);
    u_xlat1.xyz = (-u_xlat0.yyz) + u_xlat2.xyz;
    u_xlat0.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + vec3(_Gain);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %78 
                                              OpDecorate %9 Location 9 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %17 Location 17 
                                              OpDecorate %22 ArrayStride 22 
                                              OpDecorate %23 ArrayStride 23 
                                              OpMemberDecorate %24 0 Offset 24 
                                              OpMemberDecorate %24 1 Offset 24 
                                              OpDecorate %24 Block 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %76 0 BuiltIn 76 
                                              OpMemberDecorate %76 1 BuiltIn 76 
                                              OpMemberDecorate %76 2 BuiltIn 76 
                                              OpDecorate %76 Block 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Output %7 
                         Output f32_2* %9 = OpVariable Output 
                                      %10 = OpTypePointer Input %7 
                         Input f32_2* %11 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypePointer Private %13 
                       Private f32_4* %15 = OpVariable Private 
                                      %16 = OpTypePointer Input %13 
                         Input f32_4* %17 = OpVariable Input 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 4 
                                      %22 = OpTypeArray %13 %21 
                                      %23 = OpTypeArray %13 %21 
                                      %24 = OpTypeStruct %22 %23 
                                      %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                      %27 = OpTypeInt 32 1 
                                  i32 %28 = OpConstant 0 
                                  i32 %29 = OpConstant 1 
                                      %30 = OpTypePointer Uniform %13 
                                  i32 %41 = OpConstant 2 
                                  i32 %50 = OpConstant 3 
                       Private f32_4* %54 = OpVariable Private 
                                  u32 %74 = OpConstant 1 
                                      %75 = OpTypeArray %6 %74 
                                      %76 = OpTypeStruct %13 %6 %75 
                                      %77 = OpTypePointer Output %76 
 Output struct {f32_4; f32; f32[1];}* %78 = OpVariable Output 
                                      %86 = OpTypePointer Output %13 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %12 = OpLoad %11 
                                              OpStore %9 %12 
                                f32_4 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
                                f32_4 %32 = OpLoad %31 
                                f32_4 %33 = OpFMul %19 %32 
                                              OpStore %15 %33 
                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
                                f32_4 %35 = OpLoad %34 
                                f32_4 %36 = OpLoad %17 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                f32_4 %38 = OpFMul %35 %37 
                                f32_4 %39 = OpLoad %15 
                                f32_4 %40 = OpFAdd %38 %39 
                                              OpStore %15 %40 
                       Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                f32_4 %43 = OpLoad %42 
                                f32_4 %44 = OpLoad %17 
                                f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                f32_4 %46 = OpFMul %43 %45 
                                f32_4 %47 = OpLoad %15 
                                f32_4 %48 = OpFAdd %46 %47 
                                              OpStore %15 %48 
                                f32_4 %49 = OpLoad %15 
                       Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFAdd %49 %52 
                                              OpStore %15 %53 
                                f32_4 %55 = OpLoad %15 
                                f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                       Uniform f32_4* %57 = OpAccessChain %26 %29 %29 
                                f32_4 %58 = OpLoad %57 
                                f32_4 %59 = OpFMul %56 %58 
                                              OpStore %54 %59 
                       Uniform f32_4* %60 = OpAccessChain %26 %29 %28 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpLoad %15 
                                f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                f32_4 %64 = OpFMul %61 %63 
                                f32_4 %65 = OpLoad %54 
                                f32_4 %66 = OpFAdd %64 %65 
                                              OpStore %54 %66 
                       Uniform f32_4* %67 = OpAccessChain %26 %29 %41 
                                f32_4 %68 = OpLoad %67 
                                f32_4 %69 = OpLoad %15 
                                f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %54 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %54 %73 
                       Uniform f32_4* %79 = OpAccessChain %26 %29 %50 
                                f32_4 %80 = OpLoad %79 
                                f32_4 %81 = OpLoad %15 
                                f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
                                f32_4 %83 = OpFMul %80 %82 
                                f32_4 %84 = OpLoad %54 
                                f32_4 %85 = OpFAdd %83 %84 
                        Output f32_4* %87 = OpAccessChain %78 %28 
                                              OpStore %87 %85 
                          Output f32* %89 = OpAccessChain %78 %28 %74 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %78 %28 %74 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 369
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %361 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpMemberDecorate %15 12 Offset 15 
                                                      OpMemberDecorate %15 13 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %361 Location 361 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_2* %12 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeStruct %14 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 5 
                                              %20 = OpTypePointer Uniform %6 
                                              %27 = OpTypePointer Private %6 
                                 Private f32* %28 = OpVariable Private 
                                          i32 %29 = OpConstant 0 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 1 
                                          i32 %34 = OpConstant 7 
                                          f32 %38 = OpConstant 3.67402E-40 
                               Private f32_3* %40 = OpVariable Private 
                                          f32 %42 = OpConstant 3.67402E-40 
                                          i32 %44 = OpConstant 8 
                                          u32 %48 = OpConstant 0 
                                          i32 %51 = OpConstant 9 
                                          f32 %56 = OpConstant 3.67402E-40 
                                          u32 %57 = OpConstant 2 
                                          f32 %60 = OpConstant 3.67402E-40 
                                          f32 %61 = OpConstant 3.67402E-40 
                                        f32_3 %62 = OpConstantComposite %60 %61 %61 
                                          i32 %64 = OpConstant 6 
                                 Private f32* %70 = OpVariable Private 
                                          f32 %71 = OpConstant 3.67402E-40 
                                 Private f32* %72 = OpVariable Private 
                               Private f32_3* %73 = OpVariable Private 
                                          f32 %74 = OpConstant 3.67402E-40 
                                              %78 = OpTypePointer Private %18 
                                 Private i32* %79 = OpVariable Private 
                                              %85 = OpTypeBool 
                                         bool %86 = OpConstantTrue 
                               Private f32_3* %87 = OpVariable Private 
                                              %91 = OpTypePointer Private %85 
                                Private bool* %92 = OpVariable Private 
                                          i32 %95 = OpConstant 3 
                              Private f32_3* %112 = OpVariable Private 
                                       f32_3 %115 = OpConstantComposite %61 %61 %61 
                              Private f32_3* %119 = OpVariable Private 
                                             %124 = OpTypeVector %85 3 
                                             %125 = OpTypePointer Private %124 
                             Private bool_3* %126 = OpVariable Private 
                                             %132 = OpTypeVector %85 4 
                                             %135 = OpTypePointer Function %6 
                              Private f32_3* %169 = OpVariable Private 
                                       f32_3 %170 = OpConstantComposite %60 %60 %60 
                                Private f32* %196 = OpVariable Private 
                                Private f32* %197 = OpVariable Private 
                                Private i32* %198 = OpVariable Private 
                               Private bool* %207 = OpVariable Private 
                                         i32 %210 = OpConstant 1 
                                         i32 %228 = OpConstant 2 
                                Private f32* %250 = OpVariable Private 
                                         i32 %289 = OpConstant 10 
                                         i32 %309 = OpConstant 11 
                                         i32 %314 = OpConstant 4 
                                         i32 %335 = OpConstant 12 
                                         f32 %352 = OpConstant 3.67402E-40 
                                       f32_3 %353 = OpConstantComposite %352 %352 %352 
                                         i32 %355 = OpConstant 13 
                                             %360 = OpTypePointer Output %14 
                               Output f32_4* %361 = OpVariable Output 
                                         u32 %365 = OpConstant 3 
                                             %366 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %136 = OpVariable Function 
                               Function f32* %147 = OpVariable Function 
                               Function f32* %158 = OpVariable Function 
                                        f32_2 %13 = OpLoad %12 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                        f32_2 %23 = OpCompositeConstruct %22 %22 
                                        f32_2 %24 = OpFMul %13 %23 
                                        f32_3 %25 = OpLoad %9 
                                        f32_3 %26 = OpVectorShuffle %25 %24 3 4 2 
                                                      OpStore %9 %26 
                                 Uniform f32* %32 = OpAccessChain %17 %29 %31 
                                          f32 %33 = OpLoad %32 
                                 Uniform f32* %35 = OpAccessChain %17 %34 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpFMul %33 %36 
                                          f32 %39 = OpFAdd %37 %38 
                                                      OpStore %28 %39 
                                          f32 %41 = OpLoad %28 
                                          f32 %43 = OpFMul %41 %42 
                                 Uniform f32* %45 = OpAccessChain %17 %44 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFAdd %43 %46 
                                 Private f32* %49 = OpAccessChain %40 %48 
                                                      OpStore %49 %47 
                                          f32 %50 = OpLoad %28 
                                 Uniform f32* %52 = OpAccessChain %17 %51 
                                          f32 %53 = OpLoad %52 
                                          f32 %54 = OpFAdd %50 %53 
                                 Private f32* %55 = OpAccessChain %40 %31 
                                                      OpStore %55 %54 
                                 Private f32* %58 = OpAccessChain %40 %57 
                                                      OpStore %58 %56 
                                        f32_3 %59 = OpLoad %40 
                                        f32_3 %63 = OpFAdd %59 %62 
                                                      OpStore %40 %63 
                                 Uniform f32* %65 = OpAccessChain %17 %64 
                                          f32 %66 = OpLoad %65 
                                 Uniform f32* %67 = OpAccessChain %17 %64 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpFAdd %66 %68 
                                                      OpStore %28 %69 
                                                      OpStore %70 %71 
                                                      OpStore %72 %60 
                                 Private f32* %75 = OpAccessChain %73 %48 
                                                      OpStore %75 %74 
                                 Private f32* %76 = OpAccessChain %73 %31 
                                                      OpStore %76 %74 
                                 Private f32* %77 = OpAccessChain %73 %57 
                                                      OpStore %77 %74 
                                                      OpStore %79 %29 
                                                      OpBranch %80 
                                              %80 = OpLabel 
                                                      OpLoopMerge %82 %83 None 
                                                      OpBranch %84 
                                              %84 = OpLabel 
                                                      OpBranchConditional %86 %81 %82 
                                              %81 = OpLabel 
                                          i32 %88 = OpLoad %79 
                                          f32 %89 = OpConvertSToF %88 
                                 Private f32* %90 = OpAccessChain %87 %48 
                                                      OpStore %90 %89 
                                 Private f32* %93 = OpAccessChain %87 %48 
                                          f32 %94 = OpLoad %93 
                                 Uniform f32* %96 = OpAccessChain %17 %95 
                                          f32 %97 = OpLoad %96 
                                         bool %98 = OpFOrdGreaterThanEqual %94 %97 
                                                      OpStore %92 %98 
                                         bool %99 = OpLoad %92 
                                                      OpSelectionMerge %101 None 
                                                      OpBranchConditional %99 %100 %101 
                                             %100 = OpLabel 
                                                      OpBranch %82 
                                             %101 = OpLabel 
                                       f32_3 %103 = OpLoad %9 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                         f32 %105 = OpLoad %70 
                                       f32_2 %106 = OpCompositeConstruct %105 %105 
                                       f32_2 %107 = OpFMul %104 %106 
                                       f32_3 %108 = OpLoad %87 
                                       f32_3 %109 = OpVectorShuffle %108 %107 0 3 4 
                                                      OpStore %87 %109 
                                         f32 %110 = OpLoad %70 
                                Private f32* %111 = OpAccessChain %87 %48 
                                                      OpStore %111 %110 
                                       f32_3 %113 = OpLoad %87 
                                       f32_3 %114 = OpVectorShuffle %113 %113 1 2 0 
                                       f32_3 %116 = OpFMul %114 %115 
                                       f32_3 %117 = OpLoad %40 
                                       f32_3 %118 = OpFAdd %116 %117 
                                                      OpStore %112 %118 
                                         f32 %120 = OpLoad %28 
                                       f32_3 %121 = OpCompositeConstruct %120 %120 %120 
                                       f32_3 %122 = OpLoad %112 
                                       f32_3 %123 = OpFMul %121 %122 
                                                      OpStore %119 %123 
                                       f32_3 %127 = OpLoad %119 
                                       f32_4 %128 = OpVectorShuffle %127 %127 0 1 2 0 
                                       f32_3 %129 = OpLoad %119 
                                       f32_4 %130 = OpVectorShuffle %129 %129 0 1 2 0 
                                       f32_4 %131 = OpFNegate %130 
                                      bool_4 %133 = OpFOrdGreaterThanEqual %128 %131 
                                      bool_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                                      OpStore %126 %134 
                                      bool_3 %137 = OpLoad %126 
                                        bool %138 = OpCompositeExtract %137 0 
                                                      OpSelectionMerge %140 None 
                                                      OpBranchConditional %138 %139 %142 
                                             %139 = OpLabel 
                                         f32 %141 = OpLoad %28 
                                                      OpStore %136 %141 
                                                      OpBranch %140 
                                             %142 = OpLabel 
                                         f32 %143 = OpLoad %28 
                                         f32 %144 = OpFNegate %143 
                                                      OpStore %136 %144 
                                                      OpBranch %140 
                                             %140 = OpLabel 
                                         f32 %145 = OpLoad %136 
                                Private f32* %146 = OpAccessChain %119 %48 
                                                      OpStore %146 %145 
                                      bool_3 %148 = OpLoad %126 
                                        bool %149 = OpCompositeExtract %148 1 
                                                      OpSelectionMerge %151 None 
                                                      OpBranchConditional %149 %150 %153 
                                             %150 = OpLabel 
                                         f32 %152 = OpLoad %28 
                                                      OpStore %147 %152 
                                                      OpBranch %151 
                                             %153 = OpLabel 
                                         f32 %154 = OpLoad %28 
                                         f32 %155 = OpFNegate %154 
                                                      OpStore %147 %155 
                                                      OpBranch %151 
                                             %151 = OpLabel 
                                         f32 %156 = OpLoad %147 
                                Private f32* %157 = OpAccessChain %119 %31 
                                                      OpStore %157 %156 
                                      bool_3 %159 = OpLoad %126 
                                        bool %160 = OpCompositeExtract %159 2 
                                                      OpSelectionMerge %162 None 
                                                      OpBranchConditional %160 %161 %164 
                                             %161 = OpLabel 
                                         f32 %163 = OpLoad %28 
                                                      OpStore %158 %163 
                                                      OpBranch %162 
                                             %164 = OpLabel 
                                         f32 %165 = OpLoad %28 
                                         f32 %166 = OpFNegate %165 
                                                      OpStore %158 %166 
                                                      OpBranch %162 
                                             %162 = OpLabel 
                                         f32 %167 = OpLoad %158 
                                Private f32* %168 = OpAccessChain %119 %57 
                                                      OpStore %168 %167 
                                       f32_3 %171 = OpLoad %119 
                                       f32_3 %172 = OpFDiv %170 %171 
                                                      OpStore %169 %172 
                                       f32_3 %173 = OpLoad %112 
                                       f32_3 %174 = OpLoad %169 
                                       f32_3 %175 = OpFMul %173 %174 
                                                      OpStore %112 %175 
                                       f32_3 %176 = OpLoad %112 
                                       f32_3 %177 = OpExtInst %1 10 %176 
                                                      OpStore %112 %177 
                                       f32_3 %178 = OpLoad %119 
                                       f32_3 %179 = OpFNegate %178 
                                       f32_3 %180 = OpLoad %112 
                                       f32_3 %181 = OpFMul %179 %180 
                                Uniform f32* %182 = OpAccessChain %17 %64 
                                         f32 %183 = OpLoad %182 
                                Uniform f32* %184 = OpAccessChain %17 %64 
                                         f32 %185 = OpLoad %184 
                                Uniform f32* %186 = OpAccessChain %17 %64 
                                         f32 %187 = OpLoad %186 
                                       f32_3 %188 = OpCompositeConstruct %183 %185 %187 
                                         f32 %189 = OpCompositeExtract %188 0 
                                         f32 %190 = OpCompositeExtract %188 1 
                                         f32 %191 = OpCompositeExtract %188 2 
                                       f32_3 %192 = OpCompositeConstruct %189 %190 %191 
                                       f32_3 %193 = OpFAdd %181 %192 
                                                      OpStore %112 %193 
                                       f32_3 %194 = OpLoad %112 
                                       f32_3 %195 = OpExtInst %1 4 %194 
                                                      OpStore %119 %195 
                                                      OpStore %196 %74 
                                                      OpStore %197 %74 
                                                      OpStore %198 %29 
                                                      OpBranch %199 
                                             %199 = OpLabel 
                                                      OpLoopMerge %201 %202 None 
                                                      OpBranch %203 
                                             %203 = OpLabel 
                                                      OpBranchConditional %86 %200 %201 
                                             %200 = OpLabel 
                                         i32 %204 = OpLoad %198 
                                         f32 %205 = OpConvertSToF %204 
                                Private f32* %206 = OpAccessChain %169 %48 
                                                      OpStore %206 %205 
                                Private f32* %208 = OpAccessChain %169 %48 
                                         f32 %209 = OpLoad %208 
                                Uniform f32* %211 = OpAccessChain %17 %210 
                                         f32 %212 = OpLoad %211 
                                        bool %213 = OpFOrdGreaterThanEqual %209 %212 
                                                      OpStore %207 %213 
                                        bool %214 = OpLoad %207 
                                                      OpSelectionMerge %216 None 
                                                      OpBranchConditional %214 %215 %216 
                                             %215 = OpLabel 
                                                      OpBranch %201 
                                             %216 = OpLabel 
                                       f32_3 %218 = OpLoad %119 
                                       f32_3 %219 = OpLoad %119 
                                         f32 %220 = OpDot %218 %219 
                                Private f32* %221 = OpAccessChain %169 %48 
                                                      OpStore %221 %220 
                                       f32_3 %222 = OpLoad %119 
                                       f32_3 %223 = OpExtInst %1 4 %222 
                                       f32_3 %224 = OpLoad %169 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 0 0 
                                       f32_3 %226 = OpFDiv %223 %225 
                                                      OpStore %169 %226 
                                       f32_3 %227 = OpLoad %169 
                                Uniform f32* %229 = OpAccessChain %17 %228 
                                         f32 %230 = OpLoad %229 
                                Uniform f32* %231 = OpAccessChain %17 %228 
                                         f32 %232 = OpLoad %231 
                                Uniform f32* %233 = OpAccessChain %17 %228 
                                         f32 %234 = OpLoad %233 
                                       f32_3 %235 = OpCompositeConstruct %230 %232 %234 
                                         f32 %236 = OpCompositeExtract %235 0 
                                         f32 %237 = OpCompositeExtract %235 1 
                                         f32 %238 = OpCompositeExtract %235 2 
                                       f32_3 %239 = OpCompositeConstruct %236 %237 %238 
                                       f32_3 %240 = OpFNegate %239 
                                       f32_3 %241 = OpFAdd %227 %240 
                                                      OpStore %119 %241 
                                       f32_3 %242 = OpLoad %119 
                                       f32_3 %243 = OpLoad %119 
                                         f32 %244 = OpDot %242 %243 
                                Private f32* %245 = OpAccessChain %169 %48 
                                                      OpStore %245 %244 
                                Private f32* %246 = OpAccessChain %169 %48 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpExtInst %1 31 %247 
                                Private f32* %249 = OpAccessChain %169 %48 
                                                      OpStore %249 %248 
                                         f32 %251 = OpLoad %196 
                                         f32 %252 = OpFNegate %251 
                                Private f32* %253 = OpAccessChain %169 %48 
                                         f32 %254 = OpLoad %253 
                                         f32 %255 = OpFAdd %252 %254 
                                                      OpStore %250 %255 
                                         f32 %256 = OpLoad %197 
                                         f32 %257 = OpLoad %250 
                                         f32 %258 = OpExtInst %1 4 %257 
                                         f32 %259 = OpFAdd %256 %258 
                                                      OpStore %197 %259 
                                         i32 %260 = OpLoad %198 
                                         i32 %261 = OpIAdd %260 %210 
                                                      OpStore %198 %261 
                                Private f32* %262 = OpAccessChain %169 %48 
                                         f32 %263 = OpLoad %262 
                                                      OpStore %196 %263 
                                                      OpBranch %202 
                                             %202 = OpLabel 
                                                      OpBranch %199 
                                             %201 = OpLabel 
                                         f32 %264 = OpLoad %197 
                                         f32 %265 = OpLoad %197 
                                         f32 %266 = OpFMul %264 %265 
                                                      OpStore %196 %266 
                                         f32 %267 = OpLoad %196 
                                         f32 %268 = OpLoad %197 
                                         f32 %269 = OpFMul %267 %268 
                                                      OpStore %196 %269 
                                         f32 %270 = OpLoad %72 
                                       f32_3 %271 = OpCompositeConstruct %270 %270 %270 
                                       f32_3 %272 = OpLoad %73 
                                       f32_3 %273 = OpFAdd %271 %272 
                                                      OpStore %112 %273 
                                         f32 %274 = OpLoad %70 
                                         f32 %275 = OpLoad %70 
                                         f32 %276 = OpFMul %274 %275 
                                Private f32* %277 = OpAccessChain %87 %31 
                                                      OpStore %277 %276 
                                Private f32* %278 = OpAccessChain %87 %31 
                                         f32 %279 = OpLoad %278 
                                Private f32* %280 = OpAccessChain %87 %31 
                                         f32 %281 = OpLoad %280 
                                         f32 %282 = OpFMul %279 %281 
                                Private f32* %283 = OpAccessChain %87 %57 
                                                      OpStore %283 %282 
                                         f32 %284 = OpLoad %196 
                                       f32_3 %285 = OpCompositeConstruct %284 %284 %284 
                                       f32_3 %286 = OpLoad %87 
                                       f32_3 %287 = OpFMul %285 %286 
                                                      OpStore %87 %287 
                                       f32_3 %288 = OpLoad %87 
                                Uniform f32* %290 = OpAccessChain %17 %289 
                                         f32 %291 = OpLoad %290 
                                Uniform f32* %292 = OpAccessChain %17 %289 
                                         f32 %293 = OpLoad %292 
                                Uniform f32* %294 = OpAccessChain %17 %289 
                                         f32 %295 = OpLoad %294 
                                       f32_3 %296 = OpCompositeConstruct %291 %293 %295 
                                         f32 %297 = OpCompositeExtract %296 0 
                                         f32 %298 = OpCompositeExtract %296 1 
                                         f32 %299 = OpCompositeExtract %296 2 
                                       f32_3 %300 = OpCompositeConstruct %297 %298 %299 
                                       f32_3 %301 = OpFMul %288 %300 
                                                      OpStore %87 %301 
                                       f32_3 %302 = OpLoad %87 
                                         f32 %303 = OpLoad %72 
                                       f32_3 %304 = OpCompositeConstruct %303 %303 %303 
                                       f32_3 %305 = OpFMul %302 %304 
                                       f32_3 %306 = OpLoad %112 
                                       f32_3 %307 = OpFAdd %305 %306 
                                                      OpStore %73 %307 
                                         f32 %308 = OpLoad %72 
                                Uniform f32* %310 = OpAccessChain %17 %309 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFMul %308 %311 
                                                      OpStore %72 %312 
                                         f32 %313 = OpLoad %70 
                                Uniform f32* %315 = OpAccessChain %17 %314 
                                         f32 %316 = OpLoad %315 
                                         f32 %317 = OpFAdd %313 %316 
                                                      OpStore %70 %317 
                                         i32 %318 = OpLoad %79 
                                         i32 %319 = OpIAdd %318 %210 
                                                      OpStore %79 %319 
                                                      OpBranch %83 
                                              %83 = OpLabel 
                                                      OpBranch %80 
                                              %82 = OpLabel 
                                       f32_3 %320 = OpLoad %73 
                                       f32_3 %321 = OpLoad %73 
                                         f32 %322 = OpDot %320 %321 
                                Private f32* %323 = OpAccessChain %9 %48 
                                                      OpStore %323 %322 
                                Private f32* %324 = OpAccessChain %9 %48 
                                         f32 %325 = OpLoad %324 
                                         f32 %326 = OpExtInst %1 31 %325 
                                Private f32* %327 = OpAccessChain %9 %57 
                                                      OpStore %327 %326 
                                Private f32* %328 = OpAccessChain %9 %48 
                                                      OpStore %328 %74 
                                Private f32* %329 = OpAccessChain %9 %31 
                                                      OpStore %329 %74 
                                       f32_3 %330 = OpLoad %9 
                                       f32_3 %331 = OpVectorShuffle %330 %330 1 1 2 
                                       f32_3 %332 = OpFNegate %331 
                                       f32_3 %333 = OpLoad %73 
                                       f32_3 %334 = OpFAdd %332 %333 
                                                      OpStore %40 %334 
                                Uniform f32* %336 = OpAccessChain %17 %335 
                                         f32 %337 = OpLoad %336 
                                Uniform f32* %338 = OpAccessChain %17 %335 
                                         f32 %339 = OpLoad %338 
                                Uniform f32* %340 = OpAccessChain %17 %335 
                                         f32 %341 = OpLoad %340 
                                       f32_3 %342 = OpCompositeConstruct %337 %339 %341 
                                         f32 %343 = OpCompositeExtract %342 0 
                                         f32 %344 = OpCompositeExtract %342 1 
                                         f32 %345 = OpCompositeExtract %342 2 
                                       f32_3 %346 = OpCompositeConstruct %343 %344 %345 
                                       f32_3 %347 = OpLoad %40 
                                       f32_3 %348 = OpFMul %346 %347 
                                       f32_3 %349 = OpLoad %9 
                                       f32_3 %350 = OpFAdd %348 %349 
                                                      OpStore %9 %350 
                                       f32_3 %351 = OpLoad %9 
                                       f32_3 %354 = OpFMul %351 %353 
                                Uniform f32* %356 = OpAccessChain %17 %355 
                                         f32 %357 = OpLoad %356 
                                       f32_3 %358 = OpCompositeConstruct %357 %357 %357 
                                       f32_3 %359 = OpFAdd %354 %358 
                                                      OpStore %9 %359 
                                       f32_3 %362 = OpLoad %9 
                                       f32_4 %363 = OpLoad %361 
                                       f32_4 %364 = OpVectorShuffle %363 %362 4 5 6 3 
                                                      OpStore %361 %364 
                                 Output f32* %367 = OpAccessChain %361 %365 
                                                      OpStore %367 %60 
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
}