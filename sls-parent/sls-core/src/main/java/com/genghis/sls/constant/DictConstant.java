package com.genghis.sls.constant;

/**
 * 公共常量
 *
 * @author chenl
 * @version 1.0.1
 */

public class DictConstant {
    private DictConstant() {
    }

    public static final String STATE = "state";
    // 状态1-已启用
    public static final int STATE_IN_USE = 1;
    // 状态0-未启用
    public static final int STATE_NO_USE = 0;

    // 默认值
    public static final int VOID_VALUE = -1;
    // A、B分数默认值
    public static final int A_B_VALUE = 0;
    // 系统整型默认值
    public static final int DEFAULT_VALUE = 0;

    //在年份后面加月份以及日期
    public static final String ADD_DATE = "-01-01";

    //业绩类型
    public static final String PERFORMANCE_CATEGORY = "performance_category";
    //业绩等级
    public static final String PERFORMANCE_GRADE = "performance_grade";
    //校内使用
    public static final String IS_USED = "is_used";
    //论文等级
    public static final String PAPER_GRADE = "paper_grade";
    //学院（院室）
    public static final String DEPARTMENT = "department";
    //学历
    public static final String PARTICIPATE_EDUCATION = "participate_education";
    // 教研室(科室)
    public static final String OFFICE = "office";
    //职称
    public static final String TITLE = "title";
    //破格
    public static final String BREAK_RULE = "break_rule";
    //年度考核
    public static final String YEAR_ASSESS = "year_assess";
    //前置职称
    public static final String FRONT_TITLE_ID = "front_title_id";
    //外语等级
    public static final String LANGUAGE_GRADE_ID = "language_grade_id";
    //计算机证书科目
    public static final String COMPUTER_SUBJECT = "computer_subject";
    //转载
    public static final String IS_REPRINT = "yes_no";

    //角色为评委
    public static final String ROLE_JUDGE = "评委";
    //角色为主席
    public static final String ROLE_CHAIRMAN = "主席";
    //角色为教职工
    public static final String ROLE_CANDIDATE = "教职工";
    //角色名人事处审核
    public static final String ROLE_NAME_AUDIT_PERSONNEL = "人事处审核";
    //角色名高教所审核
    public static final String ROLE_NAME_AUDIT_EDUCATION = "高教所审核";
    //角色名科研处审核
    public static final String ROLE_NAME_AUDIT_RESEARCH = "科研处审核";
    //角色名研究生审核
    public static final String ROLE_NAME_AUDIT_POSTGRADUATE = "研究生审核";
    //角色名本科生审核
    public static final String ROLE_NAME_AUDIT_UNDERGRADUATE = "本科生审核";
    //角色名国际交流审核
    public static final String ROLE_NAME_AUDIT_INTERNATIONAL = "国际交流审核";
    //角色名质量监控
    public static final String ROLE_NAME_AUDIT_QUALITY = "质量监控";
    //角色名教务处综审
    public static final String ROLE_NAME_AUDIT_REGISTRY = "教务处综审";
    //角色名国际交流审核
    public static final String ROLE_NAME_AUDIT_FINALAUDIT = "最终审核";

    //教学
    public static final String RESEARCH = "教学";
    //科研
    public static final String SENATE = "科研";
    //人事
    public static final String PERSONNEL = "人事";

    //性别
    public static final String SEX = "sex";
    //性别 男
    public static final String SEX_MALE = "1";
    //性别 女
    public static final String SEX_FEMALE = "0";
    //性别 男
    public static final String SHOW_SEX_MALE = "男";
    //性别 女
    public static final String SHOW_SEX_FEMALE = "女";


    //排序编辑状态
    public static final String SORT_EDIT_STATE = "sort_edit_state";
    //排序状态1 未排序
    public static final int SORT_STATE_1 = 1;
    //排序状态2 进行中
    public static final int SORT_STATE_2 = 2;
    //排序状态3  未公示
    public static final int SORT_STATE_3 = 3;
    //排序状态4  已公示
    public static final int SORT_STATE_4 = 4;
    //排序结果状态
    public static final String SORT_RESULT_STATE = "sort_result_state";
    //排序结果状态1 未确认
    public static final int SORT_RESULT_STATE_1 = 1;
    //排序结果状态2 作废
    public static final int SORT_RESULT_STATE_2 = 2;
    //排序结果状态3  公示
    public static final int SORT_RESULT_STATE_3 = 3;

    //交费状态
    public static final String PAY_STATE = "pay_state";
    //未交费
    public static final int PAY_STATE_0 = 0;
    //已交费
    public static final int PAY_STATE_1 = 1;

    //公示状态
    public static final String PUBLICITY_STATE = "publicity_state";
    //未公示
    public static final int PUBLICITY_STATE_0 = 0;
    //已公示
    public static final int PUBLICITY_STATE_1 = 1;

    //允许并列
    public static final int ALLOW_PARALLEL = 1;
    //不允许并列
    public static final int NOT_ALLOW_PARALLEL = 0;

    //排序
    public static final int IS_SORT = 1;
    //不排序
    public static final int NOT_SORT = 0;

