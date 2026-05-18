# 🧠 Teen Mental Health & Social Media Analysis
## ✒️ Introduction
Tôi là ***Nguyễn Khắc Hưng (Han/Victor)*** hiện đang là sinh viên ***nghành khoa học dữ liệu và trí tuệ nhân tạo***, trong tương lai tôi định hướng trở thành một ***data analyst (chuyên viên phân tích dữ liệu)*** để thõa sức xây dựng các dashboard bằng power bi, tableau giúp quản lý và theo rõi các chỉ số, phân tích dữ liệu tìm ra insights bằng python và sql. Dự án này tôi thực hiện phân tích dữ liệu trên tập dữ liệu Teen_Mental_Health_Dataset.csv, một bộ dữ liệu nó về tình trạng trầm cảm ở thanh thiếu niên và những yếu tố ảnh hưởng đến việc bị trầm cảm. Tôi sẽ thực hiện phân tích dữ liệu để tìm ra các insight như yếu tố nào ảnh hưởng lớn đến việc bị trầm cảm, mạng xã hội tác động như nào đến mức độ căng thằng của thanh thiếu niên, v.v. Dự án được thực hiện bằng SQL, PostgresSQL, DBeaver.
## 📌 Raise the issue
Đặt vấn đề:  
**Vấn đề 1**: Phân mảnh hành vi cốt lõi: Thời lượng sử dụng mạng xã hội trung bình (daily_social_media_hours) và mức độ nghiện (addiction_level) có sự phân hóa như thế nào giữa các nhóm giới tính (gender) và các độ tuổi (age) khác nhau?  
**Vấn đề 2**: Đặc thù nền tảng: Nhóm người dùng chỉ dùng TikTok, chỉ dùng Instagram, và dùng cả hai (platform_usage) có sự chênh lệch ra sao về kết quả học tập (academic_performance) và mức độ căng thẳng (anxiety_level)?  
**Vấn đề 3**: Phân tích tương quan & Chẩn đoán (Diagnostic Analytics) Kẻ cắp giấc ngủ: Có mối tương quan nghịch biến rõ rệt nào giữa thời gian dùng điện thoại trước khi ngủ (screen_time_before_sleep) và tổng số giờ ngủ (sleep_hours) không?  
**Vấn đề 4**: Nghịch lý giao tiếp xã hội: Những cá nhân có mức độ tương tác xã hội đời thực thấp (social_interaction_level = low) liệu có xu hướng bù đắp bằng cách tiêu tốn nhiều daily_social_media_hours hơn những nhóm 'medium' và 'high' không?  
**Vấn đề 5**: Tác động "kép" đến sức khỏe tâm thần: Trong 3 biến: việc thiếu ngủ (sleep_hours), thời lượng dùng MXH (daily_social_media_hours), và mức độ nghiện (addiction_level),yếu tố nào đẩy mức độ lo âu (anxiety_level) lên cao nhất?
**Vấn đề 6**: Vai trò của thể chất: Hoạt động thể chất (physical_activity) có đóng vai trò như một "tấm khiên" bảo vệ sức khỏe tinh thần không? Hãy so sánh mức căng thẳng của nhóm có vận động thể chất cao với nhóm thấp, trong điều kiện cả hai nhóm có cùng thời lượng dùng MXH.  
**Vấn đề 7**: Chân dung nhóm rủi ro cao (High-Risk Persona): Hãy dùng SQL (kết hợp CTE và CASE WHEN) để lọc ra nhóm người dùng có dấu hiệu đáng báo động (Ví dụ quy ước: sleep_hours < 5, anxiety_level > 7, stress_level > 7). Nhóm này có chung đặc điểm gì về nền tảng sử dụng và thói quen trước khi ngủ?  
**Vấn đề 8**: Tìm kiếm ngưỡng an toàn (Tipping Point): Từ dữ liệu điểm học tập (academic_performance), em hãy gom nhóm và tìm ra "điểm gãy" – tức là vượt qua mốc bao nhiêu giờ daily_social_media_hours thì điểm học tập bắt đầu lao dốc một cách rõ rệt nhất?
**Vấn đề 9**: Phân tích nhãn Trầm cảm (depression_label): Đâu là những đặc điểm nhận diện rõ ràng nhất của nhóm được gắn nhãn trầm cảm (depression_label = 1) so với nhóm bằng 0? Nhóm này có dùng MXH nhiều hơn mức bình thường không?  
## 🛠️ Tools
***SQL***: Sử dụng để tạo bảng, tạo cơ sở dữ liệu, sử dụng để truy vấn lấy dữ liệu, viết truy vấn để phân tích và khai phá dữ liệu tìm ra insight  
***Postgres***: Hệ thống quản lý cơ sở dữ liệu, mạnh và hiện đại  
***DBeaver***: IDE dùng để viết truy vấn SQL, quản lý file phân tích theo dõi, v.v.  
## 📊 Analysis  
