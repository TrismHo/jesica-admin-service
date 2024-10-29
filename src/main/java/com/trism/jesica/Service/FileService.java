package com.trism.jesica.Service;

import com.trism.jesica.persistence.mysql.Entitiy.file.TbFile;
import com.trism.jesica.persistence.mysql.Repository.file.TbFileRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service
@Slf4j
public class FileService {
    private final TbFileRepository fileRepository;

    @Transactional(readOnly = true)
    public List<TbFile> getFileList(Long libNo) {
        return fileRepository.findByLibNo(libNo);
    }


}