    //胜出
    public static final int WINNING = 1;
    //未胜出
    public static final int NO_WINNING = 0;

    //操作符
    public static final String OPERATORS_T = "operators_t";
    //操作符名称
    public static final String OPERATORS_NAME_T = "operators_name_t";

    //操作符
    public static final String OPERATORS_J = "operators_j";
    //操作符名称
    public static final String OPERATORS_NAME_J = "operators_name_j";
    //筛选规则
    public static final String PROMOTION_RULE = "promotion_rule";
    //评委组
    public static final String JUDGE_GROUP_ID = "groupJudgesValue";
    //教职工候选组
    public static final String GROUP_CANDIDATE_VALUE = "groupCandidateValue";
    //学院候选组
    public static final String GROUP_DEPARTMENT_VOTE = "groupDepartmentVote";

    //申报职称
    public static final String APPLY_TITLE = "apply_title";
    //申报状态
    public static final String APPLY_STATE = "apply_state";
    //申报状态 未审核
    public static final int APPLY_STATE_1 = 1;
    //申报状态 学院审核
    public static final int APPLY_STATE_2 = 2;
    //申报状态 校级审核
    public static final int APPLY_STATE_3 = 3;
    //申报状态 终审
    public static final int APPLY_STATE_4 = 4;
    //申报状态 公示
    public static final int APPLY_STATE_5 = 5;

    //是否专业破格 0未破格，1破格
    public static final String IS_MAJOR_BREAK = "is_major_break";
    //获奖类别 1论文，2著作, 3项目
    public static final String AWARD_CATEGORY = "award_category";
    //考核结果 0不合格， 1合格
    public static final String CHECK_RESULT = "check_result";
    //是否有教学事故0否，1是
    public static final String IS_ACCIDENT = "is_accident";
    //教师培养验收 0否,1是
    public static final String IS_PASS_CHECK = "is_pass_check";
    //学位类别 0专科, 1本科, 2硕士研究生, 3博士研究生, 4博士后
    public static final String DEGREE_CATEGORY = "degree_category";
    //资格证书类型ID 1外语, 2计算机
    public static final String QUALIFICATION_TYPE = "qualification_type";
    //资格审核的状态 0未审核 1通过 2未通过
    public static final String QUALIFY_AUDIT_STATE = "qualify_audit_state";
    //资格审核的状态 0未审核
    public static final int QUALIFY_AUDIT_STATE_0 = 0;
    //资格审核的状态 1通过
    public static final int QUALIFY_AUDIT_STATE_1 = 1;
    //资格审核的状态 2未通过
    public static final int QUALIFY_AUDIT_STATE_2 = 2;

    public static final String VOTE_STATE = "vote_state";
    //学年评价
    public static final String EVALUATE_RESULT = "evaluate_result";
    //学期
    public static final String SEMESTER = "semester";

    //本科生
    public static final int LESSON_TYPE_ID_1 = 1;
    //国际交流
    public static final int LESSON_TYPE_ID_2 = 2;


    //投票状态1 未投票
    public static final int VOTE_STATE_1 = 1;
    //投票状态2 进行中
    public static final int VOTE_STATE_2 = 2;
    //投票状态3  未公示
    public static final int VOTE_STATE_3 = 3;
    //投票状态4  已公示
    public static final int VOTE_STATE_4 = 4;


    //投票结果状态1 未确认
    public static final int VOTE_RESULT_STATE_1 = 1;
    //投票结果状态2 作废
    public static final int VOTE_RESULT_STATE_2 = 2;
    //投票结果状态3  通过
    public static final int VOTE_RESULT_STATE_3 = 3;


    //  未投票
    public static final String NOT_VOTE = "未投票";
    //  已投票
    public static final String VOTED = "已投票";

    //投票轮次第一轮
    public static final int VOTE_ROUND_1 = 1;

    //没有胜出
    public static final int IS_WINNING_NO = 0;

    //分割显示年份
    public static final int SUBSTRING_YEAR_LENGTH = 4;

    //为学生投票
    public static final int VOTE_TYPE_1 = 1;
    //为学院投票
    public static final int VOTE_TYPE_2 = 2;

    //晋级
    public static final int PROMOTION = 1;
    //淘汰
    public static final int ELIMINATE = 0;

