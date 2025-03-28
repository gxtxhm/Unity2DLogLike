//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Legacy Shaders/VertexLit" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_SpecColor ("Spec Color", Color) = (1,1,1,1)
_Emission ("Emissive Color", Color) = (0,0,0,0)
_Shininess ("Shininess", Range(0.01, 1)) = 0.7
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "Vertex" "RenderType" = "Opaque" }
  Fog {
   Mode Off
  }
  GpuProgramID 144514
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Emission;
uniform 	float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec3 vs_COLOR1;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat21;
float u_xlat22;
int u_xlati23;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat22 = _Shininess * 128.0;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat24 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat24 = max(u_xlat24, 0.0);
        u_xlat5.xyz = vec3(u_xlat24) * _Color.xyz;
        u_xlat5.xyz = u_xlat5.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb24 = 0.0<u_xlat24;
        if(u_xlatb24){
            u_xlat6.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat24 = inversesqrt(u_xlat24);
            u_xlat6.xyz = vec3(u_xlat24) * u_xlat6.xyz;
            u_xlat24 = dot(u_xlat1.xyz, u_xlat6.xyz);
            u_xlat24 = max(u_xlat24, 0.0);
            u_xlat24 = log2(u_xlat24);
            u_xlat24 = u_xlat22 * u_xlat24;
            u_xlat24 = exp2(u_xlat24);
            u_xlat24 = min(u_xlat24, 1.0);
            u_xlat24 = u_xlat24 * 0.5;
            u_xlat4.xyz = vec3(u_xlat24) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat5.xyz = min(u_xlat5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat3.xyz = u_xlat3.xyz + u_xlat5.xyz;
    }
    vs_COLOR1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat3.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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

uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec3 vs_COLOR1;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
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
; Bound: 616
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %303 %335 %507 %519 %541 %542 %600 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %22 0 RelaxedPrecision 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 RelaxedPrecision 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpMemberDecorate %22 7 Offset 22 
                                                      OpMemberDecorate %22 8 RelaxedPrecision 
                                                      OpMemberDecorate %22 8 Offset 22 
                                                      OpMemberDecorate %22 9 RelaxedPrecision 
                                                      OpMemberDecorate %22 9 Offset 22 
                                                      OpMemberDecorate %22 10 RelaxedPrecision 
                                                      OpMemberDecorate %22 10 Offset 22 
                                                      OpMemberDecorate %22 11 RelaxedPrecision 
                                                      OpMemberDecorate %22 11 Offset 22 
                                                      OpMemberDecorate %22 12 Offset 22 
                                                      OpMemberDecorate %22 13 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate %303 Location 303 
                                                      OpDecorate %335 Location 335 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %386 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %392 RelaxedPrecision 
                                                      OpDecorate %394 RelaxedPrecision 
                                                      OpDecorate %395 RelaxedPrecision 
                                                      OpDecorate %396 RelaxedPrecision 
                                                      OpDecorate %397 RelaxedPrecision 
                                                      OpDecorate %416 RelaxedPrecision 
                                                      OpDecorate %424 RelaxedPrecision 
                                                      OpDecorate %425 RelaxedPrecision 
                                                      OpDecorate %426 RelaxedPrecision 
                                                      OpDecorate %427 RelaxedPrecision 
                                                      OpDecorate %428 RelaxedPrecision 
                                                      OpDecorate %430 RelaxedPrecision 
                                                      OpDecorate %431 RelaxedPrecision 
                                                      OpDecorate %432 RelaxedPrecision 
                                                      OpDecorate %433 RelaxedPrecision 
                                                      OpDecorate %436 RelaxedPrecision 
                                                      OpDecorate %437 RelaxedPrecision 
                                                      OpDecorate %438 RelaxedPrecision 
                                                      OpDecorate %441 RelaxedPrecision 
                                                      OpDecorate %446 RelaxedPrecision 
                                                      OpDecorate %458 RelaxedPrecision 
                                                      OpDecorate %459 RelaxedPrecision 
                                                      OpDecorate %460 RelaxedPrecision 
                                                      OpDecorate %461 RelaxedPrecision 
                                                      OpDecorate %462 RelaxedPrecision 
                                                      OpDecorate %463 RelaxedPrecision 
                                                      OpDecorate %464 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %466 RelaxedPrecision 
                                                      OpDecorate %469 RelaxedPrecision 
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
                                                      OpDecorate %482 RelaxedPrecision 
                                                      OpDecorate %483 RelaxedPrecision 
                                                      OpDecorate %485 RelaxedPrecision 
                                                      OpDecorate %486 RelaxedPrecision 
                                                      OpDecorate %487 RelaxedPrecision 
                                                      OpDecorate %490 RelaxedPrecision 
                                                      OpDecorate %491 RelaxedPrecision 
                                                      OpDecorate %492 RelaxedPrecision 
                                                      OpDecorate %493 RelaxedPrecision 
                                                      OpDecorate %494 RelaxedPrecision 
                                                      OpDecorate %495 RelaxedPrecision 
                                                      OpDecorate %497 RelaxedPrecision 
                                                      OpDecorate %498 RelaxedPrecision 
                                                      OpDecorate %500 RelaxedPrecision 
                                                      OpDecorate %501 RelaxedPrecision 
                                                      OpDecorate %502 RelaxedPrecision 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %507 RelaxedPrecision 
                                                      OpDecorate %507 Location 507 
                                                      OpDecorate %508 RelaxedPrecision 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %512 RelaxedPrecision 
                                                      OpDecorate %513 RelaxedPrecision 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate %515 RelaxedPrecision 
                                                      OpDecorate %516 RelaxedPrecision 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %519 Location 519 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %523 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %525 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %537 RelaxedPrecision 
                                                      OpDecorate %541 Location 541 
                                                      OpDecorate %542 Location 542 
                                                      OpMemberDecorate %598 0 BuiltIn 598 
                                                      OpMemberDecorate %598 1 BuiltIn 598 
                                                      OpMemberDecorate %598 2 BuiltIn 598 
                                                      OpDecorate %598 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                              %16 = OpTypeArray %7 %14 
                                              %17 = OpTypeArray %7 %14 
                                              %18 = OpTypeArray %7 %14 
                                              %19 = OpTypeArray %7 %14 
                                              %20 = OpTypeInt 32 1 
                                              %21 = OpTypeVector %20 4 
                                              %22 = OpTypeStruct %12 %13 %15 %16 %7 %17 %18 %19 %7 %7 %7 %6 %21 %7 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32; i32_4; f32_4;}* %24 = OpVariable Uniform 
                                          i32 %25 = OpConstant 2 
                                          i32 %26 = OpConstant 0 
                                              %27 = OpTypeVector %6 3 
                                              %28 = OpTypePointer Uniform %7 
                                          i32 %32 = OpConstant 5 
                                          i32 %33 = OpConstant 1 
                                          i32 %64 = OpConstant 3 
                               Private f32_4* %77 = OpVariable Private 
                                             %123 = OpTypePointer Private %27 
                              Private f32_3* %124 = OpVariable Private 
                              Private f32_3* %159 = OpVariable Private 
                              Private f32_3* %194 = OpVariable Private 
                                         i32 %198 = OpConstant 6 
                              Private f32_3* %230 = OpVariable Private 
                              Private f32_3* %265 = OpVariable Private 
                                             %302 = OpTypePointer Input %27 
                                Input f32_3* %303 = OpVariable Input 
                                Input f32_3* %335 = OpVariable Input 
                                         u32 %338 = OpConstant 0 
                                             %339 = OpTypePointer Private %6 
                                         u32 %344 = OpConstant 1 
                                         u32 %349 = OpConstant 2 
                                Private f32* %351 = OpVariable Private 
                              Private f32_3* %373 = OpVariable Private 
                                         i32 %374 = OpConstant 8 
                                         i32 %378 = OpConstant 4 
                                         i32 %383 = OpConstant 10 
                                Private f32* %388 = OpVariable Private 
                                         i32 %389 = OpConstant 11 
                                             %390 = OpTypePointer Uniform %6 
                                         f32 %393 = OpConstant 3.67402E-40 
                              Private f32_3* %395 = OpVariable Private 
                              Private f32_3* %397 = OpVariable Private 
                                         f32 %398 = OpConstant 3.67402E-40 
                                             %402 = OpTypePointer Function %20 
                                         i32 %410 = OpConstant 12 
                                             %411 = OpTypePointer Uniform %20 
                                             %414 = OpTypeBool 
                                Private f32* %416 = OpVariable Private 
                              Private f32_3* %426 = OpVariable Private 
                                             %439 = OpTypePointer Private %414 
                               Private bool* %440 = OpVariable Private 
                              Private f32_3* %446 = OpVariable Private 
                                         f32 %481 = OpConstant 3.67402E-40 
                                         f32 %484 = OpConstant 3.67402E-40 
                                       f32_3 %496 = OpConstantComposite %484 %484 %484 
                                       f32_3 %499 = OpConstantComposite %481 %481 %481 
                                             %506 = OpTypePointer Output %27 
                               Output f32_3* %507 = OpVariable Output 
                                         i32 %509 = OpConstant 9 
                                             %518 = OpTypePointer Output %7 
                               Output f32_4* %519 = OpVariable Output 
                                         u32 %530 = OpConstant 3 
                                             %533 = OpTypePointer Output %6 
                                             %539 = OpTypeVector %6 2 
                                             %540 = OpTypePointer Output %539 
                               Output f32_2* %541 = OpVariable Output 
                                Input f32_3* %542 = OpVariable Input 
                                         i32 %545 = OpConstant 13 
                                         i32 %579 = OpConstant 7 
                                             %597 = OpTypeArray %6 %344 
                                             %598 = OpTypeStruct %7 %6 %597 
                                             %599 = OpTypePointer Output %598 
        Output struct {f32_4; f32; f32[1];}* %600 = OpVariable Output 
                                             %614 = OpTypePointer Private %20 
                                Private i32* %615 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %403 = OpVariable Function 
                               Uniform f32_4* %29 = OpAccessChain %24 %25 %26 
                                        f32_4 %30 = OpLoad %29 
                                        f32_3 %31 = OpVectorShuffle %30 %30 1 1 1 
                               Uniform f32_4* %34 = OpAccessChain %24 %32 %33 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                        f32_3 %37 = OpFMul %31 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %9 %39 
                               Uniform f32_4* %40 = OpAccessChain %24 %32 %26 
                                        f32_4 %41 = OpLoad %40 
                                        f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
                               Uniform f32_4* %43 = OpAccessChain %24 %25 %26 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 0 0 
                                        f32_3 %46 = OpFMul %42 %45 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFAdd %46 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %9 %51 
                               Uniform f32_4* %52 = OpAccessChain %24 %32 %25 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                               Uniform f32_4* %55 = OpAccessChain %24 %25 %26 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 2 2 2 
                                        f32_3 %58 = OpFMul %54 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                               Uniform f32_4* %65 = OpAccessChain %24 %32 %64 
                                        f32_4 %66 = OpLoad %65 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                               Uniform f32_4* %68 = OpAccessChain %24 %25 %26 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 3 3 3 
                                        f32_3 %71 = OpFMul %67 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpFAdd %71 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %9 %76 
                               Uniform f32_4* %78 = OpAccessChain %24 %25 %33 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 1 1 1 
                               Uniform f32_4* %81 = OpAccessChain %24 %32 %33 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                        f32_3 %84 = OpFMul %80 %83 
                                        f32_4 %85 = OpLoad %77 
                                        f32_4 %86 = OpVectorShuffle %85 %84 4 5 6 3 
                                                      OpStore %77 %86 
                               Uniform f32_4* %87 = OpAccessChain %24 %32 %26 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                               Uniform f32_4* %90 = OpAccessChain %24 %25 %33 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 0 0 
                                        f32_3 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %77 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFAdd %93 %95 
                                        f32_4 %97 = OpLoad %77 
                                        f32_4 %98 = OpVectorShuffle %97 %96 4 5 6 3 
                                                      OpStore %77 %98 
                               Uniform f32_4* %99 = OpAccessChain %24 %32 %25 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                              Uniform f32_4* %102 = OpAccessChain %24 %25 %33 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 2 2 2 
                                       f32_3 %105 = OpFMul %101 %104 
                                       f32_4 %106 = OpLoad %77 
                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                       f32_3 %108 = OpFAdd %105 %107 
                                       f32_4 %109 = OpLoad %77 
                                       f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                                      OpStore %77 %110 
                              Uniform f32_4* %111 = OpAccessChain %24 %32 %64 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                              Uniform f32_4* %114 = OpAccessChain %24 %25 %33 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 3 3 3 
                                       f32_3 %117 = OpFMul %113 %116 
                                       f32_4 %118 = OpLoad %77 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFAdd %117 %119 
                                       f32_4 %121 = OpLoad %77 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                      OpStore %77 %122 
                              Uniform f32_4* %125 = OpAccessChain %24 %25 %25 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 1 1 1 
                              Uniform f32_4* %128 = OpAccessChain %24 %32 %33 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFMul %127 %130 
                                                      OpStore %124 %131 
                              Uniform f32_4* %132 = OpAccessChain %24 %32 %26 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                              Uniform f32_4* %135 = OpAccessChain %24 %25 %25 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 0 0 
                                       f32_3 %138 = OpFMul %134 %137 
                                       f32_3 %139 = OpLoad %124 
                                       f32_3 %140 = OpFAdd %138 %139 
                                                      OpStore %124 %140 
                              Uniform f32_4* %141 = OpAccessChain %24 %32 %25 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                              Uniform f32_4* %144 = OpAccessChain %24 %25 %25 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 2 2 2 
                                       f32_3 %147 = OpFMul %143 %146 
                                       f32_3 %148 = OpLoad %124 
                                       f32_3 %149 = OpFAdd %147 %148 
                                                      OpStore %124 %149 
                              Uniform f32_4* %150 = OpAccessChain %24 %32 %64 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                              Uniform f32_4* %153 = OpAccessChain %24 %25 %25 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 3 3 3 
                                       f32_3 %156 = OpFMul %152 %155 
                                       f32_3 %157 = OpLoad %124 
                                       f32_3 %158 = OpFAdd %156 %157 
                                                      OpStore %124 %158 
                              Uniform f32_4* %160 = OpAccessChain %24 %25 %64 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 1 1 1 
                              Uniform f32_4* %163 = OpAccessChain %24 %32 %33 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFMul %162 %165 
                                                      OpStore %159 %166 
                              Uniform f32_4* %167 = OpAccessChain %24 %32 %26 
                                       f32_4 %168 = OpLoad %167 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                              Uniform f32_4* %170 = OpAccessChain %24 %25 %64 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 0 0 
                                       f32_3 %173 = OpFMul %169 %172 
                                       f32_3 %174 = OpLoad %159 
                                       f32_3 %175 = OpFAdd %173 %174 
                                                      OpStore %159 %175 
                              Uniform f32_4* %176 = OpAccessChain %24 %32 %25 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                              Uniform f32_4* %179 = OpAccessChain %24 %25 %64 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 2 2 2 
                                       f32_3 %182 = OpFMul %178 %181 
                                       f32_3 %183 = OpLoad %159 
                                       f32_3 %184 = OpFAdd %182 %183 
                                                      OpStore %159 %184 
                              Uniform f32_4* %185 = OpAccessChain %24 %32 %64 
                                       f32_4 %186 = OpLoad %185 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %24 %25 %64 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 3 3 3 
                                       f32_3 %191 = OpFMul %187 %190 
                                       f32_3 %192 = OpLoad %159 
                                       f32_3 %193 = OpFAdd %191 %192 
                                                      OpStore %159 %193 
                              Uniform f32_4* %195 = OpAccessChain %24 %64 %33 
                                       f32_4 %196 = OpLoad %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                              Uniform f32_4* %199 = OpAccessChain %24 %198 %26 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 1 1 1 
                                       f32_3 %202 = OpFMul %197 %201 
                                                      OpStore %194 %202 
                              Uniform f32_4* %203 = OpAccessChain %24 %64 %26 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                              Uniform f32_4* %206 = OpAccessChain %24 %198 %26 
                                       f32_4 %207 = OpLoad %206 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 0 0 
                                       f32_3 %209 = OpFMul %205 %208 
                                       f32_3 %210 = OpLoad %194 
                                       f32_3 %211 = OpFAdd %209 %210 
                                                      OpStore %194 %211 
                              Uniform f32_4* %212 = OpAccessChain %24 %64 %25 
                                       f32_4 %213 = OpLoad %212 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                              Uniform f32_4* %215 = OpAccessChain %24 %198 %26 
                                       f32_4 %216 = OpLoad %215 
                                       f32_3 %217 = OpVectorShuffle %216 %216 2 2 2 
                                       f32_3 %218 = OpFMul %214 %217 
                                       f32_3 %219 = OpLoad %194 
                                       f32_3 %220 = OpFAdd %218 %219 
                                                      OpStore %194 %220 
                              Uniform f32_4* %221 = OpAccessChain %24 %64 %64 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                              Uniform f32_4* %224 = OpAccessChain %24 %198 %26 
                                       f32_4 %225 = OpLoad %224 
                                       f32_3 %226 = OpVectorShuffle %225 %225 3 3 3 
                                       f32_3 %227 = OpFMul %223 %226 
                                       f32_3 %228 = OpLoad %194 
                                       f32_3 %229 = OpFAdd %227 %228 
                                                      OpStore %194 %229 
                              Uniform f32_4* %231 = OpAccessChain %24 %64 %33 
                                       f32_4 %232 = OpLoad %231 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                              Uniform f32_4* %234 = OpAccessChain %24 %198 %33 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 1 1 1 
                                       f32_3 %237 = OpFMul %233 %236 
                                                      OpStore %230 %237 
                              Uniform f32_4* %238 = OpAccessChain %24 %64 %26 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                              Uniform f32_4* %241 = OpAccessChain %24 %198 %33 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 0 0 
                                       f32_3 %244 = OpFMul %240 %243 
                                       f32_3 %245 = OpLoad %230 
                                       f32_3 %246 = OpFAdd %244 %245 
                                                      OpStore %230 %246 
                              Uniform f32_4* %247 = OpAccessChain %24 %64 %25 
                                       f32_4 %248 = OpLoad %247 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                              Uniform f32_4* %250 = OpAccessChain %24 %198 %33 
                                       f32_4 %251 = OpLoad %250 
                                       f32_3 %252 = OpVectorShuffle %251 %251 2 2 2 
                                       f32_3 %253 = OpFMul %249 %252 
                                       f32_3 %254 = OpLoad %230 
                                       f32_3 %255 = OpFAdd %253 %254 
                                                      OpStore %230 %255 
                              Uniform f32_4* %256 = OpAccessChain %24 %64 %64 
                                       f32_4 %257 = OpLoad %256 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 2 
                              Uniform f32_4* %259 = OpAccessChain %24 %198 %33 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 3 3 3 
                                       f32_3 %262 = OpFMul %258 %261 
                                       f32_3 %263 = OpLoad %230 
                                       f32_3 %264 = OpFAdd %262 %263 
                                                      OpStore %230 %264 
                              Uniform f32_4* %266 = OpAccessChain %24 %64 %33 
                                       f32_4 %267 = OpLoad %266 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                              Uniform f32_4* %269 = OpAccessChain %24 %198 %25 
                                       f32_4 %270 = OpLoad %269 
                                       f32_3 %271 = OpVectorShuffle %270 %270 1 1 1 
                                       f32_3 %272 = OpFMul %268 %271 
                                                      OpStore %265 %272 
                              Uniform f32_4* %273 = OpAccessChain %24 %64 %26 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                              Uniform f32_4* %276 = OpAccessChain %24 %198 %25 
                                       f32_4 %277 = OpLoad %276 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 0 0 
                                       f32_3 %279 = OpFMul %275 %278 
                                       f32_3 %280 = OpLoad %265 
                                       f32_3 %281 = OpFAdd %279 %280 
                                                      OpStore %265 %281 
                              Uniform f32_4* %282 = OpAccessChain %24 %64 %25 
                                       f32_4 %283 = OpLoad %282 
                                       f32_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                              Uniform f32_4* %285 = OpAccessChain %24 %198 %25 
                                       f32_4 %286 = OpLoad %285 
                                       f32_3 %287 = OpVectorShuffle %286 %286 2 2 2 
                                       f32_3 %288 = OpFMul %284 %287 
                                       f32_3 %289 = OpLoad %265 
                                       f32_3 %290 = OpFAdd %288 %289 
                                                      OpStore %265 %290 
                              Uniform f32_4* %291 = OpAccessChain %24 %64 %64 
                                       f32_4 %292 = OpLoad %291 
                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                              Uniform f32_4* %294 = OpAccessChain %24 %198 %25 
                                       f32_4 %295 = OpLoad %294 
                                       f32_3 %296 = OpVectorShuffle %295 %295 3 3 3 
                                       f32_3 %297 = OpFMul %293 %296 
                                       f32_3 %298 = OpLoad %265 
                                       f32_3 %299 = OpFAdd %297 %298 
                                                      OpStore %265 %299 
                                       f32_4 %300 = OpLoad %77 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_3 %304 = OpLoad %303 
                                       f32_3 %305 = OpVectorShuffle %304 %304 1 1 1 
                                       f32_3 %306 = OpFMul %301 %305 
                                       f32_4 %307 = OpLoad %77 
                                       f32_4 %308 = OpVectorShuffle %307 %306 4 5 6 3 
                                                      OpStore %77 %308 
                                       f32_4 %309 = OpLoad %9 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 1 2 
                                       f32_3 %311 = OpLoad %303 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 0 0 
                                       f32_3 %313 = OpFMul %310 %312 
                                       f32_4 %314 = OpLoad %77 
                                       f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                                       f32_3 %316 = OpFAdd %313 %315 
                                       f32_4 %317 = OpLoad %9 
                                       f32_4 %318 = OpVectorShuffle %317 %316 4 5 6 3 
                                                      OpStore %9 %318 
                                       f32_3 %319 = OpLoad %124 
                                       f32_3 %320 = OpLoad %303 
                                       f32_3 %321 = OpVectorShuffle %320 %320 2 2 2 
                                       f32_3 %322 = OpFMul %319 %321 
                                       f32_4 %323 = OpLoad %9 
                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
                                       f32_3 %325 = OpFAdd %322 %324 
                                       f32_4 %326 = OpLoad %9 
                                       f32_4 %327 = OpVectorShuffle %326 %325 4 5 6 3 
                                                      OpStore %9 %327 
                                       f32_3 %328 = OpLoad %159 
                                       f32_4 %329 = OpLoad %9 
                                       f32_3 %330 = OpVectorShuffle %329 %329 0 1 2 
                                       f32_3 %331 = OpFAdd %328 %330 
                                       f32_4 %332 = OpLoad %9 
                                       f32_4 %333 = OpVectorShuffle %332 %331 4 5 6 3 
                                                      OpStore %9 %333 
                                       f32_3 %334 = OpLoad %194 
                                       f32_3 %336 = OpLoad %335 
                                         f32 %337 = OpDot %334 %336 
                                Private f32* %340 = OpAccessChain %77 %338 
                                                      OpStore %340 %337 
                                       f32_3 %341 = OpLoad %230 
                                       f32_3 %342 = OpLoad %335 
                                         f32 %343 = OpDot %341 %342 
                                Private f32* %345 = OpAccessChain %77 %344 
                                                      OpStore %345 %343 
                                       f32_3 %346 = OpLoad %265 
                                       f32_3 %347 = OpLoad %335 
                                         f32 %348 = OpDot %346 %347 
                                Private f32* %350 = OpAccessChain %77 %349 
                                                      OpStore %350 %348 
                                       f32_4 %352 = OpLoad %77 
                                       f32_3 %353 = OpVectorShuffle %352 %352 0 1 2 
                                       f32_4 %354 = OpLoad %77 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                         f32 %356 = OpDot %353 %355 
                                                      OpStore %351 %356 
                                         f32 %357 = OpLoad %351 
                                         f32 %358 = OpExtInst %1 32 %357 
                                                      OpStore %351 %358 
                                         f32 %359 = OpLoad %351 
                                       f32_3 %360 = OpCompositeConstruct %359 %359 %359 
                                       f32_4 %361 = OpLoad %77 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
                                       f32_3 %363 = OpFMul %360 %362 
                                       f32_4 %364 = OpLoad %77 
                                       f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
                                                      OpStore %77 %365 
                                       f32_4 %366 = OpLoad %9 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_4 %368 = OpLoad %9 
                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
                                         f32 %370 = OpDot %367 %369 
                                                      OpStore %351 %370 
                                         f32 %371 = OpLoad %351 
                                         f32 %372 = OpExtInst %1 32 %371 
                                                      OpStore %351 %372 
                              Uniform f32_4* %375 = OpAccessChain %24 %374 
                                       f32_4 %376 = OpLoad %375 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                              Uniform f32_4* %379 = OpAccessChain %24 %378 
                                       f32_4 %380 = OpLoad %379 
                                       f32_3 %381 = OpVectorShuffle %380 %380 0 1 2 
                                       f32_3 %382 = OpFMul %377 %381 
                              Uniform f32_4* %384 = OpAccessChain %24 %383 
                                       f32_4 %385 = OpLoad %384 
                                       f32_3 %386 = OpVectorShuffle %385 %385 0 1 2 
                                       f32_3 %387 = OpFAdd %382 %386 
                                                      OpStore %373 %387 
                                Uniform f32* %391 = OpAccessChain %24 %389 
                                         f32 %392 = OpLoad %391 
                                         f32 %394 = OpFMul %392 %393 
                                                      OpStore %388 %394 
                                       f32_3 %396 = OpLoad %373 
                                                      OpStore %395 %396 
                                Private f32* %399 = OpAccessChain %397 %338 
                                                      OpStore %399 %398 
                                Private f32* %400 = OpAccessChain %397 %344 
                                                      OpStore %400 %398 
                                Private f32* %401 = OpAccessChain %397 %349 
                                                      OpStore %401 %398 
                                                      OpStore %403 %26 
                                                      OpBranch %404 
                                             %404 = OpLabel 
                                                      OpLoopMerge %406 %407 None 
                                                      OpBranch %408 
                                             %408 = OpLabel 
                                         i32 %409 = OpLoad %403 
                                Uniform i32* %412 = OpAccessChain %24 %410 %338 
                                         i32 %413 = OpLoad %412 
                                        bool %415 = OpSLessThan %409 %413 
                                                      OpBranchConditional %415 %405 %406 
                                             %405 = OpLabel 
                                       f32_4 %417 = OpLoad %77 
                                       f32_3 %418 = OpVectorShuffle %417 %417 0 1 2 
                                         i32 %419 = OpLoad %403 
                              Uniform f32_4* %420 = OpAccessChain %24 %33 %419 
                                       f32_4 %421 = OpLoad %420 
                                       f32_3 %422 = OpVectorShuffle %421 %421 0 1 2 
                                         f32 %423 = OpDot %418 %422 
                                                      OpStore %416 %423 
                                         f32 %424 = OpLoad %416 
                                         f32 %425 = OpExtInst %1 40 %424 %398 
                                                      OpStore %416 %425 
                                         f32 %427 = OpLoad %416 
                                       f32_3 %428 = OpCompositeConstruct %427 %427 %427 
                              Uniform f32_4* %429 = OpAccessChain %24 %374 
                                       f32_4 %430 = OpLoad %429 
                                       f32_3 %431 = OpVectorShuffle %430 %430 0 1 2 
                                       f32_3 %432 = OpFMul %428 %431 
                                                      OpStore %426 %432 
                                       f32_3 %433 = OpLoad %426 
                                         i32 %434 = OpLoad %403 
                              Uniform f32_4* %435 = OpAccessChain %24 %26 %434 
                                       f32_4 %436 = OpLoad %435 
                                       f32_3 %437 = OpVectorShuffle %436 %436 0 1 2 
                                       f32_3 %438 = OpFMul %433 %437 
                                                      OpStore %426 %438 
                                         f32 %441 = OpLoad %416 
                                        bool %442 = OpFOrdLessThan %398 %441 
                                                      OpStore %440 %442 
                                        bool %443 = OpLoad %440 
                                                      OpSelectionMerge %445 None 
                                                      OpBranchConditional %443 %444 %445 
                                             %444 = OpLabel 
                                       f32_4 %447 = OpLoad %9 
                                       f32_3 %448 = OpVectorShuffle %447 %447 0 1 2 
                                       f32_3 %449 = OpFNegate %448 
                                         f32 %450 = OpLoad %351 
                                       f32_3 %451 = OpCompositeConstruct %450 %450 %450 
                                       f32_3 %452 = OpFMul %449 %451 
                                         i32 %453 = OpLoad %403 
                              Uniform f32_4* %454 = OpAccessChain %24 %33 %453 
                                       f32_4 %455 = OpLoad %454 
                                       f32_3 %456 = OpVectorShuffle %455 %455 0 1 2 
                                       f32_3 %457 = OpFAdd %452 %456 
                                                      OpStore %446 %457 
                                       f32_3 %458 = OpLoad %446 
                                       f32_3 %459 = OpLoad %446 
                                         f32 %460 = OpDot %458 %459 
                                                      OpStore %416 %460 
                                         f32 %461 = OpLoad %416 
                                         f32 %462 = OpExtInst %1 32 %461 
                                                      OpStore %416 %462 
                                         f32 %463 = OpLoad %416 
                                       f32_3 %464 = OpCompositeConstruct %463 %463 %463 
                                       f32_3 %465 = OpLoad %446 
                                       f32_3 %466 = OpFMul %464 %465 
                                                      OpStore %446 %466 
                                       f32_4 %467 = OpLoad %77 
                                       f32_3 %468 = OpVectorShuffle %467 %467 0 1 2 
                                       f32_3 %469 = OpLoad %446 
                                         f32 %470 = OpDot %468 %469 
                                                      OpStore %416 %470 
                                         f32 %471 = OpLoad %416 
                                         f32 %472 = OpExtInst %1 40 %471 %398 
                                                      OpStore %416 %472 
                                         f32 %473 = OpLoad %416 
                                         f32 %474 = OpExtInst %1 30 %473 
                                                      OpStore %416 %474 
                                         f32 %475 = OpLoad %388 
                                         f32 %476 = OpLoad %416 
                                         f32 %477 = OpFMul %475 %476 
                                                      OpStore %416 %477 
                                         f32 %478 = OpLoad %416 
                                         f32 %479 = OpExtInst %1 29 %478 
                                                      OpStore %416 %479 
                                         f32 %480 = OpLoad %416 
                                         f32 %482 = OpExtInst %1 37 %480 %481 
                                                      OpStore %416 %482 
                                         f32 %483 = OpLoad %416 
                                         f32 %485 = OpFMul %483 %484 
                                                      OpStore %416 %485 
                                         f32 %486 = OpLoad %416 
                                       f32_3 %487 = OpCompositeConstruct %486 %486 %486 
                                         i32 %488 = OpLoad %403 
                              Uniform f32_4* %489 = OpAccessChain %24 %26 %488 
                                       f32_4 %490 = OpLoad %489 
                                       f32_3 %491 = OpVectorShuffle %490 %490 0 1 2 
                                       f32_3 %492 = OpFMul %487 %491 
                                       f32_3 %493 = OpLoad %397 
                                       f32_3 %494 = OpFAdd %492 %493 
                                                      OpStore %397 %494 
                                                      OpBranch %445 
                                             %445 = OpLabel 
                                       f32_3 %495 = OpLoad %426 
                                       f32_3 %497 = OpFMul %495 %496 
                                                      OpStore %426 %497 
                                       f32_3 %498 = OpLoad %426 
                                       f32_3 %500 = OpExtInst %1 37 %498 %499 
                                                      OpStore %426 %500 
                                       f32_3 %501 = OpLoad %395 
                                       f32_3 %502 = OpLoad %426 
                                       f32_3 %503 = OpFAdd %501 %502 
                                                      OpStore %395 %503 
                                                      OpBranch %407 
                                             %407 = OpLabel 
                                         i32 %504 = OpLoad %403 
                                         i32 %505 = OpIAdd %504 %33 
                                                      OpStore %403 %505 
                                                      OpBranch %404 
                                             %406 = OpLabel 
                                       f32_3 %508 = OpLoad %397 
                              Uniform f32_4* %510 = OpAccessChain %24 %509 
                                       f32_4 %511 = OpLoad %510 
                                       f32_3 %512 = OpVectorShuffle %511 %511 0 1 2 
                                       f32_3 %513 = OpFMul %508 %512 
                                                      OpStore %507 %513 
                                       f32_3 %514 = OpLoad %507 
                                       f32_3 %515 = OpCompositeConstruct %398 %398 %398 
                                       f32_3 %516 = OpCompositeConstruct %481 %481 %481 
                                       f32_3 %517 = OpExtInst %1 43 %514 %515 %516 
                                                      OpStore %507 %517 
                                       f32_3 %520 = OpLoad %395 
                                       f32_4 %521 = OpLoad %519 
                                       f32_4 %522 = OpVectorShuffle %521 %520 4 5 6 3 
                                                      OpStore %519 %522 
                                       f32_4 %523 = OpLoad %519 
                                       f32_3 %524 = OpVectorShuffle %523 %523 0 1 2 
                                       f32_3 %525 = OpCompositeConstruct %398 %398 %398 
                                       f32_3 %526 = OpCompositeConstruct %481 %481 %481 
                                       f32_3 %527 = OpExtInst %1 43 %524 %525 %526 
                                       f32_4 %528 = OpLoad %519 
                                       f32_4 %529 = OpVectorShuffle %528 %527 4 5 6 3 
                                                      OpStore %519 %529 
                                Uniform f32* %531 = OpAccessChain %24 %374 %530 
                                         f32 %532 = OpLoad %531 
                                 Output f32* %534 = OpAccessChain %519 %530 
                                                      OpStore %534 %532 
                                 Output f32* %535 = OpAccessChain %519 %530 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpExtInst %1 43 %536 %398 %481 
                                 Output f32* %538 = OpAccessChain %519 %530 
                                                      OpStore %538 %537 
                                       f32_3 %543 = OpLoad %542 
                                       f32_2 %544 = OpVectorShuffle %543 %543 0 1 
                              Uniform f32_4* %546 = OpAccessChain %24 %545 
                                       f32_4 %547 = OpLoad %546 
                                       f32_2 %548 = OpVectorShuffle %547 %547 0 1 
                                       f32_2 %549 = OpFMul %544 %548 
                              Uniform f32_4* %550 = OpAccessChain %24 %545 
                                       f32_4 %551 = OpLoad %550 
                                       f32_2 %552 = OpVectorShuffle %551 %551 2 3 
                                       f32_2 %553 = OpFAdd %549 %552 
                                                      OpStore %541 %553 
                                       f32_3 %554 = OpLoad %303 
                                       f32_4 %555 = OpVectorShuffle %554 %554 1 1 1 1 
                              Uniform f32_4* %556 = OpAccessChain %24 %25 %33 
                                       f32_4 %557 = OpLoad %556 
                                       f32_4 %558 = OpFMul %555 %557 
                                                      OpStore %9 %558 
                              Uniform f32_4* %559 = OpAccessChain %24 %25 %26 
                                       f32_4 %560 = OpLoad %559 
                                       f32_3 %561 = OpLoad %303 
                                       f32_4 %562 = OpVectorShuffle %561 %561 0 0 0 0 
                                       f32_4 %563 = OpFMul %560 %562 
                                       f32_4 %564 = OpLoad %9 
                                       f32_4 %565 = OpFAdd %563 %564 
                                                      OpStore %9 %565 
                              Uniform f32_4* %566 = OpAccessChain %24 %25 %25 
                                       f32_4 %567 = OpLoad %566 
                                       f32_3 %568 = OpLoad %303 
                                       f32_4 %569 = OpVectorShuffle %568 %568 2 2 2 2 
                                       f32_4 %570 = OpFMul %567 %569 
                                       f32_4 %571 = OpLoad %9 
                                       f32_4 %572 = OpFAdd %570 %571 
                                                      OpStore %9 %572 
                                       f32_4 %573 = OpLoad %9 
                              Uniform f32_4* %574 = OpAccessChain %24 %25 %64 
                                       f32_4 %575 = OpLoad %574 
                                       f32_4 %576 = OpFAdd %573 %575 
                                                      OpStore %9 %576 
                                       f32_4 %577 = OpLoad %9 
                                       f32_4 %578 = OpVectorShuffle %577 %577 1 1 1 1 
                              Uniform f32_4* %580 = OpAccessChain %24 %579 %33 
                                       f32_4 %581 = OpLoad %580 
                                       f32_4 %582 = OpFMul %578 %581 
                                                      OpStore %77 %582 
                              Uniform f32_4* %583 = OpAccessChain %24 %579 %26 
                                       f32_4 %584 = OpLoad %583 
                                       f32_4 %585 = OpLoad %9 
                                       f32_4 %586 = OpVectorShuffle %585 %585 0 0 0 0 
                                       f32_4 %587 = OpFMul %584 %586 
                                       f32_4 %588 = OpLoad %77 
                                       f32_4 %589 = OpFAdd %587 %588 
                                                      OpStore %77 %589 
                              Uniform f32_4* %590 = OpAccessChain %24 %579 %25 
                                       f32_4 %591 = OpLoad %590 
                                       f32_4 %592 = OpLoad %9 
                                       f32_4 %593 = OpVectorShuffle %592 %592 2 2 2 2 
                                       f32_4 %594 = OpFMul %591 %593 
                                       f32_4 %595 = OpLoad %77 
                                       f32_4 %596 = OpFAdd %594 %595 
                                                      OpStore %77 %596 
                              Uniform f32_4* %601 = OpAccessChain %24 %579 %64 
                                       f32_4 %602 = OpLoad %601 
                                       f32_4 %603 = OpLoad %9 
                                       f32_4 %604 = OpVectorShuffle %603 %603 3 3 3 3 
                                       f32_4 %605 = OpFMul %602 %604 
                                       f32_4 %606 = OpLoad %77 
                                       f32_4 %607 = OpFAdd %605 %606 
                               Output f32_4* %608 = OpAccessChain %600 %26 
                                                      OpStore %608 %607 
                                 Output f32* %609 = OpAccessChain %600 %26 %344 
                                         f32 %610 = OpLoad %609 
                                         f32 %611 = OpFNegate %610 
                                 Output f32* %612 = OpAccessChain %600 %26 %344 
                                                      OpStore %612 %611 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 47
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %25 %30 %36 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %25 Location 25 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %30 Location 30 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %36 Location 36 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %38 RelaxedPrecision 
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
                             Private f32_3* %22 = OpVariable Private 
                                            %24 = OpTypePointer Input %19 
                               Input f32_4* %25 = OpVariable Input 
                                            %29 = OpTypePointer Output %19 
                              Output f32_4* %30 = OpVariable Output 
                                        f32 %32 = OpConstant 3.67402E-40 
                                      f32_3 %33 = OpConstantComposite %32 %32 %32 
                                            %35 = OpTypePointer Input %7 
                               Input f32_3* %36 = OpVariable Input 
                                        f32 %41 = OpConstant 3.67402E-40 
                                            %42 = OpTypeInt 32 0 
                                        u32 %43 = OpConstant 3 
                                            %44 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                    OpStore %9 %21 
                                      f32_3 %23 = OpLoad %9 
                                      f32_4 %26 = OpLoad %25 
                                      f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                      f32_3 %28 = OpFMul %23 %27 
                                                    OpStore %22 %28 
                                      f32_3 %31 = OpLoad %22 
                                      f32_3 %34 = OpFMul %31 %33 
                                      f32_3 %37 = OpLoad %36 
                                      f32_3 %38 = OpFAdd %34 %37 
                                      f32_4 %39 = OpLoad %30 
                                      f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                    OpStore %30 %40 
                                Output f32* %45 = OpAccessChain %30 %43 
                                                    OpStore %45 %41 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
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

uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Emission;
uniform 	float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec3 vs_COLOR1;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat21;
float u_xlat22;
int u_xlati23;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
bool u_xlatb26;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat22 = _Shininess * 128.0;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat5.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat25 = unity_LightAtten[u_xlati_loop_1].z * u_xlat24 + 1.0;
        u_xlat25 = float(1.0) / u_xlat25;
        u_xlatb26 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb6 = unity_LightAtten[u_xlati_loop_1].w<u_xlat24;
        u_xlatb26 = u_xlatb26 && u_xlatb6;
        u_xlat24 = max(u_xlat24, 9.99999997e-007);
        u_xlat24 = inversesqrt(u_xlat24);
        u_xlat5.xyz = vec3(u_xlat24) * u_xlat5.xyz;
        u_xlat24 = u_xlat25 * 0.5;
        u_xlat24 = (u_xlatb26) ? 0.0 : u_xlat24;
        u_xlat25 = dot(u_xlat1.xyz, u_xlat5.xyz);
        u_xlat25 = max(u_xlat25, 0.0);
        u_xlat6.xyz = vec3(u_xlat25) * _Color.xyz;
        u_xlat6.xyz = u_xlat6.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb25 = 0.0<u_xlat25;
        if(u_xlatb25){
            u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat5.xyz;
            u_xlat25 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat25 = inversesqrt(u_xlat25);
            u_xlat5.xyz = vec3(u_xlat25) * u_xlat5.xyz;
            u_xlat25 = dot(u_xlat1.xyz, u_xlat5.xyz);
            u_xlat25 = max(u_xlat25, 0.0);
            u_xlat25 = log2(u_xlat25);
            u_xlat25 = u_xlat22 * u_xlat25;
            u_xlat25 = exp2(u_xlat25);
            u_xlat25 = min(u_xlat25, 1.0);
            u_xlat25 = u_xlat24 * u_xlat25;
            u_xlat4.xyz = vec3(u_xlat25) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat5.xyz = vec3(u_xlat24) * u_xlat6.xyz;
        u_xlat5.xyz = min(u_xlat5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat3.xyz = u_xlat3.xyz + u_xlat5.xyz;
    }
    vs_COLOR1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat3.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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

uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec3 vs_COLOR1;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 678
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %305 %337 %569 %581 %602 %603 %661 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %23 0 RelaxedPrecision 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 RelaxedPrecision 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 RelaxedPrecision 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 RelaxedPrecision 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 RelaxedPrecision 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpMemberDecorate %23 11 RelaxedPrecision 
                                                      OpMemberDecorate %23 11 Offset 23 
                                                      OpMemberDecorate %23 12 RelaxedPrecision 
                                                      OpMemberDecorate %23 12 Offset 23 
                                                      OpMemberDecorate %23 13 Offset 23 
                                                      OpMemberDecorate %23 14 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpDecorate %305 Location 305 
                                                      OpDecorate %337 Location 337 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %389 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %394 RelaxedPrecision 
                                                      OpDecorate %396 RelaxedPrecision 
                                                      OpDecorate %397 RelaxedPrecision 
                                                      OpDecorate %398 RelaxedPrecision 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %437 RelaxedPrecision 
                                                      OpDecorate %457 RelaxedPrecision 
                                                      OpDecorate %476 RelaxedPrecision 
                                                      OpDecorate %485 RelaxedPrecision 
                                                      OpDecorate %490 RelaxedPrecision 
                                                      OpDecorate %491 RelaxedPrecision 
                                                      OpDecorate %492 RelaxedPrecision 
                                                      OpDecorate %493 RelaxedPrecision 
                                                      OpDecorate %494 RelaxedPrecision 
                                                      OpDecorate %496 RelaxedPrecision 
                                                      OpDecorate %497 RelaxedPrecision 
                                                      OpDecorate %498 RelaxedPrecision 
                                                      OpDecorate %499 RelaxedPrecision 
                                                      OpDecorate %502 RelaxedPrecision 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %504 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate %522 RelaxedPrecision 
                                                      OpDecorate %523 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %525 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %528 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %533 RelaxedPrecision 
                                                      OpDecorate %534 RelaxedPrecision 
                                                      OpDecorate %535 RelaxedPrecision 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %537 RelaxedPrecision 
                                                      OpDecorate %538 RelaxedPrecision 
                                                      OpDecorate %539 RelaxedPrecision 
                                                      OpDecorate %540 RelaxedPrecision 
                                                      OpDecorate %541 RelaxedPrecision 
                                                      OpDecorate %542 RelaxedPrecision 
                                                      OpDecorate %543 RelaxedPrecision 
                                                      OpDecorate %544 RelaxedPrecision 
                                                      OpDecorate %545 RelaxedPrecision 
                                                      OpDecorate %546 RelaxedPrecision 
                                                      OpDecorate %547 RelaxedPrecision 
                                                      OpDecorate %548 RelaxedPrecision 
                                                      OpDecorate %551 RelaxedPrecision 
                                                      OpDecorate %552 RelaxedPrecision 
                                                      OpDecorate %553 RelaxedPrecision 
                                                      OpDecorate %554 RelaxedPrecision 
                                                      OpDecorate %555 RelaxedPrecision 
                                                      OpDecorate %556 RelaxedPrecision 
                                                      OpDecorate %557 RelaxedPrecision 
                                                      OpDecorate %558 RelaxedPrecision 
                                                      OpDecorate %559 RelaxedPrecision 
                                                      OpDecorate %560 RelaxedPrecision 
                                                      OpDecorate %562 RelaxedPrecision 
                                                      OpDecorate %563 RelaxedPrecision 
                                                      OpDecorate %564 RelaxedPrecision 
                                                      OpDecorate %565 RelaxedPrecision 
                                                      OpDecorate %569 RelaxedPrecision 
                                                      OpDecorate %569 Location 569 
                                                      OpDecorate %570 RelaxedPrecision 
                                                      OpDecorate %573 RelaxedPrecision 
                                                      OpDecorate %574 RelaxedPrecision 
                                                      OpDecorate %575 RelaxedPrecision 
                                                      OpDecorate %576 RelaxedPrecision 
                                                      OpDecorate %577 RelaxedPrecision 
                                                      OpDecorate %578 RelaxedPrecision 
                                                      OpDecorate %579 RelaxedPrecision 
                                                      OpDecorate %581 RelaxedPrecision 
                                                      OpDecorate %581 Location 581 
                                                      OpDecorate %582 RelaxedPrecision 
                                                      OpDecorate %585 RelaxedPrecision 
                                                      OpDecorate %586 RelaxedPrecision 
                                                      OpDecorate %587 RelaxedPrecision 
                                                      OpDecorate %588 RelaxedPrecision 
                                                      OpDecorate %589 RelaxedPrecision 
                                                      OpDecorate %593 RelaxedPrecision 
                                                      OpDecorate %597 RelaxedPrecision 
                                                      OpDecorate %598 RelaxedPrecision 
                                                      OpDecorate %602 Location 602 
                                                      OpDecorate %603 Location 603 
                                                      OpMemberDecorate %659 0 BuiltIn 659 
                                                      OpMemberDecorate %659 1 BuiltIn 659 
                                                      OpMemberDecorate %659 2 BuiltIn 659 
                                                      OpDecorate %659 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeInt 32 1 
                                              %22 = OpTypeVector %21 4 
                                              %23 = OpTypeStruct %12 %13 %14 %16 %17 %7 %18 %19 %20 %7 %7 %7 %6 %22 %7 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32; i32_4; f32_4;}* %25 = OpVariable Uniform 
                                          i32 %26 = OpConstant 3 
                                          i32 %27 = OpConstant 0 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypePointer Uniform %7 
                                          i32 %33 = OpConstant 6 
                                          i32 %34 = OpConstant 1 
                                          i32 %53 = OpConstant 2 
                               Private f32_4* %78 = OpVariable Private 
                                             %124 = OpTypePointer Private %28 
                              Private f32_3* %125 = OpVariable Private 
                              Private f32_3* %160 = OpVariable Private 
                              Private f32_3* %195 = OpVariable Private 
                                         i32 %196 = OpConstant 4 
                                         i32 %200 = OpConstant 7 
                              Private f32_3* %232 = OpVariable Private 
                              Private f32_3* %267 = OpVariable Private 
                                             %304 = OpTypePointer Input %28 
                                Input f32_3* %305 = OpVariable Input 
                                Input f32_3* %337 = OpVariable Input 
                                         u32 %340 = OpConstant 0 
                                             %341 = OpTypePointer Private %6 
                                         u32 %346 = OpConstant 1 
                                         u32 %351 = OpConstant 2 
                                Private f32* %353 = OpVariable Private 
                              Private f32_3* %375 = OpVariable Private 
                                         i32 %376 = OpConstant 9 
                                         i32 %380 = OpConstant 5 
                                         i32 %385 = OpConstant 11 
                                Private f32* %390 = OpVariable Private 
                                         i32 %391 = OpConstant 12 
                                             %392 = OpTypePointer Uniform %6 
                                         f32 %395 = OpConstant 3.67402E-40 
                              Private f32_3* %397 = OpVariable Private 
                              Private f32_3* %399 = OpVariable Private 
                                         f32 %400 = OpConstant 3.67402E-40 
                                             %404 = OpTypePointer Function %21 
                                         i32 %412 = OpConstant 13 
                                             %413 = OpTypePointer Uniform %21 
                                             %416 = OpTypeBool 
                                Private f32* %431 = OpVariable Private 
                                         f32 %440 = OpConstant 3.67402E-40 
                                             %447 = OpTypePointer Private %416 
                               Private bool* %448 = OpVariable Private 
                                         u32 %450 = OpConstant 3 
                               Private bool* %454 = OpVariable Private 
                                         f32 %464 = OpConstant 3.67402E-40 
                                         f32 %474 = OpConstant 3.67402E-40 
                                Private f32* %476 = OpVariable Private 
                                             %477 = OpTypePointer Function %6 
                                Private f32* %485 = OpVariable Private 
                              Private f32_3* %492 = OpVariable Private 
                               Private bool* %505 = OpVariable Private 
                              Private f32_3* %511 = OpVariable Private 
                                       f32_3 %561 = OpConstantComposite %440 %440 %440 
                                             %568 = OpTypePointer Output %28 
                               Output f32_3* %569 = OpVariable Output 
                                         i32 %571 = OpConstant 10 
                                             %580 = OpTypePointer Output %7 
                               Output f32_4* %581 = OpVariable Output 
                                             %594 = OpTypePointer Output %6 
                                             %600 = OpTypeVector %6 2 
                                             %601 = OpTypePointer Output %600 
                               Output f32_2* %602 = OpVariable Output 
                                Input f32_3* %603 = OpVariable Input 
                                         i32 %606 = OpConstant 14 
                                         i32 %640 = OpConstant 8 
                                             %658 = OpTypeArray %6 %346 
                                             %659 = OpTypeStruct %7 %6 %658 
                                             %660 = OpTypePointer Output %659 
        Output struct {f32_4; f32; f32[1];}* %661 = OpVariable Output 
                               Private bool* %675 = OpVariable Private 
                                             %676 = OpTypePointer Private %21 
                                Private i32* %677 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %405 = OpVariable Function 
                               Function f32* %478 = OpVariable Function 
                               Uniform f32_4* %30 = OpAccessChain %25 %26 %27 
                                        f32_4 %31 = OpLoad %30 
                                        f32_3 %32 = OpVectorShuffle %31 %31 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %25 %33 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFMul %32 %37 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %9 %40 
                               Uniform f32_4* %41 = OpAccessChain %25 %33 %27 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                               Uniform f32_4* %44 = OpAccessChain %25 %26 %27 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 0 0 
                                        f32_3 %47 = OpFMul %43 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFAdd %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
                                                      OpStore %9 %52 
                               Uniform f32_4* %54 = OpAccessChain %25 %33 %53 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               Uniform f32_4* %57 = OpAccessChain %25 %26 %27 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %56 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %25 %33 %26 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               Uniform f32_4* %69 = OpAccessChain %25 %26 %27 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 3 3 3 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %9 %77 
                               Uniform f32_4* %79 = OpAccessChain %25 %26 %34 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 1 1 1 
                               Uniform f32_4* %82 = OpAccessChain %25 %33 %34 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFMul %81 %84 
                                        f32_4 %86 = OpLoad %78 
                                        f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                                      OpStore %78 %87 
                               Uniform f32_4* %88 = OpAccessChain %25 %33 %27 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               Uniform f32_4* %91 = OpAccessChain %25 %26 %34 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %78 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                        f32_4 %98 = OpLoad %78 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                      OpStore %78 %99 
                              Uniform f32_4* %100 = OpAccessChain %25 %33 %53 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %103 = OpAccessChain %25 %26 %34 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 2 2 2 
                                       f32_3 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %78 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %78 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                      OpStore %78 %111 
                              Uniform f32_4* %112 = OpAccessChain %25 %33 %26 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %25 %26 %34 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 3 3 3 
                                       f32_3 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %78 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpFAdd %118 %120 
                                       f32_4 %122 = OpLoad %78 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %78 %123 
                              Uniform f32_4* %126 = OpAccessChain %25 %26 %53 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 1 1 1 
                              Uniform f32_4* %129 = OpAccessChain %25 %33 %34 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %128 %131 
                                                      OpStore %125 %132 
                              Uniform f32_4* %133 = OpAccessChain %25 %33 %27 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                              Uniform f32_4* %136 = OpAccessChain %25 %26 %53 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 0 0 
                                       f32_3 %139 = OpFMul %135 %138 
                                       f32_3 %140 = OpLoad %125 
                                       f32_3 %141 = OpFAdd %139 %140 
                                                      OpStore %125 %141 
                              Uniform f32_4* %142 = OpAccessChain %25 %33 %53 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              Uniform f32_4* %145 = OpAccessChain %25 %26 %53 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 2 2 2 
                                       f32_3 %148 = OpFMul %144 %147 
                                       f32_3 %149 = OpLoad %125 
                                       f32_3 %150 = OpFAdd %148 %149 
                                                      OpStore %125 %150 
                              Uniform f32_4* %151 = OpAccessChain %25 %33 %26 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              Uniform f32_4* %154 = OpAccessChain %25 %26 %53 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 3 3 3 
                                       f32_3 %157 = OpFMul %153 %156 
                                       f32_3 %158 = OpLoad %125 
                                       f32_3 %159 = OpFAdd %157 %158 
                                                      OpStore %125 %159 
                              Uniform f32_4* %161 = OpAccessChain %25 %26 %26 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 1 1 1 
                              Uniform f32_4* %164 = OpAccessChain %25 %33 %34 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFMul %163 %166 
                                                      OpStore %160 %167 
                              Uniform f32_4* %168 = OpAccessChain %25 %33 %27 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                              Uniform f32_4* %171 = OpAccessChain %25 %26 %26 
                                       f32_4 %172 = OpLoad %171 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 0 0 
                                       f32_3 %174 = OpFMul %170 %173 
                                       f32_3 %175 = OpLoad %160 
                                       f32_3 %176 = OpFAdd %174 %175 
                                                      OpStore %160 %176 
                              Uniform f32_4* %177 = OpAccessChain %25 %33 %53 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                              Uniform f32_4* %180 = OpAccessChain %25 %26 %26 
                                       f32_4 %181 = OpLoad %180 
                                       f32_3 %182 = OpVectorShuffle %181 %181 2 2 2 
                                       f32_3 %183 = OpFMul %179 %182 
                                       f32_3 %184 = OpLoad %160 
                                       f32_3 %185 = OpFAdd %183 %184 
                                                      OpStore %160 %185 
                              Uniform f32_4* %186 = OpAccessChain %25 %33 %26 
                                       f32_4 %187 = OpLoad %186 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                              Uniform f32_4* %189 = OpAccessChain %25 %26 %26 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 3 3 3 
                                       f32_3 %192 = OpFMul %188 %191 
                                       f32_3 %193 = OpLoad %160 
                                       f32_3 %194 = OpFAdd %192 %193 
                                                      OpStore %160 %194 
                              Uniform f32_4* %197 = OpAccessChain %25 %196 %34 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                              Uniform f32_4* %201 = OpAccessChain %25 %200 %27 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 1 1 1 
                                       f32_3 %204 = OpFMul %199 %203 
                                                      OpStore %195 %204 
                              Uniform f32_4* %205 = OpAccessChain %25 %196 %27 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                              Uniform f32_4* %208 = OpAccessChain %25 %200 %27 
                                       f32_4 %209 = OpLoad %208 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 0 0 
                                       f32_3 %211 = OpFMul %207 %210 
                                       f32_3 %212 = OpLoad %195 
                                       f32_3 %213 = OpFAdd %211 %212 
                                                      OpStore %195 %213 
                              Uniform f32_4* %214 = OpAccessChain %25 %196 %53 
                                       f32_4 %215 = OpLoad %214 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                              Uniform f32_4* %217 = OpAccessChain %25 %200 %27 
                                       f32_4 %218 = OpLoad %217 
                                       f32_3 %219 = OpVectorShuffle %218 %218 2 2 2 
                                       f32_3 %220 = OpFMul %216 %219 
                                       f32_3 %221 = OpLoad %195 
                                       f32_3 %222 = OpFAdd %220 %221 
                                                      OpStore %195 %222 
                              Uniform f32_4* %223 = OpAccessChain %25 %196 %26 
                                       f32_4 %224 = OpLoad %223 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                              Uniform f32_4* %226 = OpAccessChain %25 %200 %27 
                                       f32_4 %227 = OpLoad %226 
                                       f32_3 %228 = OpVectorShuffle %227 %227 3 3 3 
                                       f32_3 %229 = OpFMul %225 %228 
                                       f32_3 %230 = OpLoad %195 
                                       f32_3 %231 = OpFAdd %229 %230 
                                                      OpStore %195 %231 
                              Uniform f32_4* %233 = OpAccessChain %25 %196 %34 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                              Uniform f32_4* %236 = OpAccessChain %25 %200 %34 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 1 1 1 
                                       f32_3 %239 = OpFMul %235 %238 
                                                      OpStore %232 %239 
                              Uniform f32_4* %240 = OpAccessChain %25 %196 %27 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                              Uniform f32_4* %243 = OpAccessChain %25 %200 %34 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpFMul %242 %245 
                                       f32_3 %247 = OpLoad %232 
                                       f32_3 %248 = OpFAdd %246 %247 
                                                      OpStore %232 %248 
                              Uniform f32_4* %249 = OpAccessChain %25 %196 %53 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                              Uniform f32_4* %252 = OpAccessChain %25 %200 %34 
                                       f32_4 %253 = OpLoad %252 
                                       f32_3 %254 = OpVectorShuffle %253 %253 2 2 2 
                                       f32_3 %255 = OpFMul %251 %254 
                                       f32_3 %256 = OpLoad %232 
                                       f32_3 %257 = OpFAdd %255 %256 
                                                      OpStore %232 %257 
                              Uniform f32_4* %258 = OpAccessChain %25 %196 %26 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                              Uniform f32_4* %261 = OpAccessChain %25 %200 %34 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 3 3 3 
                                       f32_3 %264 = OpFMul %260 %263 
                                       f32_3 %265 = OpLoad %232 
                                       f32_3 %266 = OpFAdd %264 %265 
                                                      OpStore %232 %266 
                              Uniform f32_4* %268 = OpAccessChain %25 %196 %34 
                                       f32_4 %269 = OpLoad %268 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                              Uniform f32_4* %271 = OpAccessChain %25 %200 %53 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 1 1 1 
                                       f32_3 %274 = OpFMul %270 %273 
                                                      OpStore %267 %274 
                              Uniform f32_4* %275 = OpAccessChain %25 %196 %27 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                              Uniform f32_4* %278 = OpAccessChain %25 %200 %53 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 0 0 
                                       f32_3 %281 = OpFMul %277 %280 
                                       f32_3 %282 = OpLoad %267 
                                       f32_3 %283 = OpFAdd %281 %282 
                                                      OpStore %267 %283 
                              Uniform f32_4* %284 = OpAccessChain %25 %196 %53 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                              Uniform f32_4* %287 = OpAccessChain %25 %200 %53 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 2 2 2 
                                       f32_3 %290 = OpFMul %286 %289 
                                       f32_3 %291 = OpLoad %267 
                                       f32_3 %292 = OpFAdd %290 %291 
                                                      OpStore %267 %292 
                              Uniform f32_4* %293 = OpAccessChain %25 %196 %26 
                                       f32_4 %294 = OpLoad %293 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                              Uniform f32_4* %296 = OpAccessChain %25 %200 %53 
                                       f32_4 %297 = OpLoad %296 
                                       f32_3 %298 = OpVectorShuffle %297 %297 3 3 3 
                                       f32_3 %299 = OpFMul %295 %298 
                                       f32_3 %300 = OpLoad %267 
                                       f32_3 %301 = OpFAdd %299 %300 
                                                      OpStore %267 %301 
                                       f32_4 %302 = OpLoad %78 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                       f32_3 %306 = OpLoad %305 
                                       f32_3 %307 = OpVectorShuffle %306 %306 1 1 1 
                                       f32_3 %308 = OpFMul %303 %307 
                                       f32_4 %309 = OpLoad %78 
                                       f32_4 %310 = OpVectorShuffle %309 %308 4 5 6 3 
                                                      OpStore %78 %310 
                                       f32_4 %311 = OpLoad %9 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                                       f32_3 %313 = OpLoad %305 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 0 0 
                                       f32_3 %315 = OpFMul %312 %314 
                                       f32_4 %316 = OpLoad %78 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %318 = OpFAdd %315 %317 
                                       f32_4 %319 = OpLoad %9 
                                       f32_4 %320 = OpVectorShuffle %319 %318 4 5 6 3 
                                                      OpStore %9 %320 
                                       f32_3 %321 = OpLoad %125 
                                       f32_3 %322 = OpLoad %305 
                                       f32_3 %323 = OpVectorShuffle %322 %322 2 2 2 
                                       f32_3 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %9 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                                       f32_3 %327 = OpFAdd %324 %326 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
                                                      OpStore %9 %329 
                                       f32_3 %330 = OpLoad %160 
                                       f32_4 %331 = OpLoad %9 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFAdd %330 %332 
                                       f32_4 %334 = OpLoad %9 
                                       f32_4 %335 = OpVectorShuffle %334 %333 4 5 6 3 
                                                      OpStore %9 %335 
                                       f32_3 %336 = OpLoad %195 
                                       f32_3 %338 = OpLoad %337 
                                         f32 %339 = OpDot %336 %338 
                                Private f32* %342 = OpAccessChain %78 %340 
                                                      OpStore %342 %339 
                                       f32_3 %343 = OpLoad %232 
                                       f32_3 %344 = OpLoad %337 
                                         f32 %345 = OpDot %343 %344 
                                Private f32* %347 = OpAccessChain %78 %346 
                                                      OpStore %347 %345 
                                       f32_3 %348 = OpLoad %267 
                                       f32_3 %349 = OpLoad %337 
                                         f32 %350 = OpDot %348 %349 
                                Private f32* %352 = OpAccessChain %78 %351 
                                                      OpStore %352 %350 
                                       f32_4 %354 = OpLoad %78 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                       f32_4 %356 = OpLoad %78 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                         f32 %358 = OpDot %355 %357 
                                                      OpStore %353 %358 
                                         f32 %359 = OpLoad %353 
                                         f32 %360 = OpExtInst %1 32 %359 
                                                      OpStore %353 %360 
                                         f32 %361 = OpLoad %353 
                                       f32_3 %362 = OpCompositeConstruct %361 %361 %361 
                                       f32_4 %363 = OpLoad %78 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                                       f32_3 %365 = OpFMul %362 %364 
                                       f32_4 %366 = OpLoad %78 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %78 %367 
                                       f32_4 %368 = OpLoad %9 
                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
                                       f32_4 %370 = OpLoad %9 
                                       f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
                                         f32 %372 = OpDot %369 %371 
                                                      OpStore %353 %372 
                                         f32 %373 = OpLoad %353 
                                         f32 %374 = OpExtInst %1 32 %373 
                                                      OpStore %353 %374 
                              Uniform f32_4* %377 = OpAccessChain %25 %376 
                                       f32_4 %378 = OpLoad %377 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                              Uniform f32_4* %381 = OpAccessChain %25 %380 
                                       f32_4 %382 = OpLoad %381 
                                       f32_3 %383 = OpVectorShuffle %382 %382 0 1 2 
                                       f32_3 %384 = OpFMul %379 %383 
                              Uniform f32_4* %386 = OpAccessChain %25 %385 
                                       f32_4 %387 = OpLoad %386 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                                       f32_3 %389 = OpFAdd %384 %388 
                                                      OpStore %375 %389 
                                Uniform f32* %393 = OpAccessChain %25 %391 
                                         f32 %394 = OpLoad %393 
                                         f32 %396 = OpFMul %394 %395 
                                                      OpStore %390 %396 
                                       f32_3 %398 = OpLoad %375 
                                                      OpStore %397 %398 
                                Private f32* %401 = OpAccessChain %399 %340 
                                                      OpStore %401 %400 
                                Private f32* %402 = OpAccessChain %399 %346 
                                                      OpStore %402 %400 
                                Private f32* %403 = OpAccessChain %399 %351 
                                                      OpStore %403 %400 
                                                      OpStore %405 %27 
                                                      OpBranch %406 
                                             %406 = OpLabel 
                                                      OpLoopMerge %408 %409 None 
                                                      OpBranch %410 
                                             %410 = OpLabel 
                                         i32 %411 = OpLoad %405 
                                Uniform i32* %414 = OpAccessChain %25 %412 %340 
                                         i32 %415 = OpLoad %414 
                                        bool %417 = OpSLessThan %411 %415 
                                                      OpBranchConditional %417 %407 %408 
                                             %407 = OpLabel 
                                       f32_4 %418 = OpLoad %9 
                                       f32_3 %419 = OpVectorShuffle %418 %418 0 1 2 
                                       f32_3 %420 = OpFNegate %419 
                                         i32 %421 = OpLoad %405 
                              Uniform f32_4* %422 = OpAccessChain %25 %34 %421 
                                       f32_4 %423 = OpLoad %422 
                                       f32_3 %424 = OpVectorShuffle %423 %423 3 3 3 
                                       f32_3 %425 = OpFMul %420 %424 
                                         i32 %426 = OpLoad %405 
                              Uniform f32_4* %427 = OpAccessChain %25 %34 %426 
                                       f32_4 %428 = OpLoad %427 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
                                       f32_3 %430 = OpFAdd %425 %429 
                                                      OpStore %125 %430 
                                       f32_3 %432 = OpLoad %125 
                                       f32_3 %433 = OpLoad %125 
                                         f32 %434 = OpDot %432 %433 
                                                      OpStore %431 %434 
                                         i32 %435 = OpLoad %405 
                                Uniform f32* %436 = OpAccessChain %25 %53 %435 %351 
                                         f32 %437 = OpLoad %436 
                                         f32 %438 = OpLoad %431 
                                         f32 %439 = OpFMul %437 %438 
                                         f32 %441 = OpFAdd %439 %440 
                                Private f32* %442 = OpAccessChain %160 %340 
                                                      OpStore %442 %441 
                                Private f32* %443 = OpAccessChain %160 %340 
                                         f32 %444 = OpLoad %443 
                                         f32 %445 = OpFDiv %440 %444 
                                Private f32* %446 = OpAccessChain %160 %340 
                                                      OpStore %446 %445 
                                         i32 %449 = OpLoad %405 
                                Uniform f32* %451 = OpAccessChain %25 %34 %449 %450 
                                         f32 %452 = OpLoad %451 
                                        bool %453 = OpFOrdNotEqual %400 %452 
                                                      OpStore %448 %453 
                                         i32 %455 = OpLoad %405 
                                Uniform f32* %456 = OpAccessChain %25 %53 %455 %450 
                                         f32 %457 = OpLoad %456 
                                         f32 %458 = OpLoad %431 
                                        bool %459 = OpFOrdLessThan %457 %458 
                                                      OpStore %454 %459 
                                        bool %460 = OpLoad %454 
                                        bool %461 = OpLoad %448 
                                        bool %462 = OpLogicalAnd %460 %461 
                                                      OpStore %448 %462 
                                         f32 %463 = OpLoad %431 
                                         f32 %465 = OpExtInst %1 40 %463 %464 
                                                      OpStore %431 %465 
                                         f32 %466 = OpLoad %431 
                                         f32 %467 = OpExtInst %1 32 %466 
                                                      OpStore %431 %467 
                                         f32 %468 = OpLoad %431 
                                       f32_3 %469 = OpCompositeConstruct %468 %468 %468 
                                       f32_3 %470 = OpLoad %125 
                                       f32_3 %471 = OpFMul %469 %470 
                                                      OpStore %125 %471 
                                Private f32* %472 = OpAccessChain %160 %340 
                                         f32 %473 = OpLoad %472 
                                         f32 %475 = OpFMul %473 %474 
                                                      OpStore %431 %475 
                                        bool %479 = OpLoad %448 
                                                      OpSelectionMerge %481 None 
                                                      OpBranchConditional %479 %480 %482 
                                             %480 = OpLabel 
                                                      OpStore %478 %400 
                                                      OpBranch %481 
                                             %482 = OpLabel 
                                         f32 %483 = OpLoad %431 
                                                      OpStore %478 %483 
                                                      OpBranch %481 
                                             %481 = OpLabel 
                                         f32 %484 = OpLoad %478 
                                                      OpStore %476 %484 
                                       f32_4 %486 = OpLoad %78 
                                       f32_3 %487 = OpVectorShuffle %486 %486 0 1 2 
                                       f32_3 %488 = OpLoad %125 
                                         f32 %489 = OpDot %487 %488 
                                                      OpStore %485 %489 
                                         f32 %490 = OpLoad %485 
                                         f32 %491 = OpExtInst %1 40 %490 %400 
                                                      OpStore %485 %491 
                                         f32 %493 = OpLoad %485 
                                       f32_3 %494 = OpCompositeConstruct %493 %493 %493 
                              Uniform f32_4* %495 = OpAccessChain %25 %376 
                                       f32_4 %496 = OpLoad %495 
                                       f32_3 %497 = OpVectorShuffle %496 %496 0 1 2 
                                       f32_3 %498 = OpFMul %494 %497 
                                                      OpStore %492 %498 
                                       f32_3 %499 = OpLoad %492 
                                         i32 %500 = OpLoad %405 
                              Uniform f32_4* %501 = OpAccessChain %25 %27 %500 
                                       f32_4 %502 = OpLoad %501 
                                       f32_3 %503 = OpVectorShuffle %502 %502 0 1 2 
                                       f32_3 %504 = OpFMul %499 %503 
                                                      OpStore %492 %504 
                                         f32 %506 = OpLoad %485 
                                        bool %507 = OpFOrdLessThan %400 %506 
                                                      OpStore %505 %507 
                                        bool %508 = OpLoad %505 
                                                      OpSelectionMerge %510 None 
                                                      OpBranchConditional %508 %509 %510 
                                             %509 = OpLabel 
                                       f32_4 %512 = OpLoad %9 
                                       f32_3 %513 = OpVectorShuffle %512 %512 0 1 2 
                                       f32_3 %514 = OpFNegate %513 
                                         f32 %515 = OpLoad %353 
                                       f32_3 %516 = OpCompositeConstruct %515 %515 %515 
                                       f32_3 %517 = OpFMul %514 %516 
                                       f32_3 %518 = OpLoad %125 
                                       f32_3 %519 = OpFAdd %517 %518 
                                                      OpStore %511 %519 
                                       f32_3 %520 = OpLoad %511 
                                       f32_3 %521 = OpLoad %511 
                                         f32 %522 = OpDot %520 %521 
                                                      OpStore %485 %522 
                                         f32 %523 = OpLoad %485 
                                         f32 %524 = OpExtInst %1 32 %523 
                                                      OpStore %485 %524 
                                         f32 %525 = OpLoad %485 
                                       f32_3 %526 = OpCompositeConstruct %525 %525 %525 
                                       f32_3 %527 = OpLoad %511 
                                       f32_3 %528 = OpFMul %526 %527 
                                                      OpStore %511 %528 
                                       f32_4 %529 = OpLoad %78 
                                       f32_3 %530 = OpVectorShuffle %529 %529 0 1 2 
                                       f32_3 %531 = OpLoad %511 
                                         f32 %532 = OpDot %530 %531 
                                                      OpStore %485 %532 
                                         f32 %533 = OpLoad %485 
                                         f32 %534 = OpExtInst %1 40 %533 %400 
                                                      OpStore %485 %534 
                                         f32 %535 = OpLoad %485 
                                         f32 %536 = OpExtInst %1 30 %535 
                                                      OpStore %485 %536 
                                         f32 %537 = OpLoad %390 
                                         f32 %538 = OpLoad %485 
                                         f32 %539 = OpFMul %537 %538 
                                                      OpStore %485 %539 
                                         f32 %540 = OpLoad %485 
                                         f32 %541 = OpExtInst %1 29 %540 
                                                      OpStore %485 %541 
                                         f32 %542 = OpLoad %485 
                                         f32 %543 = OpExtInst %1 37 %542 %440 
                                                      OpStore %485 %543 
                                         f32 %544 = OpLoad %476 
                                         f32 %545 = OpLoad %485 
                                         f32 %546 = OpFMul %544 %545 
                                                      OpStore %485 %546 
                                         f32 %547 = OpLoad %485 
                                       f32_3 %548 = OpCompositeConstruct %547 %547 %547 
                                         i32 %549 = OpLoad %405 
                              Uniform f32_4* %550 = OpAccessChain %25 %27 %549 
                                       f32_4 %551 = OpLoad %550 
                                       f32_3 %552 = OpVectorShuffle %551 %551 0 1 2 
                                       f32_3 %553 = OpFMul %548 %552 
                                       f32_3 %554 = OpLoad %399 
                                       f32_3 %555 = OpFAdd %553 %554 
                                                      OpStore %399 %555 
                                                      OpBranch %510 
                                             %510 = OpLabel 
                                         f32 %556 = OpLoad %476 
                                       f32_3 %557 = OpCompositeConstruct %556 %556 %556 
                                       f32_3 %558 = OpLoad %492 
                                       f32_3 %559 = OpFMul %557 %558 
                                                      OpStore %492 %559 
                                       f32_3 %560 = OpLoad %492 
                                       f32_3 %562 = OpExtInst %1 37 %560 %561 
                                                      OpStore %492 %562 
                                       f32_3 %563 = OpLoad %397 
                                       f32_3 %564 = OpLoad %492 
                                       f32_3 %565 = OpFAdd %563 %564 
                                                      OpStore %397 %565 
                                                      OpBranch %409 
                                             %409 = OpLabel 
                                         i32 %566 = OpLoad %405 
                                         i32 %567 = OpIAdd %566 %34 
                                                      OpStore %405 %567 
                                                      OpBranch %406 
                                             %408 = OpLabel 
                                       f32_3 %570 = OpLoad %399 
                              Uniform f32_4* %572 = OpAccessChain %25 %571 
                                       f32_4 %573 = OpLoad %572 
                                       f32_3 %574 = OpVectorShuffle %573 %573 0 1 2 
                                       f32_3 %575 = OpFMul %570 %574 
                                                      OpStore %569 %575 
                                       f32_3 %576 = OpLoad %569 
                                       f32_3 %577 = OpCompositeConstruct %400 %400 %400 
                                       f32_3 %578 = OpCompositeConstruct %440 %440 %440 
                                       f32_3 %579 = OpExtInst %1 43 %576 %577 %578 
                                                      OpStore %569 %579 
                                       f32_3 %582 = OpLoad %397 
                                       f32_4 %583 = OpLoad %581 
                                       f32_4 %584 = OpVectorShuffle %583 %582 4 5 6 3 
                                                      OpStore %581 %584 
                                       f32_4 %585 = OpLoad %581 
                                       f32_3 %586 = OpVectorShuffle %585 %585 0 1 2 
                                       f32_3 %587 = OpCompositeConstruct %400 %400 %400 
                                       f32_3 %588 = OpCompositeConstruct %440 %440 %440 
                                       f32_3 %589 = OpExtInst %1 43 %586 %587 %588 
                                       f32_4 %590 = OpLoad %581 
                                       f32_4 %591 = OpVectorShuffle %590 %589 4 5 6 3 
                                                      OpStore %581 %591 
                                Uniform f32* %592 = OpAccessChain %25 %376 %450 
                                         f32 %593 = OpLoad %592 
                                 Output f32* %595 = OpAccessChain %581 %450 
                                                      OpStore %595 %593 
                                 Output f32* %596 = OpAccessChain %581 %450 
                                         f32 %597 = OpLoad %596 
                                         f32 %598 = OpExtInst %1 43 %597 %400 %440 
                                 Output f32* %599 = OpAccessChain %581 %450 
                                                      OpStore %599 %598 
                                       f32_3 %604 = OpLoad %603 
                                       f32_2 %605 = OpVectorShuffle %604 %604 0 1 
                              Uniform f32_4* %607 = OpAccessChain %25 %606 
                                       f32_4 %608 = OpLoad %607 
                                       f32_2 %609 = OpVectorShuffle %608 %608 0 1 
                                       f32_2 %610 = OpFMul %605 %609 
                              Uniform f32_4* %611 = OpAccessChain %25 %606 
                                       f32_4 %612 = OpLoad %611 
                                       f32_2 %613 = OpVectorShuffle %612 %612 2 3 
                                       f32_2 %614 = OpFAdd %610 %613 
                                                      OpStore %602 %614 
                                       f32_3 %615 = OpLoad %305 
                                       f32_4 %616 = OpVectorShuffle %615 %615 1 1 1 1 
                              Uniform f32_4* %617 = OpAccessChain %25 %26 %34 
                                       f32_4 %618 = OpLoad %617 
                                       f32_4 %619 = OpFMul %616 %618 
                                                      OpStore %9 %619 
                              Uniform f32_4* %620 = OpAccessChain %25 %26 %27 
                                       f32_4 %621 = OpLoad %620 
                                       f32_3 %622 = OpLoad %305 
                                       f32_4 %623 = OpVectorShuffle %622 %622 0 0 0 0 
                                       f32_4 %624 = OpFMul %621 %623 
                                       f32_4 %625 = OpLoad %9 
                                       f32_4 %626 = OpFAdd %624 %625 
                                                      OpStore %9 %626 
                              Uniform f32_4* %627 = OpAccessChain %25 %26 %53 
                                       f32_4 %628 = OpLoad %627 
                                       f32_3 %629 = OpLoad %305 
                                       f32_4 %630 = OpVectorShuffle %629 %629 2 2 2 2 
                                       f32_4 %631 = OpFMul %628 %630 
                                       f32_4 %632 = OpLoad %9 
                                       f32_4 %633 = OpFAdd %631 %632 
                                                      OpStore %9 %633 
                                       f32_4 %634 = OpLoad %9 
                              Uniform f32_4* %635 = OpAccessChain %25 %26 %26 
                                       f32_4 %636 = OpLoad %635 
                                       f32_4 %637 = OpFAdd %634 %636 
                                                      OpStore %9 %637 
                                       f32_4 %638 = OpLoad %9 
                                       f32_4 %639 = OpVectorShuffle %638 %638 1 1 1 1 
                              Uniform f32_4* %641 = OpAccessChain %25 %640 %34 
                                       f32_4 %642 = OpLoad %641 
                                       f32_4 %643 = OpFMul %639 %642 
                                                      OpStore %78 %643 
                              Uniform f32_4* %644 = OpAccessChain %25 %640 %27 
                                       f32_4 %645 = OpLoad %644 
                                       f32_4 %646 = OpLoad %9 
                                       f32_4 %647 = OpVectorShuffle %646 %646 0 0 0 0 
                                       f32_4 %648 = OpFMul %645 %647 
                                       f32_4 %649 = OpLoad %78 
                                       f32_4 %650 = OpFAdd %648 %649 
                                                      OpStore %78 %650 
                              Uniform f32_4* %651 = OpAccessChain %25 %640 %53 
                                       f32_4 %652 = OpLoad %651 
                                       f32_4 %653 = OpLoad %9 
                                       f32_4 %654 = OpVectorShuffle %653 %653 2 2 2 2 
                                       f32_4 %655 = OpFMul %652 %654 
                                       f32_4 %656 = OpLoad %78 
                                       f32_4 %657 = OpFAdd %655 %656 
                                                      OpStore %78 %657 
                              Uniform f32_4* %662 = OpAccessChain %25 %640 %26 
                                       f32_4 %663 = OpLoad %662 
                                       f32_4 %664 = OpLoad %9 
                                       f32_4 %665 = OpVectorShuffle %664 %664 3 3 3 3 
                                       f32_4 %666 = OpFMul %663 %665 
                                       f32_4 %667 = OpLoad %78 
                                       f32_4 %668 = OpFAdd %666 %667 
                               Output f32_4* %669 = OpAccessChain %661 %27 
                                                      OpStore %669 %668 
                                 Output f32* %670 = OpAccessChain %661 %27 %346 
                                         f32 %671 = OpLoad %670 
                                         f32 %672 = OpFNegate %671 
                                 Output f32* %673 = OpAccessChain %661 %27 %346 
                                                      OpStore %673 %672 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 47
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %25 %30 %36 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %25 Location 25 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %30 Location 30 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %36 Location 36 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %38 RelaxedPrecision 
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
                             Private f32_3* %22 = OpVariable Private 
                                            %24 = OpTypePointer Input %19 
                               Input f32_4* %25 = OpVariable Input 
                                            %29 = OpTypePointer Output %19 
                              Output f32_4* %30 = OpVariable Output 
                                        f32 %32 = OpConstant 3.67402E-40 
                                      f32_3 %33 = OpConstantComposite %32 %32 %32 
                                            %35 = OpTypePointer Input %7 
                               Input f32_3* %36 = OpVariable Input 
                                        f32 %41 = OpConstant 3.67402E-40 
                                            %42 = OpTypeInt 32 0 
                                        u32 %43 = OpConstant 3 
                                            %44 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                    OpStore %9 %21 
                                      f32_3 %23 = OpLoad %9 
                                      f32_4 %26 = OpLoad %25 
                                      f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                      f32_3 %28 = OpFMul %23 %27 
                                                    OpStore %22 %28 
                                      f32_3 %31 = OpLoad %22 
                                      f32_3 %34 = OpFMul %31 %33 
                                      f32_3 %37 = OpLoad %36 
                                      f32_3 %38 = OpFAdd %34 %37 
                                      f32_4 %39 = OpLoad %30 
                                      f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                    OpStore %30 %40 
                                Output f32* %45 = OpAccessChain %30 %43 
                                                    OpStore %45 %41 
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

uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
uniform 	vec4 _SpecColor;
uniform 	vec4 _Emission;
uniform 	float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec3 vs_COLOR1;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat21;
float u_xlat22;
int u_xlati23;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
bool u_xlatb26;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = _Color.xyz * glstate_lightmodel_ambient.xyz + _Emission.xyz;
    u_xlat22 = _Shininess * 128.0;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.y = float(0.0);
    u_xlat4.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat5.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat25 = unity_LightAtten[u_xlati_loop_1].z * u_xlat24 + 1.0;
        u_xlat25 = float(1.0) / u_xlat25;
        u_xlatb26 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb6 = unity_LightAtten[u_xlati_loop_1].w<u_xlat24;
        u_xlatb26 = u_xlatb26 && u_xlatb6;
        u_xlat25 = (u_xlatb26) ? 0.0 : u_xlat25;
        u_xlat24 = max(u_xlat24, 9.99999997e-007);
        u_xlat24 = inversesqrt(u_xlat24);
        u_xlat5.xyz = vec3(u_xlat24) * u_xlat5.xyz;
        u_xlat24 = dot(u_xlat5.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat24 = max(u_xlat24, 0.0);
        u_xlat24 = u_xlat24 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat24 = u_xlat24 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
        u_xlat24 = u_xlat24 * u_xlat25;
        u_xlat24 = u_xlat24 * 0.5;
        u_xlat25 = dot(u_xlat1.xyz, u_xlat5.xyz);
        u_xlat25 = max(u_xlat25, 0.0);
        u_xlat6.xyz = vec3(u_xlat25) * _Color.xyz;
        u_xlat6.xyz = u_xlat6.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb25 = 0.0<u_xlat25;
        if(u_xlatb25){
            u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + u_xlat5.xyz;
            u_xlat25 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat25 = inversesqrt(u_xlat25);
            u_xlat5.xyz = vec3(u_xlat25) * u_xlat5.xyz;
            u_xlat25 = dot(u_xlat1.xyz, u_xlat5.xyz);
            u_xlat25 = max(u_xlat25, 0.0);
            u_xlat25 = log2(u_xlat25);
            u_xlat25 = u_xlat22 * u_xlat25;
            u_xlat25 = exp2(u_xlat25);
            u_xlat25 = min(u_xlat25, 1.0);
            u_xlat25 = u_xlat24 * u_xlat25;
            u_xlat4.xyz = vec3(u_xlat25) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat4.xyz;
        //ENDIF
        }
        u_xlat5.xyz = vec3(u_xlat24) * u_xlat6.xyz;
        u_xlat5.xyz = min(u_xlat5.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat3.xyz = u_xlat3.xyz + u_xlat5.xyz;
    }
    vs_COLOR1.xyz = u_xlat4.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat3.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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

uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec3 vs_COLOR1;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 704
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %307 %339 %595 %607 %628 %629 %687 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpMemberDecorate %24 0 RelaxedPrecision 
                                                      OpMemberDecorate %24 0 Offset 24 
                                                      OpMemberDecorate %24 1 Offset 24 
                                                      OpMemberDecorate %24 2 RelaxedPrecision 
                                                      OpMemberDecorate %24 2 Offset 24 
                                                      OpMemberDecorate %24 3 Offset 24 
                                                      OpMemberDecorate %24 4 Offset 24 
                                                      OpMemberDecorate %24 5 Offset 24 
                                                      OpMemberDecorate %24 6 RelaxedPrecision 
                                                      OpMemberDecorate %24 6 Offset 24 
                                                      OpMemberDecorate %24 7 Offset 24 
                                                      OpMemberDecorate %24 8 Offset 24 
                                                      OpMemberDecorate %24 9 Offset 24 
                                                      OpMemberDecorate %24 10 RelaxedPrecision 
                                                      OpMemberDecorate %24 10 Offset 24 
                                                      OpMemberDecorate %24 11 RelaxedPrecision 
                                                      OpMemberDecorate %24 11 Offset 24 
                                                      OpMemberDecorate %24 12 RelaxedPrecision 
                                                      OpMemberDecorate %24 12 Offset 24 
                                                      OpMemberDecorate %24 13 RelaxedPrecision 
                                                      OpMemberDecorate %24 13 Offset 24 
                                                      OpMemberDecorate %24 14 Offset 24 
                                                      OpMemberDecorate %24 15 Offset 24 
                                                      OpDecorate %24 Block 
                                                      OpDecorate %26 DescriptorSet 26 
                                                      OpDecorate %26 Binding 26 
                                                      OpDecorate %307 Location 307 
                                                      OpDecorate %339 Location 339 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %381 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %386 RelaxedPrecision 
                                                      OpDecorate %389 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %391 RelaxedPrecision 
                                                      OpDecorate %392 RelaxedPrecision 
                                                      OpDecorate %396 RelaxedPrecision 
                                                      OpDecorate %398 RelaxedPrecision 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %401 RelaxedPrecision 
                                                      OpDecorate %439 RelaxedPrecision 
                                                      OpDecorate %459 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %492 RelaxedPrecision 
                                                      OpDecorate %496 RelaxedPrecision 
                                                      OpDecorate %497 RelaxedPrecision 
                                                      OpDecorate %499 RelaxedPrecision 
                                                      OpDecorate %502 RelaxedPrecision 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %504 RelaxedPrecision 
                                                      OpDecorate %505 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %507 RelaxedPrecision 
                                                      OpDecorate %508 RelaxedPrecision 
                                                      OpDecorate %509 RelaxedPrecision 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %516 RelaxedPrecision 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %518 RelaxedPrecision 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %522 RelaxedPrecision 
                                                      OpDecorate %523 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %525 RelaxedPrecision 
                                                      OpDecorate %528 RelaxedPrecision 
                                                      OpDecorate %529 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %537 RelaxedPrecision 
                                                      OpDecorate %546 RelaxedPrecision 
                                                      OpDecorate %547 RelaxedPrecision 
                                                      OpDecorate %548 RelaxedPrecision 
                                                      OpDecorate %549 RelaxedPrecision 
                                                      OpDecorate %550 RelaxedPrecision 
                                                      OpDecorate %551 RelaxedPrecision 
                                                      OpDecorate %552 RelaxedPrecision 
                                                      OpDecorate %553 RelaxedPrecision 
                                                      OpDecorate %554 RelaxedPrecision 
                                                      OpDecorate %557 RelaxedPrecision 
                                                      OpDecorate %559 RelaxedPrecision 
                                                      OpDecorate %560 RelaxedPrecision 
                                                      OpDecorate %561 RelaxedPrecision 
                                                      OpDecorate %562 RelaxedPrecision 
                                                      OpDecorate %563 RelaxedPrecision 
                                                      OpDecorate %564 RelaxedPrecision 
                                                      OpDecorate %565 RelaxedPrecision 
                                                      OpDecorate %566 RelaxedPrecision 
                                                      OpDecorate %567 RelaxedPrecision 
                                                      OpDecorate %568 RelaxedPrecision 
                                                      OpDecorate %569 RelaxedPrecision 
                                                      OpDecorate %570 RelaxedPrecision 
                                                      OpDecorate %571 RelaxedPrecision 
                                                      OpDecorate %572 RelaxedPrecision 
                                                      OpDecorate %573 RelaxedPrecision 
                                                      OpDecorate %574 RelaxedPrecision 
                                                      OpDecorate %577 RelaxedPrecision 
                                                      OpDecorate %578 RelaxedPrecision 
                                                      OpDecorate %579 RelaxedPrecision 
                                                      OpDecorate %580 RelaxedPrecision 
                                                      OpDecorate %581 RelaxedPrecision 
                                                      OpDecorate %582 RelaxedPrecision 
                                                      OpDecorate %583 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %585 RelaxedPrecision 
                                                      OpDecorate %586 RelaxedPrecision 
                                                      OpDecorate %588 RelaxedPrecision 
                                                      OpDecorate %589 RelaxedPrecision 
                                                      OpDecorate %590 RelaxedPrecision 
                                                      OpDecorate %591 RelaxedPrecision 
                                                      OpDecorate %595 RelaxedPrecision 
                                                      OpDecorate %595 Location 595 
                                                      OpDecorate %596 RelaxedPrecision 
                                                      OpDecorate %599 RelaxedPrecision 
                                                      OpDecorate %600 RelaxedPrecision 
                                                      OpDecorate %601 RelaxedPrecision 
                                                      OpDecorate %602 RelaxedPrecision 
                                                      OpDecorate %603 RelaxedPrecision 
                                                      OpDecorate %604 RelaxedPrecision 
                                                      OpDecorate %605 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                                      OpDecorate %607 Location 607 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %611 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %613 RelaxedPrecision 
                                                      OpDecorate %614 RelaxedPrecision 
                                                      OpDecorate %615 RelaxedPrecision 
                                                      OpDecorate %619 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                                      OpDecorate %624 RelaxedPrecision 
                                                      OpDecorate %628 Location 628 
                                                      OpDecorate %629 Location 629 
                                                      OpMemberDecorate %685 0 BuiltIn 685 
                                                      OpMemberDecorate %685 1 BuiltIn 685 
                                                      OpMemberDecorate %685 2 BuiltIn 685 
                                                      OpDecorate %685 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeArray %7 %11 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeArray %7 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeInt 32 1 
                                              %23 = OpTypeVector %22 4 
                                              %24 = OpTypeStruct %12 %13 %14 %15 %17 %18 %7 %19 %20 %21 %7 %7 %7 %6 %23 %7 
                                              %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32; i32_4; f32_4;}* %26 = OpVariable Uniform 
                                          i32 %27 = OpConstant 4 
                                          i32 %28 = OpConstant 0 
                                              %29 = OpTypeVector %6 3 
                                              %30 = OpTypePointer Uniform %7 
                                          i32 %34 = OpConstant 7 
                                          i32 %35 = OpConstant 1 
                                          i32 %54 = OpConstant 2 
                                          i32 %67 = OpConstant 3 
                               Private f32_4* %80 = OpVariable Private 
                                             %126 = OpTypePointer Private %29 
                              Private f32_3* %127 = OpVariable Private 
                              Private f32_3* %162 = OpVariable Private 
                              Private f32_3* %197 = OpVariable Private 
                                         i32 %198 = OpConstant 5 
                                         i32 %202 = OpConstant 8 
                              Private f32_3* %234 = OpVariable Private 
                              Private f32_3* %269 = OpVariable Private 
                                             %306 = OpTypePointer Input %29 
                                Input f32_3* %307 = OpVariable Input 
                                Input f32_3* %339 = OpVariable Input 
                                         u32 %342 = OpConstant 0 
                                             %343 = OpTypePointer Private %6 
                                         u32 %348 = OpConstant 1 
                                         u32 %353 = OpConstant 2 
                                Private f32* %355 = OpVariable Private 
                              Private f32_3* %377 = OpVariable Private 
                                         i32 %378 = OpConstant 10 
                                         i32 %382 = OpConstant 6 
                                         i32 %387 = OpConstant 12 
                                Private f32* %392 = OpVariable Private 
                                         i32 %393 = OpConstant 13 
                                             %394 = OpTypePointer Uniform %6 
                                         f32 %397 = OpConstant 3.67402E-40 
                              Private f32_3* %399 = OpVariable Private 
                              Private f32_3* %401 = OpVariable Private 
                                         f32 %402 = OpConstant 3.67402E-40 
                                             %406 = OpTypePointer Function %22 
                                         i32 %414 = OpConstant 14 
                                             %415 = OpTypePointer Uniform %22 
                                             %418 = OpTypeBool 
                                Private f32* %433 = OpVariable Private 
                                         f32 %442 = OpConstant 3.67402E-40 
                                             %449 = OpTypePointer Private %418 
                               Private bool* %450 = OpVariable Private 
                                         u32 %452 = OpConstant 3 
                               Private bool* %456 = OpVariable Private 
                                Private f32* %465 = OpVariable Private 
                                             %466 = OpTypePointer Function %6 
                                         f32 %476 = OpConstant 3.67402E-40 
                                Private f32* %492 = OpVariable Private 
                                         f32 %510 = OpConstant 3.67402E-40 
                              Private f32_3* %518 = OpVariable Private 
                               Private bool* %531 = OpVariable Private 
                              Private f32_3* %537 = OpVariable Private 
                                       f32_3 %587 = OpConstantComposite %442 %442 %442 
                                             %594 = OpTypePointer Output %29 
                               Output f32_3* %595 = OpVariable Output 
                                         i32 %597 = OpConstant 11 
                                             %606 = OpTypePointer Output %7 
                               Output f32_4* %607 = OpVariable Output 
                                             %620 = OpTypePointer Output %6 
                                             %626 = OpTypeVector %6 2 
                                             %627 = OpTypePointer Output %626 
                               Output f32_2* %628 = OpVariable Output 
                                Input f32_3* %629 = OpVariable Input 
                                         i32 %632 = OpConstant 15 
                                         i32 %666 = OpConstant 9 
                                             %684 = OpTypeArray %6 %348 
                                             %685 = OpTypeStruct %7 %6 %684 
                                             %686 = OpTypePointer Output %685 
        Output struct {f32_4; f32; f32[1];}* %687 = OpVariable Output 
                               Private bool* %701 = OpVariable Private 
                                             %702 = OpTypePointer Private %22 
                                Private i32* %703 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %407 = OpVariable Function 
                               Function f32* %467 = OpVariable Function 
                               Uniform f32_4* %31 = OpAccessChain %26 %27 %28 
                                        f32_4 %32 = OpLoad %31 
                                        f32_3 %33 = OpVectorShuffle %32 %32 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %26 %34 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFMul %33 %38 
                                        f32_4 %40 = OpLoad %9 
                                        f32_4 %41 = OpVectorShuffle %40 %39 4 5 6 3 
                                                      OpStore %9 %41 
                               Uniform f32_4* %42 = OpAccessChain %26 %34 %28 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                               Uniform f32_4* %45 = OpAccessChain %26 %27 %28 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 0 0 
                                        f32_3 %48 = OpFMul %44 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFAdd %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpVectorShuffle %52 %51 4 5 6 3 
                                                      OpStore %9 %53 
                               Uniform f32_4* %55 = OpAccessChain %26 %34 %54 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                               Uniform f32_4* %58 = OpAccessChain %26 %27 %28 
                                        f32_4 %59 = OpLoad %58 
                                        f32_3 %60 = OpVectorShuffle %59 %59 2 2 2 
                                        f32_3 %61 = OpFMul %57 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFAdd %61 %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                      OpStore %9 %66 
                               Uniform f32_4* %68 = OpAccessChain %26 %34 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               Uniform f32_4* %71 = OpAccessChain %26 %27 %28 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
                                        f32_3 %74 = OpFMul %70 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFAdd %74 %76 
                                        f32_4 %78 = OpLoad %9 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %9 %79 
                               Uniform f32_4* %81 = OpAccessChain %26 %27 %35 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 1 1 1 
                               Uniform f32_4* %84 = OpAccessChain %26 %34 %35 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFMul %83 %86 
                                        f32_4 %88 = OpLoad %80 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %80 %89 
                               Uniform f32_4* %90 = OpAccessChain %26 %34 %28 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                               Uniform f32_4* %93 = OpAccessChain %26 %27 %35 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 0 0 
                                        f32_3 %96 = OpFMul %92 %95 
                                        f32_4 %97 = OpLoad %80 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %80 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                                      OpStore %80 %101 
                              Uniform f32_4* %102 = OpAccessChain %26 %34 %54 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                              Uniform f32_4* %105 = OpAccessChain %26 %27 %35 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 2 2 2 
                                       f32_3 %108 = OpFMul %104 %107 
                                       f32_4 %109 = OpLoad %80 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %80 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %80 %113 
                              Uniform f32_4* %114 = OpAccessChain %26 %34 %67 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                              Uniform f32_4* %117 = OpAccessChain %26 %27 %35 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 3 3 3 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %80 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %80 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %80 %125 
                              Uniform f32_4* %128 = OpAccessChain %26 %27 %54 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                              Uniform f32_4* %131 = OpAccessChain %26 %34 %35 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %130 %133 
                                                      OpStore %127 %134 
                              Uniform f32_4* %135 = OpAccessChain %26 %34 %28 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                              Uniform f32_4* %138 = OpAccessChain %26 %27 %54 
                                       f32_4 %139 = OpLoad %138 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 0 0 
                                       f32_3 %141 = OpFMul %137 %140 
                                       f32_3 %142 = OpLoad %127 
                                       f32_3 %143 = OpFAdd %141 %142 
                                                      OpStore %127 %143 
                              Uniform f32_4* %144 = OpAccessChain %26 %34 %54 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                              Uniform f32_4* %147 = OpAccessChain %26 %27 %54 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 2 2 2 
                                       f32_3 %150 = OpFMul %146 %149 
                                       f32_3 %151 = OpLoad %127 
                                       f32_3 %152 = OpFAdd %150 %151 
                                                      OpStore %127 %152 
                              Uniform f32_4* %153 = OpAccessChain %26 %34 %67 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                              Uniform f32_4* %156 = OpAccessChain %26 %27 %54 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 3 3 3 
                                       f32_3 %159 = OpFMul %155 %158 
                                       f32_3 %160 = OpLoad %127 
                                       f32_3 %161 = OpFAdd %159 %160 
                                                      OpStore %127 %161 
                              Uniform f32_4* %163 = OpAccessChain %26 %27 %67 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 1 1 1 
                              Uniform f32_4* %166 = OpAccessChain %26 %34 %35 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %165 %168 
                                                      OpStore %162 %169 
                              Uniform f32_4* %170 = OpAccessChain %26 %34 %28 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_4* %173 = OpAccessChain %26 %27 %67 
                                       f32_4 %174 = OpLoad %173 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 0 0 
                                       f32_3 %176 = OpFMul %172 %175 
                                       f32_3 %177 = OpLoad %162 
                                       f32_3 %178 = OpFAdd %176 %177 
                                                      OpStore %162 %178 
                              Uniform f32_4* %179 = OpAccessChain %26 %34 %54 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                              Uniform f32_4* %182 = OpAccessChain %26 %27 %67 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 2 2 2 
                                       f32_3 %185 = OpFMul %181 %184 
                                       f32_3 %186 = OpLoad %162 
                                       f32_3 %187 = OpFAdd %185 %186 
                                                      OpStore %162 %187 
                              Uniform f32_4* %188 = OpAccessChain %26 %34 %67 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_4* %191 = OpAccessChain %26 %27 %67 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 3 3 3 
                                       f32_3 %194 = OpFMul %190 %193 
                                       f32_3 %195 = OpLoad %162 
                                       f32_3 %196 = OpFAdd %194 %195 
                                                      OpStore %162 %196 
                              Uniform f32_4* %199 = OpAccessChain %26 %198 %35 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                              Uniform f32_4* %203 = OpAccessChain %26 %202 %28 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 1 1 1 
                                       f32_3 %206 = OpFMul %201 %205 
                                                      OpStore %197 %206 
                              Uniform f32_4* %207 = OpAccessChain %26 %198 %28 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                              Uniform f32_4* %210 = OpAccessChain %26 %202 %28 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 0 0 
                                       f32_3 %213 = OpFMul %209 %212 
                                       f32_3 %214 = OpLoad %197 
                                       f32_3 %215 = OpFAdd %213 %214 
                                                      OpStore %197 %215 
                              Uniform f32_4* %216 = OpAccessChain %26 %198 %54 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                              Uniform f32_4* %219 = OpAccessChain %26 %202 %28 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 2 2 2 
                                       f32_3 %222 = OpFMul %218 %221 
                                       f32_3 %223 = OpLoad %197 
                                       f32_3 %224 = OpFAdd %222 %223 
                                                      OpStore %197 %224 
                              Uniform f32_4* %225 = OpAccessChain %26 %198 %67 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                              Uniform f32_4* %228 = OpAccessChain %26 %202 %28 
                                       f32_4 %229 = OpLoad %228 
                                       f32_3 %230 = OpVectorShuffle %229 %229 3 3 3 
                                       f32_3 %231 = OpFMul %227 %230 
                                       f32_3 %232 = OpLoad %197 
                                       f32_3 %233 = OpFAdd %231 %232 
                                                      OpStore %197 %233 
                              Uniform f32_4* %235 = OpAccessChain %26 %198 %35 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                              Uniform f32_4* %238 = OpAccessChain %26 %202 %35 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 1 1 1 
                                       f32_3 %241 = OpFMul %237 %240 
                                                      OpStore %234 %241 
                              Uniform f32_4* %242 = OpAccessChain %26 %198 %28 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                              Uniform f32_4* %245 = OpAccessChain %26 %202 %35 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 0 0 
                                       f32_3 %248 = OpFMul %244 %247 
                                       f32_3 %249 = OpLoad %234 
                                       f32_3 %250 = OpFAdd %248 %249 
                                                      OpStore %234 %250 
                              Uniform f32_4* %251 = OpAccessChain %26 %198 %54 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %26 %202 %35 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 2 2 2 
                                       f32_3 %257 = OpFMul %253 %256 
                                       f32_3 %258 = OpLoad %234 
                                       f32_3 %259 = OpFAdd %257 %258 
                                                      OpStore %234 %259 
                              Uniform f32_4* %260 = OpAccessChain %26 %198 %67 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                              Uniform f32_4* %263 = OpAccessChain %26 %202 %35 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 3 3 3 
                                       f32_3 %266 = OpFMul %262 %265 
                                       f32_3 %267 = OpLoad %234 
                                       f32_3 %268 = OpFAdd %266 %267 
                                                      OpStore %234 %268 
                              Uniform f32_4* %270 = OpAccessChain %26 %198 %35 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                              Uniform f32_4* %273 = OpAccessChain %26 %202 %54 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 1 1 1 
                                       f32_3 %276 = OpFMul %272 %275 
                                                      OpStore %269 %276 
                              Uniform f32_4* %277 = OpAccessChain %26 %198 %28 
                                       f32_4 %278 = OpLoad %277 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                              Uniform f32_4* %280 = OpAccessChain %26 %202 %54 
                                       f32_4 %281 = OpLoad %280 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 0 
                                       f32_3 %283 = OpFMul %279 %282 
                                       f32_3 %284 = OpLoad %269 
                                       f32_3 %285 = OpFAdd %283 %284 
                                                      OpStore %269 %285 
                              Uniform f32_4* %286 = OpAccessChain %26 %198 %54 
                                       f32_4 %287 = OpLoad %286 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                              Uniform f32_4* %289 = OpAccessChain %26 %202 %54 
                                       f32_4 %290 = OpLoad %289 
                                       f32_3 %291 = OpVectorShuffle %290 %290 2 2 2 
                                       f32_3 %292 = OpFMul %288 %291 
                                       f32_3 %293 = OpLoad %269 
                                       f32_3 %294 = OpFAdd %292 %293 
                                                      OpStore %269 %294 
                              Uniform f32_4* %295 = OpAccessChain %26 %198 %67 
                                       f32_4 %296 = OpLoad %295 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                              Uniform f32_4* %298 = OpAccessChain %26 %202 %54 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpVectorShuffle %299 %299 3 3 3 
                                       f32_3 %301 = OpFMul %297 %300 
                                       f32_3 %302 = OpLoad %269 
                                       f32_3 %303 = OpFAdd %301 %302 
                                                      OpStore %269 %303 
                                       f32_4 %304 = OpLoad %80 
                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                                       f32_3 %308 = OpLoad %307 
                                       f32_3 %309 = OpVectorShuffle %308 %308 1 1 1 
                                       f32_3 %310 = OpFMul %305 %309 
                                       f32_4 %311 = OpLoad %80 
                                       f32_4 %312 = OpVectorShuffle %311 %310 4 5 6 3 
                                                      OpStore %80 %312 
                                       f32_4 %313 = OpLoad %9 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                                       f32_3 %315 = OpLoad %307 
                                       f32_3 %316 = OpVectorShuffle %315 %315 0 0 0 
                                       f32_3 %317 = OpFMul %314 %316 
                                       f32_4 %318 = OpLoad %80 
                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                                       f32_3 %320 = OpFAdd %317 %319 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                                      OpStore %9 %322 
                                       f32_3 %323 = OpLoad %127 
                                       f32_3 %324 = OpLoad %307 
                                       f32_3 %325 = OpVectorShuffle %324 %324 2 2 2 
                                       f32_3 %326 = OpFMul %323 %325 
                                       f32_4 %327 = OpLoad %9 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
                                       f32_3 %329 = OpFAdd %326 %328 
                                       f32_4 %330 = OpLoad %9 
                                       f32_4 %331 = OpVectorShuffle %330 %329 4 5 6 3 
                                                      OpStore %9 %331 
                                       f32_3 %332 = OpLoad %162 
                                       f32_4 %333 = OpLoad %9 
                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
                                       f32_3 %335 = OpFAdd %332 %334 
                                       f32_4 %336 = OpLoad %9 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %9 %337 
                                       f32_3 %338 = OpLoad %197 
                                       f32_3 %340 = OpLoad %339 
                                         f32 %341 = OpDot %338 %340 
                                Private f32* %344 = OpAccessChain %80 %342 
                                                      OpStore %344 %341 
                                       f32_3 %345 = OpLoad %234 
                                       f32_3 %346 = OpLoad %339 
                                         f32 %347 = OpDot %345 %346 
                                Private f32* %349 = OpAccessChain %80 %348 
                                                      OpStore %349 %347 
                                       f32_3 %350 = OpLoad %269 
                                       f32_3 %351 = OpLoad %339 
                                         f32 %352 = OpDot %350 %351 
                                Private f32* %354 = OpAccessChain %80 %353 
                                                      OpStore %354 %352 
                                       f32_4 %356 = OpLoad %80 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_4 %358 = OpLoad %80 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                         f32 %360 = OpDot %357 %359 
                                                      OpStore %355 %360 
                                         f32 %361 = OpLoad %355 
                                         f32 %362 = OpExtInst %1 32 %361 
                                                      OpStore %355 %362 
                                         f32 %363 = OpLoad %355 
                                       f32_3 %364 = OpCompositeConstruct %363 %363 %363 
                                       f32_4 %365 = OpLoad %80 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_3 %367 = OpFMul %364 %366 
                                       f32_4 %368 = OpLoad %80 
                                       f32_4 %369 = OpVectorShuffle %368 %367 4 5 6 3 
                                                      OpStore %80 %369 
                                       f32_4 %370 = OpLoad %9 
                                       f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
                                       f32_4 %372 = OpLoad %9 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                         f32 %374 = OpDot %371 %373 
                                                      OpStore %355 %374 
                                         f32 %375 = OpLoad %355 
                                         f32 %376 = OpExtInst %1 32 %375 
                                                      OpStore %355 %376 
                              Uniform f32_4* %379 = OpAccessChain %26 %378 
                                       f32_4 %380 = OpLoad %379 
                                       f32_3 %381 = OpVectorShuffle %380 %380 0 1 2 
                              Uniform f32_4* %383 = OpAccessChain %26 %382 
                                       f32_4 %384 = OpLoad %383 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
                                       f32_3 %386 = OpFMul %381 %385 
                              Uniform f32_4* %388 = OpAccessChain %26 %387 
                                       f32_4 %389 = OpLoad %388 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                       f32_3 %391 = OpFAdd %386 %390 
                                                      OpStore %377 %391 
                                Uniform f32* %395 = OpAccessChain %26 %393 
                                         f32 %396 = OpLoad %395 
                                         f32 %398 = OpFMul %396 %397 
                                                      OpStore %392 %398 
                                       f32_3 %400 = OpLoad %377 
                                                      OpStore %399 %400 
                                Private f32* %403 = OpAccessChain %401 %342 
                                                      OpStore %403 %402 
                                Private f32* %404 = OpAccessChain %401 %348 
                                                      OpStore %404 %402 
                                Private f32* %405 = OpAccessChain %401 %353 
                                                      OpStore %405 %402 
                                                      OpStore %407 %28 
                                                      OpBranch %408 
                                             %408 = OpLabel 
                                                      OpLoopMerge %410 %411 None 
                                                      OpBranch %412 
                                             %412 = OpLabel 
                                         i32 %413 = OpLoad %407 
                                Uniform i32* %416 = OpAccessChain %26 %414 %342 
                                         i32 %417 = OpLoad %416 
                                        bool %419 = OpSLessThan %413 %417 
                                                      OpBranchConditional %419 %409 %410 
                                             %409 = OpLabel 
                                       f32_4 %420 = OpLoad %9 
                                       f32_3 %421 = OpVectorShuffle %420 %420 0 1 2 
                                       f32_3 %422 = OpFNegate %421 
                                         i32 %423 = OpLoad %407 
                              Uniform f32_4* %424 = OpAccessChain %26 %35 %423 
                                       f32_4 %425 = OpLoad %424 
                                       f32_3 %426 = OpVectorShuffle %425 %425 3 3 3 
                                       f32_3 %427 = OpFMul %422 %426 
                                         i32 %428 = OpLoad %407 
                              Uniform f32_4* %429 = OpAccessChain %26 %35 %428 
                                       f32_4 %430 = OpLoad %429 
                                       f32_3 %431 = OpVectorShuffle %430 %430 0 1 2 
                                       f32_3 %432 = OpFAdd %427 %431 
                                                      OpStore %127 %432 
                                       f32_3 %434 = OpLoad %127 
                                       f32_3 %435 = OpLoad %127 
                                         f32 %436 = OpDot %434 %435 
                                                      OpStore %433 %436 
                                         i32 %437 = OpLoad %407 
                                Uniform f32* %438 = OpAccessChain %26 %54 %437 %353 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpLoad %433 
                                         f32 %441 = OpFMul %439 %440 
                                         f32 %443 = OpFAdd %441 %442 
                                Private f32* %444 = OpAccessChain %162 %342 
                                                      OpStore %444 %443 
                                Private f32* %445 = OpAccessChain %162 %342 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpFDiv %442 %446 
                                Private f32* %448 = OpAccessChain %162 %342 
                                                      OpStore %448 %447 
                                         i32 %451 = OpLoad %407 
                                Uniform f32* %453 = OpAccessChain %26 %35 %451 %452 
                                         f32 %454 = OpLoad %453 
                                        bool %455 = OpFOrdNotEqual %402 %454 
                                                      OpStore %450 %455 
                                         i32 %457 = OpLoad %407 
                                Uniform f32* %458 = OpAccessChain %26 %54 %457 %452 
                                         f32 %459 = OpLoad %458 
                                         f32 %460 = OpLoad %433 
                                        bool %461 = OpFOrdLessThan %459 %460 
                                                      OpStore %456 %461 
                                        bool %462 = OpLoad %456 
                                        bool %463 = OpLoad %450 
                                        bool %464 = OpLogicalAnd %462 %463 
                                                      OpStore %450 %464 
                                        bool %468 = OpLoad %450 
                                                      OpSelectionMerge %470 None 
                                                      OpBranchConditional %468 %469 %471 
                                             %469 = OpLabel 
                                                      OpStore %467 %402 
                                                      OpBranch %470 
                                             %471 = OpLabel 
                                Private f32* %472 = OpAccessChain %162 %342 
                                         f32 %473 = OpLoad %472 
                                                      OpStore %467 %473 
                                                      OpBranch %470 
                                             %470 = OpLabel 
                                         f32 %474 = OpLoad %467 
                                                      OpStore %465 %474 
                                         f32 %475 = OpLoad %433 
                                         f32 %477 = OpExtInst %1 40 %475 %476 
                                                      OpStore %433 %477 
                                         f32 %478 = OpLoad %433 
                                         f32 %479 = OpExtInst %1 32 %478 
                                                      OpStore %433 %479 
                                         f32 %480 = OpLoad %433 
                                       f32_3 %481 = OpCompositeConstruct %480 %480 %480 
                                       f32_3 %482 = OpLoad %127 
                                       f32_3 %483 = OpFMul %481 %482 
                                                      OpStore %127 %483 
                                       f32_3 %484 = OpLoad %127 
                                         i32 %485 = OpLoad %407 
                              Uniform f32_4* %486 = OpAccessChain %26 %67 %485 
                                       f32_4 %487 = OpLoad %486 
                                       f32_3 %488 = OpVectorShuffle %487 %487 0 1 2 
                                         f32 %489 = OpDot %484 %488 
                                                      OpStore %433 %489 
                                         f32 %490 = OpLoad %433 
                                         f32 %491 = OpExtInst %1 40 %490 %402 
                                                      OpStore %433 %491 
                                         f32 %493 = OpLoad %433 
                                         i32 %494 = OpLoad %407 
                                Uniform f32* %495 = OpAccessChain %26 %54 %494 %342 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpFNegate %496 
                                         f32 %498 = OpFAdd %493 %497 
                                                      OpStore %492 %498 
                                         f32 %499 = OpLoad %492 
                                         i32 %500 = OpLoad %407 
                                Uniform f32* %501 = OpAccessChain %26 %54 %500 %348 
                                         f32 %502 = OpLoad %501 
                                         f32 %503 = OpFMul %499 %502 
                                                      OpStore %492 %503 
                                         f32 %504 = OpLoad %492 
                                         f32 %505 = OpExtInst %1 43 %504 %402 %442 
                                                      OpStore %492 %505 
                                         f32 %506 = OpLoad %465 
                                         f32 %507 = OpLoad %492 
                                         f32 %508 = OpFMul %506 %507 
                                                      OpStore %465 %508 
                                         f32 %509 = OpLoad %465 
                                         f32 %511 = OpFMul %509 %510 
                                                      OpStore %465 %511 
                                       f32_4 %512 = OpLoad %80 
                                       f32_3 %513 = OpVectorShuffle %512 %512 0 1 2 
                                       f32_3 %514 = OpLoad %127 
                                         f32 %515 = OpDot %513 %514 
                                                      OpStore %492 %515 
                                         f32 %516 = OpLoad %492 
                                         f32 %517 = OpExtInst %1 40 %516 %402 
                                                      OpStore %492 %517 
                                         f32 %519 = OpLoad %492 
                                       f32_3 %520 = OpCompositeConstruct %519 %519 %519 
                              Uniform f32_4* %521 = OpAccessChain %26 %378 
                                       f32_4 %522 = OpLoad %521 
                                       f32_3 %523 = OpVectorShuffle %522 %522 0 1 2 
                                       f32_3 %524 = OpFMul %520 %523 
                                                      OpStore %518 %524 
                                       f32_3 %525 = OpLoad %518 
                                         i32 %526 = OpLoad %407 
                              Uniform f32_4* %527 = OpAccessChain %26 %28 %526 
                                       f32_4 %528 = OpLoad %527 
                                       f32_3 %529 = OpVectorShuffle %528 %528 0 1 2 
                                       f32_3 %530 = OpFMul %525 %529 
                                                      OpStore %518 %530 
                                         f32 %532 = OpLoad %492 
                                        bool %533 = OpFOrdLessThan %402 %532 
                                                      OpStore %531 %533 
                                        bool %534 = OpLoad %531 
                                                      OpSelectionMerge %536 None 
                                                      OpBranchConditional %534 %535 %536 
                                             %535 = OpLabel 
                                       f32_4 %538 = OpLoad %9 
                                       f32_3 %539 = OpVectorShuffle %538 %538 0 1 2 
                                       f32_3 %540 = OpFNegate %539 
                                         f32 %541 = OpLoad %355 
                                       f32_3 %542 = OpCompositeConstruct %541 %541 %541 
                                       f32_3 %543 = OpFMul %540 %542 
                                       f32_3 %544 = OpLoad %127 
                                       f32_3 %545 = OpFAdd %543 %544 
                                                      OpStore %537 %545 
                                       f32_3 %546 = OpLoad %537 
                                       f32_3 %547 = OpLoad %537 
                                         f32 %548 = OpDot %546 %547 
                                                      OpStore %492 %548 
                                         f32 %549 = OpLoad %492 
                                         f32 %550 = OpExtInst %1 32 %549 
                                                      OpStore %492 %550 
                                         f32 %551 = OpLoad %492 
                                       f32_3 %552 = OpCompositeConstruct %551 %551 %551 
                                       f32_3 %553 = OpLoad %537 
                                       f32_3 %554 = OpFMul %552 %553 
                                                      OpStore %537 %554 
                                       f32_4 %555 = OpLoad %80 
                                       f32_3 %556 = OpVectorShuffle %555 %555 0 1 2 
                                       f32_3 %557 = OpLoad %537 
                                         f32 %558 = OpDot %556 %557 
                                                      OpStore %492 %558 
                                         f32 %559 = OpLoad %492 
                                         f32 %560 = OpExtInst %1 40 %559 %402 
                                                      OpStore %492 %560 
                                         f32 %561 = OpLoad %492 
                                         f32 %562 = OpExtInst %1 30 %561 
                                                      OpStore %492 %562 
                                         f32 %563 = OpLoad %392 
                                         f32 %564 = OpLoad %492 
                                         f32 %565 = OpFMul %563 %564 
                                                      OpStore %492 %565 
                                         f32 %566 = OpLoad %492 
                                         f32 %567 = OpExtInst %1 29 %566 
                                                      OpStore %492 %567 
                                         f32 %568 = OpLoad %492 
                                         f32 %569 = OpExtInst %1 37 %568 %442 
                                                      OpStore %492 %569 
                                         f32 %570 = OpLoad %465 
                                         f32 %571 = OpLoad %492 
                                         f32 %572 = OpFMul %570 %571 
                                                      OpStore %492 %572 
                                         f32 %573 = OpLoad %492 
                                       f32_3 %574 = OpCompositeConstruct %573 %573 %573 
                                         i32 %575 = OpLoad %407 
                              Uniform f32_4* %576 = OpAccessChain %26 %28 %575 
                                       f32_4 %577 = OpLoad %576 
                                       f32_3 %578 = OpVectorShuffle %577 %577 0 1 2 
                                       f32_3 %579 = OpFMul %574 %578 
                                       f32_3 %580 = OpLoad %401 
                                       f32_3 %581 = OpFAdd %579 %580 
                                                      OpStore %401 %581 
                                                      OpBranch %536 
                                             %536 = OpLabel 
                                         f32 %582 = OpLoad %465 
                                       f32_3 %583 = OpCompositeConstruct %582 %582 %582 
                                       f32_3 %584 = OpLoad %518 
                                       f32_3 %585 = OpFMul %583 %584 
                                                      OpStore %518 %585 
                                       f32_3 %586 = OpLoad %518 
                                       f32_3 %588 = OpExtInst %1 37 %586 %587 
                                                      OpStore %518 %588 
                                       f32_3 %589 = OpLoad %399 
                                       f32_3 %590 = OpLoad %518 
                                       f32_3 %591 = OpFAdd %589 %590 
                                                      OpStore %399 %591 
                                                      OpBranch %411 
                                             %411 = OpLabel 
                                         i32 %592 = OpLoad %407 
                                         i32 %593 = OpIAdd %592 %35 
                                                      OpStore %407 %593 
                                                      OpBranch %408 
                                             %410 = OpLabel 
                                       f32_3 %596 = OpLoad %401 
                              Uniform f32_4* %598 = OpAccessChain %26 %597 
                                       f32_4 %599 = OpLoad %598 
                                       f32_3 %600 = OpVectorShuffle %599 %599 0 1 2 
                                       f32_3 %601 = OpFMul %596 %600 
                                                      OpStore %595 %601 
                                       f32_3 %602 = OpLoad %595 
                                       f32_3 %603 = OpCompositeConstruct %402 %402 %402 
                                       f32_3 %604 = OpCompositeConstruct %442 %442 %442 
                                       f32_3 %605 = OpExtInst %1 43 %602 %603 %604 
                                                      OpStore %595 %605 
                                       f32_3 %608 = OpLoad %399 
                                       f32_4 %609 = OpLoad %607 
                                       f32_4 %610 = OpVectorShuffle %609 %608 4 5 6 3 
                                                      OpStore %607 %610 
                                       f32_4 %611 = OpLoad %607 
                                       f32_3 %612 = OpVectorShuffle %611 %611 0 1 2 
                                       f32_3 %613 = OpCompositeConstruct %402 %402 %402 
                                       f32_3 %614 = OpCompositeConstruct %442 %442 %442 
                                       f32_3 %615 = OpExtInst %1 43 %612 %613 %614 
                                       f32_4 %616 = OpLoad %607 
                                       f32_4 %617 = OpVectorShuffle %616 %615 4 5 6 3 
                                                      OpStore %607 %617 
                                Uniform f32* %618 = OpAccessChain %26 %378 %452 
                                         f32 %619 = OpLoad %618 
                                 Output f32* %621 = OpAccessChain %607 %452 
                                                      OpStore %621 %619 
                                 Output f32* %622 = OpAccessChain %607 %452 
                                         f32 %623 = OpLoad %622 
                                         f32 %624 = OpExtInst %1 43 %623 %402 %442 
                                 Output f32* %625 = OpAccessChain %607 %452 
                                                      OpStore %625 %624 
                                       f32_3 %630 = OpLoad %629 
                                       f32_2 %631 = OpVectorShuffle %630 %630 0 1 
                              Uniform f32_4* %633 = OpAccessChain %26 %632 
                                       f32_4 %634 = OpLoad %633 
                                       f32_2 %635 = OpVectorShuffle %634 %634 0 1 
                                       f32_2 %636 = OpFMul %631 %635 
                              Uniform f32_4* %637 = OpAccessChain %26 %632 
                                       f32_4 %638 = OpLoad %637 
                                       f32_2 %639 = OpVectorShuffle %638 %638 2 3 
                                       f32_2 %640 = OpFAdd %636 %639 
                                                      OpStore %628 %640 
                                       f32_3 %641 = OpLoad %307 
                                       f32_4 %642 = OpVectorShuffle %641 %641 1 1 1 1 
                              Uniform f32_4* %643 = OpAccessChain %26 %27 %35 
                                       f32_4 %644 = OpLoad %643 
                                       f32_4 %645 = OpFMul %642 %644 
                                                      OpStore %9 %645 
                              Uniform f32_4* %646 = OpAccessChain %26 %27 %28 
                                       f32_4 %647 = OpLoad %646 
                                       f32_3 %648 = OpLoad %307 
                                       f32_4 %649 = OpVectorShuffle %648 %648 0 0 0 0 
                                       f32_4 %650 = OpFMul %647 %649 
                                       f32_4 %651 = OpLoad %9 
                                       f32_4 %652 = OpFAdd %650 %651 
                                                      OpStore %9 %652 
                              Uniform f32_4* %653 = OpAccessChain %26 %27 %54 
                                       f32_4 %654 = OpLoad %653 
                                       f32_3 %655 = OpLoad %307 
                                       f32_4 %656 = OpVectorShuffle %655 %655 2 2 2 2 
                                       f32_4 %657 = OpFMul %654 %656 
                                       f32_4 %658 = OpLoad %9 
                                       f32_4 %659 = OpFAdd %657 %658 
                                                      OpStore %9 %659 
                                       f32_4 %660 = OpLoad %9 
                              Uniform f32_4* %661 = OpAccessChain %26 %27 %67 
                                       f32_4 %662 = OpLoad %661 
                                       f32_4 %663 = OpFAdd %660 %662 
                                                      OpStore %9 %663 
                                       f32_4 %664 = OpLoad %9 
                                       f32_4 %665 = OpVectorShuffle %664 %664 1 1 1 1 
                              Uniform f32_4* %667 = OpAccessChain %26 %666 %35 
                                       f32_4 %668 = OpLoad %667 
                                       f32_4 %669 = OpFMul %665 %668 
                                                      OpStore %80 %669 
                              Uniform f32_4* %670 = OpAccessChain %26 %666 %28 
                                       f32_4 %671 = OpLoad %670 
                                       f32_4 %672 = OpLoad %9 
                                       f32_4 %673 = OpVectorShuffle %672 %672 0 0 0 0 
                                       f32_4 %674 = OpFMul %671 %673 
                                       f32_4 %675 = OpLoad %80 
                                       f32_4 %676 = OpFAdd %674 %675 
                                                      OpStore %80 %676 
                              Uniform f32_4* %677 = OpAccessChain %26 %666 %54 
                                       f32_4 %678 = OpLoad %677 
                                       f32_4 %679 = OpLoad %9 
                                       f32_4 %680 = OpVectorShuffle %679 %679 2 2 2 2 
                                       f32_4 %681 = OpFMul %678 %680 
                                       f32_4 %682 = OpLoad %80 
                                       f32_4 %683 = OpFAdd %681 %682 
                                                      OpStore %80 %683 
                              Uniform f32_4* %688 = OpAccessChain %26 %666 %67 
                                       f32_4 %689 = OpLoad %688 
                                       f32_4 %690 = OpLoad %9 
                                       f32_4 %691 = OpVectorShuffle %690 %690 3 3 3 3 
                                       f32_4 %692 = OpFMul %689 %691 
                                       f32_4 %693 = OpLoad %80 
                                       f32_4 %694 = OpFAdd %692 %693 
                               Output f32_4* %695 = OpAccessChain %687 %28 
                                                      OpStore %695 %694 
                                 Output f32* %696 = OpAccessChain %687 %28 %348 
                                         f32 %697 = OpLoad %696 
                                         f32 %698 = OpFNegate %697 
                                 Output f32* %699 = OpAccessChain %687 %28 %348 
                                                      OpStore %699 %698 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 47
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %25 %30 %36 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %25 Location 25 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %30 Location 30 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %36 Location 36 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %38 RelaxedPrecision 
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
                             Private f32_3* %22 = OpVariable Private 
                                            %24 = OpTypePointer Input %19 
                               Input f32_4* %25 = OpVariable Input 
                                            %29 = OpTypePointer Output %19 
                              Output f32_4* %30 = OpVariable Output 
                                        f32 %32 = OpConstant 3.67402E-40 
                                      f32_3 %33 = OpConstantComposite %32 %32 %32 
                                            %35 = OpTypePointer Input %7 
                               Input f32_3* %36 = OpVariable Input 
                                        f32 %41 = OpConstant 3.67402E-40 
                                            %42 = OpTypeInt 32 0 
                                        u32 %43 = OpConstant 3 
                                            %44 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                    OpStore %9 %21 
                                      f32_3 %23 = OpLoad %9 
                                      f32_4 %26 = OpLoad %25 
                                      f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                      f32_3 %28 = OpFMul %23 %27 
                                                    OpStore %22 %28 
                                      f32_3 %31 = OpLoad %22 
                                      f32_3 %34 = OpFMul %31 %33 
                                      f32_3 %37 = OpLoad %36 
                                      f32_3 %38 = OpFAdd %34 %37 
                                      f32_4 %39 = OpLoad %30 
                                      f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                    OpStore %30 %40 
                                Output f32* %45 = OpAccessChain %30 %43 
                                                    OpStore %45 %41 
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
Keywords { "SPOT" }
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
}
}
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "VertexLM" "RenderType" = "Opaque" }
  GpuProgramID 8257
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
uniform 	vec4 unity_Lightmap_ST;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_TEXCOORD1;
in  vec3 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_Lightmap_ST.xy + unity_Lightmap_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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

