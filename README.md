BÀI TOÁN KINH DOANH ĐẶT RA

Nhóm 1: Khám phá tổng quan (Descriptive Analytics)
Phân mảnh hành vi cốt lõi: Thời lượng sử dụng mạng xã hội trung bình (daily_social_media_hours) và mức độ nghiện (addiction_level) có sự phân hóa như thế nào giữa các
nhóm giới tính (gender) và các độ tuổi (age) khác nhau?

Đặc thù nền tảng: Nhóm người dùng chỉ dùng TikTok, chỉ dùng Instagram, và dùng cả hai (platform_usage) có sự chênh lệch ra sao về kết quả học tập (academic_performance)
và mức độ căng thẳng (anxiety_level)?

Nhóm 2: Phân tích tương quan & Chẩn đoán (Diagnostic Analytics)
Kẻ cắp giấc ngủ: Có mối tương quan nghịch biến rõ rệt nào giữa thời gian dùng điện thoại trước khi ngủ (screen_time_before_sleep) và tổng số giờ ngủ (sleep_hours) không?

Nghịch lý giao tiếp xã hội: Những cá nhân có mức độ tương tác xã hội đời thực thấp (social_interaction_level = low) liệu có xu hướng bù đắp bằng cách tiêu tốn nhiều
daily_social_media_hours hơn những nhóm 'medium' và 'high' không?

Tác động "kép" đến sức khỏe tâm thần: Trong 3 biến: việc thiếu ngủ (sleep_hours), thời lượng dùng MXH (daily_social_media_hours), và mức độ nghiện (addiction_level),
yếu tố nào đẩy mức độ lo âu (anxiety_level) lên cao nhất?

Vai trò của thể chất: Hoạt động thể chất (physical_activity) có đóng vai trò như một "tấm khiên" bảo vệ sức khỏe tinh thần không? Hãy so sánh mức căng thẳng của nhóm
có vận động thể chất cao với nhóm thấp, trong điều kiện cả hai nhóm có cùng thời lượng dùng MXH.

Nhóm 3: Phân khúc sâu & Đề xuất hành động (Advanced Analytics)
Chân dung nhóm rủi ro cao (High-Risk Persona): Hãy dùng SQL (kết hợp CTE và CASE WHEN) để lọc ra nhóm người dùng có dấu hiệu đáng báo động (Ví dụ quy ước: sleep_hours < 5,
anxiety_level > 7, stress_level > 7). Nhóm này có chung đặc điểm gì về nền tảng sử dụng và thói quen trước khi ngủ?

Tìm kiếm ngưỡng an toàn (Tipping Point): Từ dữ liệu điểm học tập (academic_performance), em hãy gom nhóm và tìm ra "điểm gãy" – tức là vượt qua mốc bao nhiêu giờ
daily_social_media_hours thì điểm học tập bắt đầu lao dốc một cách rõ rệt nhất?

Phân tích nhãn Trầm cảm (depression_label): Đâu là những đặc điểm nhận diện rõ ràng nhất của nhóm được gắn nhãn trầm cảm (depression_label = 1) so với nhóm bằng 0?
Nhóm này có dùng MXH nhiều hơn mức bình thường không?

Tóm lược Insight (The "So What?"): Dựa trên toàn bộ phân tích trên, nếu được yêu cầu thiết kế một Dashboard cảnh báo sức khỏe học đường trên Power BI, em sẽ chọn ra
3 chỉ số/biểu đồ nào là quan trọng nhất để thuyết trình cho Ban Giám hiệu, và giải pháp em đề xuất từ số liệu đó là gì?