    //审核类别
    public static final String AUDIT_CATEGORY = "audit_category";
    //审核类别,学院
    public static final int AUDIT_CATEGORY_1 = 1;
    //审核类别,国际交流
    public static final int AUDIT_CATEGORY_2 = 2;
    //审核类别,研究生
    public static final int AUDIT_CATEGORY_3 = 3;
    //审核类别,本科生
    public static final int AUDIT_CATEGORY_4 = 4;
    //审核类别,质量监控
    public static final int AUDIT_CATEGORY_5 = 5;
    //审核类别,人事处
    public static final int AUDIT_CATEGORY_6 = 6;
    //审核类别,科研处
    public static final int AUDIT_CATEGORY_7 = 7;
    //审核类别,高教所
    public static final int AUDIT_CATEGORY_8 = 8;
    //审核类别,体育
    public static final int AUDIT_CATEGORY_9 = 9;
    //审核类别,教务处
    public static final int AUDIT_CATEGORY_10 = 10;
    //审核类别,终审
    public static final int AUDIT_CATEGORY_11 = 11;
    //审核类别,终审公示
    public static final int AUDIT_CATEGORY_12 = 12;
    //审核状态
    public static final String AUDIT_STATE = "audit_state";
    //审核状态,未审核
    public static final int AUDIT_STATE_0 = 0;
    //审核状态,已审核
    public static final int AUDIT_STATE_1 = 1;
    //审核状态,已提交
    public static final int AUDIT_STATE_2 = 2;
    //审核状态,驳回
    public static final int AUDIT_STATE_3 = 3;
    //审核状态,未公示
    public static final int AUDIT_STATE_4 = 4;
    //审核状态,已公示
    public static final int AUDIT_STATE_5 = 5;
    //审核状态,公示结束
    public static final int AUDIT_STATE_6 = 6;
    //审核状态,资格审核
    public static final int AUDIT_STATE_7 = 7;
    //审核状态,终审结束
    public static final int AUDIT_STATE_8 = 8;

    //staffPersonnel表名
    public static final String STAFF_PERSONNEL_AWARD = "staff_personnel_award";
    //staffEducation表名
    public static final String STAFF_EDUCATION_AWARD = "staff_education_award";

    public static final String STAFF_EDUCATION_BOOK = "staff_education_book";

    public static final String STAFF_EDUCATION_NEWSPAPER = "staff_education_newspaper";

    public static final String STAFF_EDUCATION_PAPER = "staff_education_paper";

    public static final String STAFF_EDUCATION_PROJECT = "staff_education_project";
    //staffResearch表名
    public static final String STAFF_RESEARCH_AWARD = "staff_research_award";

    public static final String STAFF_RESEARCH_BOOK = "staff_research_book";

    public static final String STAFF_RESEARCH_CONFERENCE = "staff_research_conference";

    public static final String STAFF_RESEARCH_DIGEST = "staff_research_digest";

    public static final String STAFF_RESEARCH_EI = "staff_research_ei";

    public static final String STAFF_RESEARCH_JOURNAL = "staff_research_journal";

    public static final String STAFF_RESEARCH_PATENT = "staff_research_patent";

    public static final String STAFF_RESEARCH_PROJECT = "staff_research_project";

    public static final String STAFF_RESEARCH_SCI = "staff_research_sci";

    //staffSenate表名
    public static final String STAFF_SENATE_ACHIEVE = "staff_senate_achieve";

    public static final String STAFF_SENATE_AWARD = "staff_senate_award";

    public static final String STAFF_SENATE_BOOK = "staff_senate_book";

    public static final String STAFF_SENATE_COURSE = "staff_senate_course";

    public static final String STAFF_SENATE_MATCH = "staff_senate_match";

    public static final String STAFF_SENATE_PROJECT = "staff_senate_project";

    public static final String STAFF_POSTGRADUATE_LESSON = "staff_postgraduate_lesson";

    public static final String STAFF_POSTGRADUATE_PAPER = "staff_postgraduate_paper";

    public static final String STAFF_LESSON = "staff_lesson";

    public static final String STAFF_LESSON_UNDERGRADUATE = "staff_lesson_undergraduate";

    public static final String STAFF_LESSON_INTERNATIONAL = "staff_lesson_international";

    public static final String STAFF_LESSON_QUALIFY = "staff_lesson_qualify";

    //表audit_process_control的字段名，用来作为改变audit_process_control表状态的参数
    public static final String AUDIT_PROCESS_CONTROL_PERSONNEL_AUDIT_STATE = "personnel_audit_state";

    public static final String AUDIT_PROCESS_CONTROL_RESEARCH_AUDIT_STATE = "research_audit_state";

    public static final String AUDIT_PROCESS_CONTROL_INTERNATIONAL_AUDIT_STATE = "international_audit_state";

    public static final String AUDIT_PROCESS_CONTROL_POSTGRADUATE_AUDIT_STATE = "postgraduate_audit_state";

    public static final String AUDIT_PROCESS_CONTROL_UNDERGRADUATE_AUDIT_STATE = "undergraduate_audit_state";

    public static final String AUDIT_PROCESS_CONTROL_QUALITY_AUDIT_STATE = "quality_audit_state";

    public static final String AUDIT_PROCESS_CONTROL_SENATE_AUDIT_STATE = "senate_audit_state";

    public static final String AUDIT_PROCESS_CONTROL_HIGH_EDUCATION_AUDIT_STATE = "high_education_audit_state";

    public static final String AUDIT_PROCESS_CONTROL_PAY_STATE = "pay_state";

    public static final String AUDIT_PROCESS_CONTROL_QUALIFY_PUBLICITY_STATE = "qualify_publicity_state";

    public static final String AUDIT_PROCESS_CONTROL_FINAL_AUDIT_STATE = "final_audit_state";

    public static final String AUDIT_PROCESS_CONTROL_DEPARTMENT_AUDIT_STATE = "department_audit_state";
}