uniform 	vec4 unity_Lightmap_HDR;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D unity_Lightmap;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat6 = u_xlat10_0.w * unity_Lightmap_HDR.x;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(u_xlat6);
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
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
; Bound: 127
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %12 %34 %46 %47 %61 %111 
                                                      OpDecorate %9 Location 9 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %34 Location 34 
                                                      OpDecorate %46 Location 46 
                                                      OpDecorate %47 Location 47 
                                                      OpDecorate %61 Location 61 
                                                      OpMemberDecorate %109 0 BuiltIn 109 
                                                      OpMemberDecorate %109 1 BuiltIn 109 
                                                      OpMemberDecorate %109 2 BuiltIn 109 
                                                      OpDecorate %109 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Output %7 
                                 Output f32_2* %9 = OpVariable Output 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %15 = OpTypeVector %6 4 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %15 %17 
                                              %19 = OpTypeArray %15 %17 
                                              %20 = OpTypeStruct %18 %19 %15 %15 %15 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %15 
                                Output f32_2* %34 = OpVariable Output 
                                          i32 %37 = OpConstant 3 
                                Output f32_2* %46 = OpVariable Output 
                                 Input f32_3* %47 = OpVariable Input 
                                          i32 %50 = OpConstant 4 
                                              %59 = OpTypePointer Private %15 
                               Private f32_4* %60 = OpVariable Private 
                                 Input f32_3* %61 = OpVariable Input 
                                          i32 %64 = OpConstant 0 
                                          i32 %65 = OpConstant 1 
                               Private f32_4* %87 = OpVariable Private 
                                         u32 %107 = OpConstant 1 
                                             %108 = OpTypeArray %6 %107 
                                             %109 = OpTypeStruct %15 %6 %108 
                                             %110 = OpTypePointer Output %109 
        Output struct {f32_4; f32; f32[1];}* %111 = OpVariable Output 
                                             %119 = OpTypePointer Output %15 
                                             %121 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_3 %13 = OpLoad %12 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFMul %14 %28 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_2 %32 = OpVectorShuffle %31 %31 2 3 
                                        f32_2 %33 = OpFAdd %29 %32 
                                                      OpStore %9 %33 
                                        f32_3 %35 = OpLoad %12 
                                        f32_2 %36 = OpVectorShuffle %35 %35 0 1 
                               Uniform f32_4* %38 = OpAccessChain %22 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_2 %40 = OpVectorShuffle %39 %39 0 1 
                                        f32_2 %41 = OpFMul %36 %40 
                               Uniform f32_4* %42 = OpAccessChain %22 %37 
                                        f32_4 %43 = OpLoad %42 
                                        f32_2 %44 = OpVectorShuffle %43 %43 2 3 
                                        f32_2 %45 = OpFAdd %41 %44 
                                                      OpStore %34 %45 
                                        f32_3 %48 = OpLoad %47 
                                        f32_2 %49 = OpVectorShuffle %48 %48 0 1 
                               Uniform f32_4* %51 = OpAccessChain %22 %50 
                                        f32_4 %52 = OpLoad %51 
                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                                        f32_2 %54 = OpFMul %49 %53 
                               Uniform f32_4* %55 = OpAccessChain %22 %50 
                                        f32_4 %56 = OpLoad %55 
                                        f32_2 %57 = OpVectorShuffle %56 %56 2 3 
                                        f32_2 %58 = OpFAdd %54 %57 
                                                      OpStore %46 %58 
                                        f32_3 %62 = OpLoad %61 
                                        f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                               Uniform f32_4* %66 = OpAccessChain %22 %64 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpFMul %63 %67 
                                                      OpStore %60 %68 
                               Uniform f32_4* %69 = OpAccessChain %22 %64 %64 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpLoad %61 
                                        f32_4 %72 = OpVectorShuffle %71 %71 0 0 0 0 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %60 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %60 %75 
                               Uniform f32_4* %76 = OpAccessChain %22 %64 %24 
                                        f32_4 %77 = OpLoad %76 
                                        f32_3 %78 = OpLoad %61 
                                        f32_4 %79 = OpVectorShuffle %78 %78 2 2 2 2 
                                        f32_4 %80 = OpFMul %77 %79 
                                        f32_4 %81 = OpLoad %60 
                                        f32_4 %82 = OpFAdd %80 %81 
                                                      OpStore %60 %82 
                                        f32_4 %83 = OpLoad %60 
                               Uniform f32_4* %84 = OpAccessChain %22 %64 %37 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpFAdd %83 %85 
                                                      OpStore %60 %86 
                                        f32_4 %88 = OpLoad %60 
                                        f32_4 %89 = OpVectorShuffle %88 %88 1 1 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %65 %65 
                                        f32_4 %91 = OpLoad %90 
                                        f32_4 %92 = OpFMul %89 %91 
                                                      OpStore %87 %92 
                               Uniform f32_4* %93 = OpAccessChain %22 %65 %64 
                                        f32_4 %94 = OpLoad %93 
                                        f32_4 %95 = OpLoad %60 
                                        f32_4 %96 = OpVectorShuffle %95 %95 0 0 0 0 
                                        f32_4 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %87 
                                        f32_4 %99 = OpFAdd %97 %98 
                                                      OpStore %87 %99 
                              Uniform f32_4* %100 = OpAccessChain %22 %65 %24 
                                       f32_4 %101 = OpLoad %100 
                                       f32_4 %102 = OpLoad %60 
                                       f32_4 %103 = OpVectorShuffle %102 %102 2 2 2 2 
                                       f32_4 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %87 
                                       f32_4 %106 = OpFAdd %104 %105 
                                                      OpStore %87 %106 
                              Uniform f32_4* %112 = OpAccessChain %22 %65 %37 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpLoad %60 
                                       f32_4 %115 = OpVectorShuffle %114 %114 3 3 3 3 
                                       f32_4 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %87 
                                       f32_4 %118 = OpFAdd %116 %117 
                               Output f32_4* %120 = OpAccessChain %111 %64 
                                                      OpStore %120 %118 
                                 Output f32* %122 = OpAccessChain %111 %64 %107 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFNegate %123 
                                 Output f32* %125 = OpAccessChain %111 %64 %107 
                                                      OpStore %125 %124 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 69
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %54 %59 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpMemberDecorate %28 0 RelaxedPrecision 
                                                    OpMemberDecorate %28 0 Offset 28 
                                                    OpMemberDecorate %28 1 RelaxedPrecision 
                                                    OpMemberDecorate %28 1 Offset 28 
                                                    OpDecorate %28 Block 
                                                    OpDecorate %30 DescriptorSet 30 
                                                    OpDecorate %30 Binding 30 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %49 RelaxedPrecision 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %51 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %52 DescriptorSet 52 
                                                    OpDecorate %52 Binding 52 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %54 Location 54 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %59 Location 59 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
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
                                            %28 = OpTypeStruct %7 %7 
                                            %29 = OpTypePointer Uniform %28 
            Uniform struct {f32_4; f32_4;}* %30 = OpVariable Uniform 
                                            %31 = OpTypeInt 32 1 
                                        i32 %32 = OpConstant 0 
                                        u32 %33 = OpConstant 0 
                                            %34 = OpTypePointer Uniform %6 
                                        i32 %45 = OpConstant 1 
                                            %46 = OpTypePointer Uniform %7 
                             Private f32_3* %51 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %52 = OpVariable UniformConstant 
                               Input f32_2* %54 = OpVariable Input 
                                            %58 = OpTypePointer Output %7 
                              Output f32_4* %59 = OpVariable Output 
                                        f32 %65 = OpConstant 3.67402E-40 
                                            %66 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %26 = OpAccessChain %9 %24 
                                        f32 %27 = OpLoad %26 
                               Uniform f32* %35 = OpAccessChain %30 %32 %33 
                                        f32 %36 = OpLoad %35 
                                        f32 %37 = OpFMul %27 %36 
                               Private f32* %38 = OpAccessChain %22 %33 
                                                    OpStore %38 %37 
                                      f32_4 %39 = OpLoad %9 
                                      f32_3 %40 = OpVectorShuffle %39 %39 0 1 2 
                                      f32_3 %41 = OpLoad %22 
                                      f32_3 %42 = OpVectorShuffle %41 %41 0 0 0 
                                      f32_3 %43 = OpFMul %40 %42 
                                                    OpStore %22 %43 
                                      f32_3 %44 = OpLoad %22 
                             Uniform f32_4* %47 = OpAccessChain %30 %45 
                                      f32_4 %48 = OpLoad %47 
                                      f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                      f32_3 %50 = OpFMul %44 %49 
                                                    OpStore %22 %50 
                 read_only Texture2DSampled %53 = OpLoad %52 
                                      f32_2 %55 = OpLoad %54 
                                      f32_4 %56 = OpImageSampleImplicitLod %53 %55 
                                      f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                                    OpStore %51 %57 
                                      f32_3 %60 = OpLoad %22 
                                      f32_3 %61 = OpLoad %51 
                                      f32_3 %62 = OpFMul %60 %61 
                                      f32_4 %63 = OpLoad %59 
                                      f32_4 %64 = OpVectorShuffle %63 %62 4 5 6 3 
                                                    OpStore %59 %64 
                                Output f32* %67 = OpAccessChain %59 %24 
                                                    OpStore %67 %65 
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
  Name "SHADOWCASTER"
  LOD 100
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 118440
Program "vp" {
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
out vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
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

uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0 = sqrt(u_xlat0);
    u_xlat0 = u_xlat0 + unity_LightShadowBias.x;
    SV_Target0 = vec4(u_xlat0) * _LightPositionRange.wwww;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SHADOWS_CUBE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 139
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %68 %123 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpDecorate %18 ArrayStride 18 
                                                     OpMemberDecorate %19 0 Offset 19 
                                                     OpMemberDecorate %19 1 Offset 19 
                                                     OpMemberDecorate %19 2 Offset 19 
                                                     OpDecorate %19 Block 
                                                     OpDecorate %21 DescriptorSet 21 
                                                     OpDecorate %21 Binding 21 
                                                     OpDecorate %68 Location 68 
                                                     OpMemberDecorate %121 0 BuiltIn 121 
                                                     OpMemberDecorate %121 1 BuiltIn 121 
                                                     OpMemberDecorate %121 2 BuiltIn 121 
                                                     OpDecorate %121 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %12 = OpTypeVector %6 3 
                                             %15 = OpTypeInt 32 0 
                                         u32 %16 = OpConstant 4 
                                             %17 = OpTypeArray %7 %16 
                                             %18 = OpTypeArray %7 %16 
                                             %19 = OpTypeStruct %7 %17 %18 
                                             %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                             %22 = OpTypeInt 32 1 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %31 = OpConstant 0 
                                         i32 %43 = OpConstant 2 
                                         i32 %55 = OpConstant 3 
                                             %67 = OpTypePointer Output %12 
                               Output f32_3* %68 = OpVariable Output 
                              Private f32_4* %99 = OpVariable Private 
                                        u32 %119 = OpConstant 1 
                                            %120 = OpTypeArray %6 %119 
                                            %121 = OpTypeStruct %7 %6 %120 
                                            %122 = OpTypePointer Output %121 
       Output struct {f32_4; f32; f32[1];}* %123 = OpVariable Output 
                                            %131 = OpTypePointer Output %7 
                                            %133 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %13 = OpLoad %11 
                                       f32_3 %14 = OpVectorShuffle %13 %13 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                       f32_3 %28 = OpFMul %14 %27 
                                       f32_4 %29 = OpLoad %9 
                                       f32_4 %30 = OpVectorShuffle %29 %28 4 5 6 3 
                                                     OpStore %9 %30 
                              Uniform f32_4* %32 = OpAccessChain %21 %23 %31 
                                       f32_4 %33 = OpLoad %32 
                                       f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                       f32_4 %35 = OpLoad %11 
                                       f32_3 %36 = OpVectorShuffle %35 %35 0 0 0 
                                       f32_3 %37 = OpFMul %34 %36 
                                       f32_4 %38 = OpLoad %9 
                                       f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                       f32_3 %40 = OpFAdd %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                     OpStore %9 %42 
                              Uniform f32_4* %44 = OpAccessChain %21 %23 %43 
                                       f32_4 %45 = OpLoad %44 
                                       f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                       f32_4 %47 = OpLoad %11 
                                       f32_3 %48 = OpVectorShuffle %47 %47 2 2 2 
                                       f32_3 %49 = OpFMul %46 %48 
                                       f32_4 %50 = OpLoad %9 
                                       f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                       f32_3 %52 = OpFAdd %49 %51 
                                       f32_4 %53 = OpLoad %9 
                                       f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
                                                     OpStore %9 %54 
                              Uniform f32_4* %56 = OpAccessChain %21 %23 %55 
                                       f32_4 %57 = OpLoad %56 
                                       f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                       f32_4 %59 = OpLoad %11 
                                       f32_3 %60 = OpVectorShuffle %59 %59 3 3 3 
                                       f32_3 %61 = OpFMul %58 %60 
                                       f32_4 %62 = OpLoad %9 
                                       f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                       f32_3 %64 = OpFAdd %61 %63 
                                       f32_4 %65 = OpLoad %9 
                                       f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                     OpStore %9 %66 
                                       f32_4 %69 = OpLoad %9 
                                       f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                              Uniform f32_4* %71 = OpAccessChain %21 %31 
                                       f32_4 %72 = OpLoad %71 
                                       f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                       f32_3 %74 = OpFNegate %73 
                                       f32_3 %75 = OpFAdd %70 %74 
                                                     OpStore %68 %75 
                                       f32_4 %76 = OpLoad %11 
                                       f32_4 %77 = OpVectorShuffle %76 %76 1 1 1 1 
                              Uniform f32_4* %78 = OpAccessChain %21 %23 %23 
                                       f32_4 %79 = OpLoad %78 
                                       f32_4 %80 = OpFMul %77 %79 
                                                     OpStore %9 %80 
                              Uniform f32_4* %81 = OpAccessChain %21 %23 %31 
                                       f32_4 %82 = OpLoad %81 
                                       f32_4 %83 = OpLoad %11 
                                       f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                       f32_4 %85 = OpFMul %82 %84 
                                       f32_4 %86 = OpLoad %9 
                                       f32_4 %87 = OpFAdd %85 %86 
                                                     OpStore %9 %87 
                              Uniform f32_4* %88 = OpAccessChain %21 %23 %43 
                                       f32_4 %89 = OpLoad %88 
                                       f32_4 %90 = OpLoad %11 
                                       f32_4 %91 = OpVectorShuffle %90 %90 2 2 2 2 
                                       f32_4 %92 = OpFMul %89 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_4 %94 = OpFAdd %92 %93 
                                                     OpStore %9 %94 
                                       f32_4 %95 = OpLoad %9 
                              Uniform f32_4* %96 = OpAccessChain %21 %23 %55 
                                       f32_4 %97 = OpLoad %96 
                                       f32_4 %98 = OpFAdd %95 %97 
                                                     OpStore %9 %98 
                                      f32_4 %100 = OpLoad %9 
                                      f32_4 %101 = OpVectorShuffle %100 %100 1 1 1 1 
                             Uniform f32_4* %102 = OpAccessChain %21 %43 %23 
                                      f32_4 %103 = OpLoad %102 
                                      f32_4 %104 = OpFMul %101 %103 
                                                     OpStore %99 %104 
                             Uniform f32_4* %105 = OpAccessChain %21 %43 %31 
                                      f32_4 %106 = OpLoad %105 
                                      f32_4 %107 = OpLoad %9 
                                      f32_4 %108 = OpVectorShuffle %107 %107 0 0 0 0 
                                      f32_4 %109 = OpFMul %106 %108 
                                      f32_4 %110 = OpLoad %99 
                                      f32_4 %111 = OpFAdd %109 %110 
                                                     OpStore %99 %111 
                             Uniform f32_4* %112 = OpAccessChain %21 %43 %43 
                                      f32_4 %113 = OpLoad %112 
                                      f32_4 %114 = OpLoad %9 
                                      f32_4 %115 = OpVectorShuffle %114 %114 2 2 2 2 
                                      f32_4 %116 = OpFMul %113 %115 
                                      f32_4 %117 = OpLoad %99 
                                      f32_4 %118 = OpFAdd %116 %117 
                                                     OpStore %99 %118 
                             Uniform f32_4* %124 = OpAccessChain %21 %43 %55 
                                      f32_4 %125 = OpLoad %124 
                                      f32_4 %126 = OpLoad %9 
                                      f32_4 %127 = OpVectorShuffle %126 %126 3 3 3 3 
                                      f32_4 %128 = OpFMul %125 %127 
                                      f32_4 %129 = OpLoad %99 
                                      f32_4 %130 = OpFAdd %128 %129 
                              Output f32_4* %132 = OpAccessChain %123 %31 
                                                     OpStore %132 %130 
                                Output f32* %134 = OpAccessChain %123 %31 %119 
                                        f32 %135 = OpLoad %134 
                                        f32 %136 = OpFNegate %135 
                                Output f32* %137 = OpAccessChain %123 %31 %119 
                                                     OpStore %137 %136 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 41
; Schema: 0
                                        OpCapability Shader 
                                 %1 = OpExtInstImport "GLSL.std.450" 
                                        OpMemoryModel Logical GLSL450 
                                        OpEntryPoint Fragment %4 "main" %11 %31 
                                        OpExecutionMode %4 OriginUpperLeft 
                                        OpDecorate %11 Location 11 
                                        OpMemberDecorate %19 0 Offset 19 
                                        OpMemberDecorate %19 1 Offset 19 
                                        OpDecorate %19 Block 
                                        OpDecorate %21 DescriptorSet 21 
                                        OpDecorate %21 Binding 21 
                                        OpDecorate %31 Location 31 
                                 %2 = OpTypeVoid 
                                 %3 = OpTypeFunction %2 
                                 %6 = OpTypeFloat 32 
                                 %7 = OpTypePointer Private %6 
                    Private f32* %8 = OpVariable Private 
                                 %9 = OpTypeVector %6 3 
                                %10 = OpTypePointer Input %9 
                   Input f32_3* %11 = OpVariable Input 
                                %18 = OpTypeVector %6 4 
                                %19 = OpTypeStruct %18 %18 
                                %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4;}* %21 = OpVariable Uniform 
                                %22 = OpTypeInt 32 1 
                            i32 %23 = OpConstant 1 
                                %24 = OpTypeInt 32 0 
                            u32 %25 = OpConstant 0 
                                %26 = OpTypePointer Uniform %6 
                                %30 = OpTypePointer Output %18 
                  Output f32_4* %31 = OpVariable Output 
                            i32 %34 = OpConstant 0 
                                %35 = OpTypePointer Uniform %18 
                            void %4 = OpFunction None %3 
                                 %5 = OpLabel 
                          f32_3 %12 = OpLoad %11 
                          f32_3 %13 = OpLoad %11 
                            f32 %14 = OpDot %12 %13 
                                        OpStore %8 %14 
                            f32 %15 = OpLoad %8 
                            f32 %16 = OpExtInst %1 31 %15 
                                        OpStore %8 %16 
                            f32 %17 = OpLoad %8 
                   Uniform f32* %27 = OpAccessChain %21 %23 %25 
                            f32 %28 = OpLoad %27 
                            f32 %29 = OpFAdd %17 %28 
                                        OpStore %8 %29 
                            f32 %32 = OpLoad %8 
                          f32_4 %33 = OpCompositeConstruct %32 %32 %32 %32 
                 Uniform f32_4* %36 = OpAccessChain %21 %34 
                          f32_4 %37 = OpLoad %36 
                          f32_4 %38 = OpVectorShuffle %37 %37 3 3 3 3 
                          f32_4 %39 = OpFMul %33 %38 
                                        OpStore %31 %39 
                                        OpReturn
                                        OpFunctionEnd
