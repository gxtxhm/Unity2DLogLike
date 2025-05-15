# Unity2DLogLike - 2D 로그라이크 게임 프로토타입

## 프로젝트 소개

Unity2DLogLike는 *Enter the Gungeon* 스타일의 2D 로그라이크 게임 프로토타입으로, 유니티로 개발된 개인 프로젝트입니다. **맵 자동생성**으로 매번 새로운 던전을 생성하며, 다양한 **무기 시스템**으로 전투를 지원합니다. 문 시스템, 몬스터 AI, 미니맵, A* 경로 찾기 등도 포함되어 있습니다.

## 기술적 하이라이트

- **맵 자동생성**:
  - 물리엔진(`Rigidbody2D`, `BoxCollider2D`)으로 동적 방 분리.
  - Kruskal과 Union-Find로 효율적 최소 신장 트리(MST) 생성.
  - 단일 함수 호출과 3경로 접근으로 복도 생성 최적화, 모서리/콜라이더 버그 해결.
- **무기 시스템**:
  - `ScriptableObject`로 무기 데이터 관리, 확장성 향상.
  - 오브젝트 풀링으로 총알 성능 최적화.
  - `Gun`, `Rifle`, `ShotGun`으로 다양한 발사 패턴(단일, 연사, 확산) 구현.
- **몬스터 AI**:
  - A* Pathfinding Project로 동적 경로 찾기, 0.3초마다 갱신.
  - 플레이어 추적 및 총알 발사(`ArrowBullet`).
- **문 시스템**:
  - 트리거 기반 문 애니메이션(`doorOpen`, `doorClose`).
  - 방 전환 시 자연스러운 상태 관리.

## 문제 해결 과정

- **복도 생성 알고리즘 개선**:
  
  - **문제점**:
    - 초기 알고리즘은 `GenerateCorridors`로 ㄱ자 경로를 두 번 생성(x→y, y→x 또는 반대).
    - 일자 복도에서 중간 지점에 불필요한 모서리 타일 생성.
    - 모서리 직후 또 다른 모서리 생성 시 콜라이더 방향 오류.
    - 원인: 두 번째 함수 호출 시 이전/다음 방향 정보 손실, 데이터 저장 없음.
    - 모든 통로 데이터 저장은 메모리 낭비로 판단.
      
  - **해결 과정**:
    
    - **단일 함수 호출**: `CreateCorridors`로 한 번에 처리, 방향 정보 손실 방지.
      
    - **3경로 접근**: ㄱ자 두 번 대신 3개 직선 경로(x→y→x 또는 y→x→y)를 `for`문으로 생성.
      
    - **구현**:
      - `path` 배열로 시작/끝점 관리.
      - `dx`, `dy`로 현재 방향, `nextDx`, `nextDy`로 다음 방향 계산.
      - `GetDirToCorridorTile`로 모서리 타일 동적 선택(예: x→y, dx>0, nextDy<0 → rb).
      - 마지막 경로(`i==2`)는 직선 타일로 마무리.
        
    - **고민**:
      - 두 번 호출 방식은 간단했으나, 모서리 연속 시 한계 명확.
      - 종이 스케치로 경로 시각화, 3경로 아이디어 도출.
      - 메모리 효율성을 위해 데이터 저장 대신 단일 호출 채택.
        
  - **결과**: 중간 모서리 버그 제거, 콜라이더 방향 오류 해결, 모든 통로 깔끔하게 생성.

## 데모

