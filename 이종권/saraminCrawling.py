import os
import requests
from bs4 import BeautifulSoup
import urllib.request
from urllib.parse import urljoin  # urljoin 함수 추가

url = 'https://www.saramin.co.kr/zf_user/jobs/list/domestic?loc_mcd=111000%2C104000&panel_type=&search_optional_item=n&search_done=y&panel_count=y&preview=y'
req = urllib.request.Request(url)
res = urllib.request.urlopen(url).read()
soup = BeautifulSoup(res, 'html.parser')

# 태그 찾기
wrap_list_banners = soup.select('div.wrap_list_banner > ul.list_product.list_grand')

# 추출할 이미지의 최대 개수
max_images = 12
image_count = 0

# 직접 경로를 설정하여 원하는 위치에 폴더 생성
output_folder = './images'
os.makedirs(output_folder, exist_ok=True)

for ul_tag in wrap_list_banners:
    img_tags = ul_tag.find_all('img', limit=12)

    for img_tag in img_tags:
        img_src = img_tag.get('src')
        print(img_tag)
        if img_src == "//www.saraminimage.co.kr/common/bul_sri_star.png":
            continue

        # img_src가 비어있거나 잘못된 형식이면 건너뜁니다.
        if not img_src:
            continue

        # 이미지 URL이 상대 경로인 경우 전체 URL로 변환합니다.
        img_src = urljoin(url, img_src)

        response = requests.get(img_src)

        # 이미지를 폴더에 저장
        image_filename = os.path.join(output_folder, f'company_image_{image_count + 1}.jpg')
        with open(image_filename, 'wb') as img_file:
            img_file.write(response.content)

        # print(f"Image {image_count + 1} saved: {image_filename}")

        # 이미지 개수를 체크하여 지정한 개수만큼만 추출 및 저장
        image_count += 1

