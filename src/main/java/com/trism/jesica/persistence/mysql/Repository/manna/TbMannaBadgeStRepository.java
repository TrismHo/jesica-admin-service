package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaBadgeSt;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaBadgeStId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface TbMannaBadgeStRepository
        extends JpaRepository<TbMannaBadgeSt, TbMannaBadgeStId> {


    /**
     * 특정 뱃지 파일에 연결된 가맹점 목록
     */
    List<TbMannaBadgeSt> findByBadgeFileNoOrderByInsertDateDesc(
            Long badgeFileNo
    );

    /**
     * 뱃지 파일 번호로 가맹점 매핑 전체 삭제
     */
    @Transactional
    int deleteByBadgeFileNo(Long badgeFileNo);
}