- **스크린샷**:
-   ***던전 맵 생성***
-  ![던전 맵 생성](https://github.com/user-attachments/assets/14ee5626-a92e-4825-b58c-2df76eaff73f)
-   ***게임 플레이 화면***
-  ![게임 플레이 화면](https://github.com/user-attachments/assets/c5a530b3-4082-464d-a6b8-1ba59fd8d8b3)
- **데모 영상**
-  <a href="https://youtu.be/8IGIkZRLaw4" target="_blank">영상 보러가기</a>

## 주요 기능

### 맵 자동생성

- **방 생성** (`RoomGenerator.GenerateRoom`):
  - `-5~5` 범위 내 랜덤 위치에 방 생성, 크기 `minRoom`~`maxRoom`.
  - 물리엔진으로 방 분리, `roomPadding`으로 간격 확보.
  - `RunSeparation`: 동적 분리 후 `SnapAllRoomsToGrid`로 좌표 반올림.
  - `RoomController.roomArrayData`: 2D 배열로 타일 관리(벽=`TileType.Wall`, 문=`TileType.Door`, 바닥=`TileType.Floor`).
  - 바닥(`floorTile`), 벽(`wallTile`), 미니맵용 `questionMarkSprite`, 안개(`fog`) 생성.
    
- **최소 신장 트리(MST)** (`GenerateCorridor`, `Kruscal`, `UnionFind`):
  - `Kruscal.Run`: 유클리드 거리로 MST 생성.
  - `UnionFind`: 경로 압축과 랭크 최적화.
  - `OnDrawGizmos`로 시각화(녹색 선).
    
- **문 생성** (`GenerateCorridor`, `CreateDoor`, `RoomController.SetDoor`):
  - MST 엣지로 방향 계산(`Mathf.Atan2`, 상/하/좌/우).
  - `CreateDoor`: `DirToDoor`로 프리팹 선택.
  - `SetDoor`: 랜덤 위치에 문 배치, `TileType.Door` 기록.
    
- **복도 생성** (`GenerateCorridor`, `CreateCorridors`):
  - 초기: ㄱ자 경로 두 번 생성, 일자 복도 모서리 및 콜라이더 오류.
  - 개선: `CreateCorridors`로 3경로(x→y→x 또는 y→x→y) 생성.
  - 직선(`corridorTile[0,1]`), 모서리(`corridorTile[2~5]`) 타일 배치.
  - `GetDirToCorridorTile`: 현재/다음 방향으로 모서리 선택.
    
- **콜라이더 설정** (`CreateCorridors`):
  - 직선과 모서리에 콜라이더 설정, 방향 기반 막힌 면 처리.
    
- **마무리** (`CreateWall`, `FilledFloorTile`, `SetRoomCreature`):
  - 벽, 문 앞 바닥 타일, 몬스터 생성.

### 무기 시스템

- **구조**:
  - `Weapon`: 발사(`Shoot`), 재장전(`CoReload`), 오디오.
  - `WeaponData`: `ScriptableObject`로 속성 관리.
  - `WeaponManager`: 무기 추가, 스왑, 재장전 UI.
  - `PoolingManager`: 총알 풀링(`GunBullet`, `RifleBullet`, `ShotGunBullet`, `ArrowBullet`).
  - `WeaponDatabase`: 무기 프리팹과 `WeaponType` 매핑.
  - `Gun`, `Rifle`, `ShotGun`: 단일, 연사, 확산 발사.
  - `Bullet`: 이동, 충돌, 풀링 반환.
    
- **기능**:
  - 발사: `PlayerController.Co_Shoot`, `FireRate`로 간격 조절.
  - 재장전: `CoReload`로 슬라이더 애니메이션.
  - 총알: `Bullet.InitBullet`, 충돌 처리.
  - UI: `weaponImage`, `bulletText`로 표시.

### 기타 기능

- **문 시스템** (`DoorController`, `ActionColliderTrigger`):
  - `doorOpen`/`doorClose`로 애니메이션, 방 전환.
    
- **몬스터 AI** (`Monster`):
  - A*로 플레이어 추적, `Co_Shoot`로 공격.
    
- **미니맵** (`RoomController`):
  - 방 구조와 안개 표시, 방문 시 제거.
    
- **플레이어** (`PlayerController`):
  - 키보드 이동, 마우스 조준, 체력 UI.
    
- **카메라** (`CameraController`):
  - 플레이어와 마우스 기반 부드러운 이동.
    
- **게임 관리** (`GameManager`):
  - 방 클리어 카운트, 게임 종료 UI.

## 기술 스택

- **엔진**: Unity 2022.3
- **언어**: C#
- **라이브러리**: A* Pathfinding Project
- **툴**: Visual Studio, Git

## 리포지토리 구조
├── Assets/<br>
│   ├── Scripts/<br>
│   │   ├── RoomGenerator.cs    # 맵 생성 메인 로직<br>
│   │   ├── RoomController.cs   # 방 타일과 문 관리<br>
│   │   ├── Kruscal.cs         # Kruskal 알고리즘<br>
│   │   ├── UnionFind.cs       # 유니온-파인드<br>
│   │   ├── Weapon.cs          # 무기 시스템 기반<br>
│   │   ├── WeaponManager.cs   # 무기 관리<br>
│   │   ├── PoolingManager.cs  # 총알 풀링<br>
│   │   ├── Monster.cs         # 몬스터 AI<br>
│   │   ├── DoorController.cs  # 문 애니메이션<br>
│   │   ├── CameraController.cs # 카메라 이동<br>
│   ├── Scenes/<br>
│   ├── Sprites/<br>
├── screenshots/<br>
└── README.md


## 참고 자료

- 맵 자동생성 정리: [내 블로그](https://tpree.tistory.com/category/2d%20%EC%9E%90%EB%8F%99%20%EB%A7%B5%EC%83%9D%EC%84%B1)]
- A* Pathfinding Project: [공식 문서](https://assetstore.unity.com/packages/tools/behavior-ai/astar-2d-grid-pathfinding-250080)

## 주의사항

- 프리팹 원점은 좌측 하단으로 통일.
- 복도 콜라이더 디버깅 시 모서리 타일 확인 필요.