"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SHADOWS_DEPTH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 254
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %66 %227 
                                                      OpDecorate %12 Location 12 
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
                                                      OpDecorate %66 Location 66 
                                                      OpMemberDecorate %225 0 BuiltIn 225 
                                                      OpMemberDecorate %225 1 BuiltIn 225 
                                                      OpMemberDecorate %225 2 BuiltIn 225 
                                                      OpDecorate %225 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                          i32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Uniform %7 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                          i32 %34 = OpConstant 1 
                                          u32 %39 = OpConstant 1 
                                          i32 %42 = OpConstant 2 
                                          u32 %47 = OpConstant 2 
                                 Private f32* %49 = OpVariable Private 
                               Private f32_4* %64 = OpVariable Private 
                                              %65 = OpTypePointer Input %7 
                                 Input f32_4* %66 = OpVariable Input 
                               Private f32_4* %93 = OpVariable Private 
                                         f32 %130 = OpConstant 3.67402E-40 
                                             %135 = OpTypePointer Uniform %6 
                                             %150 = OpTypeBool 
                                             %151 = OpTypePointer Private %150 
                               Private bool* %152 = OpVariable Private 
                                         f32 %155 = OpConstant 3.67402E-40 
                                             %157 = OpTypePointer Function %10 
                                         i32 %172 = OpConstant 4 
                                         u32 %199 = OpConstant 3 
                                         f32 %210 = OpConstant 3.67402E-40 
                                Private f32* %213 = OpVariable Private 
                                             %224 = OpTypeArray %6 %39 
                                             %225 = OpTypeStruct %7 %6 %224 
                                             %226 = OpTypePointer Output %225 
        Output struct {f32_4; f32; f32[1];}* %227 = OpVariable Output 
                                             %230 = OpTypePointer Output %7 
                                             %247 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %158 = OpVariable Function 
                                        f32_3 %13 = OpLoad %12 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                          f32 %29 = OpDot %13 %28 
                                 Private f32* %32 = OpAccessChain %9 %30 
                                                      OpStore %32 %29 
                                        f32_3 %33 = OpLoad %12 
                               Uniform f32_4* %35 = OpAccessChain %21 %23 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                          f32 %38 = OpDot %33 %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                                      OpStore %40 %38 
                                        f32_3 %41 = OpLoad %12 
                               Uniform f32_4* %43 = OpAccessChain %21 %23 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                          f32 %46 = OpDot %41 %45 
                                 Private f32* %48 = OpAccessChain %9 %47 
                                                      OpStore %48 %46 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_4 %52 = OpLoad %9 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                          f32 %54 = OpDot %51 %53 
                                                      OpStore %49 %54 
                                          f32 %55 = OpLoad %49 
                                          f32 %56 = OpExtInst %1 32 %55 
                                                      OpStore %49 %56 
                                          f32 %57 = OpLoad %49 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %21 %42 %34 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %68 %70 
                                                      OpStore %64 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %42 %24 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %66 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %64 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %64 %78 
                               Uniform f32_4* %79 = OpAccessChain %21 %42 %42 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %66 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %64 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %64 %85 
                               Uniform f32_4* %86 = OpAccessChain %21 %42 %23 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %64 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %64 %92 
                                        f32_4 %94 = OpLoad %64 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFNegate %95 
                               Uniform f32_4* %97 = OpAccessChain %21 %24 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 3 3 3 
                                       f32_3 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %24 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                       f32_3 %104 = OpFAdd %100 %103 
                                       f32_4 %105 = OpLoad %93 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                                      OpStore %93 %106 
                                       f32_4 %107 = OpLoad %93 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_4 %109 = OpLoad %93 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                         f32 %111 = OpDot %108 %110 
                                                      OpStore %49 %111 
                                         f32 %112 = OpLoad %49 
                                         f32 %113 = OpExtInst %1 32 %112 
                                                      OpStore %49 %113 
                                         f32 %114 = OpLoad %49 
                                       f32_3 %115 = OpCompositeConstruct %114 %114 %114 
                                       f32_4 %116 = OpLoad %93 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %93 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %93 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_4 %123 = OpLoad %93 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %122 %124 
                                                      OpStore %49 %125 
                                         f32 %126 = OpLoad %49 
                                         f32 %127 = OpFNegate %126 
                                         f32 %128 = OpLoad %49 
                                         f32 %129 = OpFMul %127 %128 
                                         f32 %131 = OpFAdd %129 %130 
                                                      OpStore %49 %131 
                                         f32 %132 = OpLoad %49 
                                         f32 %133 = OpExtInst %1 31 %132 
                                                      OpStore %49 %133 
                                         f32 %134 = OpLoad %49 
                                Uniform f32* %136 = OpAccessChain %21 %34 %47 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                                      OpStore %49 %138 
                                       f32_4 %139 = OpLoad %9 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFNegate %140 
                                         f32 %142 = OpLoad %49 
                                       f32_3 %143 = OpCompositeConstruct %142 %142 %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %64 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %9 %149 
                                Uniform f32* %153 = OpAccessChain %21 %34 %47 
                                         f32 %154 = OpLoad %153 
                                        bool %156 = OpFOrdNotEqual %154 %155 
                                                      OpStore %152 %156 
                                        bool %159 = OpLoad %152 
                                                      OpSelectionMerge %161 None 
                                                      OpBranchConditional %159 %160 %164 
                                             %160 = OpLabel 
                                       f32_4 %162 = OpLoad %9 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                                      OpStore %158 %163 
                                                      OpBranch %161 
                                             %164 = OpLabel 
                                       f32_4 %165 = OpLoad %64 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                                      OpStore %158 %166 
                                                      OpBranch %161 
                                             %161 = OpLabel 
                                       f32_3 %167 = OpLoad %158 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %9 %169 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
                              Uniform f32_4* %173 = OpAccessChain %21 %172 %34 
                                       f32_4 %174 = OpLoad %173 
                                       f32_4 %175 = OpFMul %171 %174 
                                                      OpStore %93 %175 
                              Uniform f32_4* %176 = OpAccessChain %21 %172 %24 
                                       f32_4 %177 = OpLoad %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 0 0 0 
                                       f32_4 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %93 
                                       f32_4 %182 = OpFAdd %180 %181 
                                                      OpStore %93 %182 
                              Uniform f32_4* %183 = OpAccessChain %21 %172 %42 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %185 2 2 2 2 
                                       f32_4 %187 = OpFMul %184 %186 
                                       f32_4 %188 = OpLoad %93 
                                       f32_4 %189 = OpFAdd %187 %188 
                                                      OpStore %9 %189 
                              Uniform f32_4* %190 = OpAccessChain %21 %172 %23 
                                       f32_4 %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %64 
                                       f32_4 %193 = OpVectorShuffle %192 %192 3 3 3 3 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpFAdd %194 %195 
                                                      OpStore %9 %196 
                                Uniform f32* %197 = OpAccessChain %21 %34 %30 
                                         f32 %198 = OpLoad %197 
                                Private f32* %200 = OpAccessChain %9 %199 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFDiv %198 %201 
                                Private f32* %203 = OpAccessChain %64 %30 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %64 %30 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpExtInst %1 37 %205 %155 
                                Private f32* %207 = OpAccessChain %64 %30 
                                                      OpStore %207 %206 
                                Private f32* %208 = OpAccessChain %64 %30 
                                         f32 %209 = OpLoad %208 
                                         f32 %211 = OpExtInst %1 40 %209 %210 
                                Private f32* %212 = OpAccessChain %64 %30 
                                                      OpStore %212 %211 
                                Private f32* %214 = OpAccessChain %9 %47 
                                         f32 %215 = OpLoad %214 
                                Private f32* %216 = OpAccessChain %64 %30 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFAdd %215 %217 
                                                      OpStore %213 %218 
                                Private f32* %219 = OpAccessChain %9 %199 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpLoad %213 
                                         f32 %222 = OpExtInst %1 37 %220 %221 
                                Private f32* %223 = OpAccessChain %64 %30 
                                                      OpStore %223 %222 
                                       f32_4 %228 = OpLoad %9 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 3 
                               Output f32_4* %231 = OpAccessChain %227 %24 
                                       f32_4 %232 = OpLoad %231 
                                       f32_4 %233 = OpVectorShuffle %232 %229 4 5 2 6 
                                                      OpStore %231 %233 
                                         f32 %234 = OpLoad %213 
                                         f32 %235 = OpFNegate %234 
                                Private f32* %236 = OpAccessChain %64 %30 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFAdd %235 %237 
                                Private f32* %239 = OpAccessChain %9 %30 
                                                      OpStore %239 %238 
                                Uniform f32* %240 = OpAccessChain %21 %34 %39 
                                         f32 %241 = OpLoad %240 
                                Private f32* %242 = OpAccessChain %9 %30 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFMul %241 %243 
                                         f32 %245 = OpLoad %213 
                                         f32 %246 = OpFAdd %244 %245 
                                 Output f32* %248 = OpAccessChain %227 %24 %47 
                                                      OpStore %248 %246 
                                 Output f32* %249 = OpAccessChain %227 %24 %39 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpFNegate %250 
                                 Output f32* %252 = OpAccessChain %227 %24 %39 
                                                      OpStore %252 %251 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 13
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 Location 9 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
         f32 %10 = OpConstant 3.67402E-40 
       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
                     OpStore %9 %11 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "vulkan " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "vulkan " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
}
}
}
}